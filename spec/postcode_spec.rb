require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('b601ja') #input a postcode
      @uk_countries = ['England','Wales','Scotland','Northen Ireland']
    end

    it "should respond with a status message of 200" do
        expect(@response['status']).to eq 200
    end

    it "should have a results hash" do
        expect(@response['result']).to be_a Hash
    end

    it "should return a postcode between 5-7 in length"  do
        expect(@response['result']['postcode'].length).to be_between(5,7)
    end

    it "should return an quality key integer between 1-9" do
        expect(@response['result']['quality']).to be_kind_of(Integer)
        expect(@response['result']['quality']).to be_between(1,9)
    end

    it "should return an ordnance survey eastings value as integer" do
        expect(@response['result']['eastings']).to be_a Integer
    end

    it "should return an ordnance survey eastings value as integer" do
        expect(@response['result']['eastings']).to be_a Integer
    end

    it "should return a country which is one of the four constituent countries of the UK" do
        expect(@response['result']['country']).to match(@uk_countries[0])
    end

    it "should return a string value for NHS authority " do
        expect(@response['result']['nhs_ha']).to be_a String
    end

    it "should return a longitude float value" do
        expect(@response['result']['longitude']).to be_a Float
    end

    it "should return a latitude float value" do
        expect(@response['result']['latitude']).to be_a Float
    end

    it "should return a parliamentary constituency string" do
        expect(@response['result']['parliamentary_constituency']).to be_kind_of String
    end

    it "should return a european_electoral_region string" do
        expect(@response['result']['european_electoral_region']).to be_kind_of String
    end

    it "should return a primary_care_trust string" do
        expect(@response['result']['primary_care_trust']).to be_kind_of String
    end

    it "should return a region string" do
        expect(@response['result']['region']).to be_kind_of String
    end

    it "should return a parish string" do
        expect(@response['result']['parish']).to be_kind_of String
    end

    it "should return a lsoa string" do
        expect(@response['result']['lsoa']).to be_kind_of String
    end

    it "should return a msoa string" do
        expect(@response['result']['msoa']).to be_kind_of String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
        expect(@response['result']['codes']['admin_district']).to be_kind_of String
    end

    it "should return a incode string of three characters" do
        expect(@response['result']['incode'].length).to be(3)
    end

    it "should return a msoa string" do
        expect(@response['result']['msoa']).to be_kind_of String
    end

    it "should return a incode string of 3-4 characters" do
        expect(@response['result']['incode'].length).to be_between(3,4)
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(['RM13 8HQ', 'E6 5YP'])
       @first_result = @response['result'][0]
       @second_result = @response['result'][1]
    end

    it "should respond with a status message of 200" do
        expect(@response['status']).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
        expect(@first_result['query']).to eq "RM13 8HQ"
    end

    it "should return the second query as the first postcode in the response" do
        expect(@second_result['query']).to eq "E6 5YP"
    end

    it "should have a results hash" do
        expect(@response.class).to be Hash
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@first_result["result"]["postcode"].length).to be_between(5, 7)
    end
    it "should return an quality key integer between 1-9" do
      expect(@first_result["result"]["quality"]).to be_a(Integer)
      expect(@first_result["result"]["quality"]).to be_between(1, 9)
    end
    it "should return an ordnance survey eastings value as integer" do
      expect(@first_result["result"]["eastings"]).to be_a(Integer)
    end
    it "should return an ordnance survey northings value as integer" do
      expect(@first_result["result"]["northings"]).to be_a(Integer)
    end
    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@first_result["result"]["country"]).to include('England')
    end
    it "should return a string value for NHS authority " do
      expect(@first_result["result"]["nhs_ha"]).to be_a(String)
    end
    it "should return a longitude float value" do
      expect(@first_result["result"]["longitude"]).to be_a(Float)
    end
    it "should return a latitude float value" do
      expect(@first_result["result"]["latitude"]).to be_a(Float)
    end
    it "should return a parliamentary constituency string" do
      expect(@first_result["result"]["parliamentary_constituency"]).to be_a(String)
    end
    it "should return a european_electoral_region string" do
      expect(@first_result["result"]["european_electoral_region"]).to be_a(String)
    end
    it "should return a primary_care_trust string" do
      expect(@first_result["result"]["primary_care_trust"]).to be_a(String)
    end
    it "should return a region string" do
      expect(@first_result["result"]["region"]).to be_a(String)
    end
    it "should return a parish string" do
      expect(@first_result["result"]["parish"]).to be_a(String)
    end
    it "should return a lsoa string" do
      expect(@first_result["result"]["lsoa"]).to be_a(String)
    end
    it "should return a msoa string" do
      expect(@first_result["result"]["msoa"]).to be_a(String)
    end
    # admin ward and county are not documented however tested below
    it "should return a admin_district string" do
      expect(@first_result["result"]["admin_district"]).to be_a(String)
    end
    it "should return a incode string of three characters" do
      expect(@first_result["result"]["incode"]).to be_a(String)
      expect(@first_result["result"]["incode"].length).to eq 3
    end
    it "should return a msoa string" do
      expect(@first_result["result"]["msoa"]).to be_a(String)
    end
    it "should return a incode string of 3-4 characters" do
      expect(@first_result["result"]["msoa"]).to be_a(String)
      expect(@first_result["result"]["incode"].length).to be_between(3, 4)
    end
    it "should have a results hash" do
      expect(@second_result).to be_a(Hash)
    end
    it "should return a postcode between 5-7 in length"  do
      expect(@second_result["result"]["postcode"].length).to be_between(5, 7)
    end
    it "should return an quality key integer between 1-9" do
      expect(@second_result["result"]["quality"]).to be_a(Integer)
      expect(@second_result["result"]["quality"]).to be_between(1, 9)
    end
    it "should return an ordnance survey eastings value as integer" do
      expect(@second_result["result"]["eastings"]).to be_a(Integer)
    end
    it "should return an ordnance survey northings value as integer" do
      expect(@second_result["result"]["northings"]).to be_a(Integer)
    end
    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@second_result["result"]["postcode"].length).to be_between(5, 7)
    end
    it "should return a string value for NHS authority " do
      expect(@second_result["result"]["country"]).to include('England')
    end
    it "should return a longitude float value" do
      expect(@second_result["result"]["longitude"]).to be_a(Float)
    end
    it "should return a latitude float value" do
      expect(@second_result["result"]["latitude"]).to be_a(Float)
    end
    it "should return a parliamentary constituency string" do
      expect(@second_result["result"]["parliamentary_constituency"]).to be_a(String)
    end
    it "should return a european_electoral_region string" do
      expect(@second_result["result"]["european_electoral_region"]).to be_a(String)
    end
    it "should return a primary_care_trust string" do
      expect(@second_result["result"]["primary_care_trust"]).to be_a(String)
    end
    it "should return a region string" do
      expect(@second_result["result"]["region"]).to be_a(String)
    end
    it "should return a parish string" do
      expect(@second_result["result"]["parish"]).to be_a(String)
    end
    it "should return a lsoa string" do
      expect(@second_result["result"]["lsoa"]).to be_a(String)
    end
    it "should return a msoa string" do
      expect(@second_result["result"]["msoa"]).to be_a(String)
    end
    # admin ward and county are not documented however tested below
    it "should return a admin_district string" do
      expect(@second_result["result"]["admin_district"]).to be_a(String)
    end
    it "should return a incode string of three characters" do
      expect(@second_result["result"]["incode"]).to be_a(String)
      expect(@second_result["result"]["incode"].length).to eq 3
    end
    it "should return a msoa string" do
      expect(@first_result["result"]["msoa"]).to be_a(String)
    end
    it "should return a incode string of 3-4 characters" do
      expect(@first_result["result"]["incode"]).to be_a(String)
      expect(@first_result["result"]["incode"].length).to be_between(3, 4)
    end

  end


end
