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
       @first_result = @response[0]
       @second_result = @response[1]
    end

    it "should respond with a status message of 200" do
        expect(@response['status']).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
        expect(@response['result'].first.first.last).to eq "RM13 8HQ"
    end

    it "should return the second query as the first postcode in the response" do
        expect(@response['result'].first.first.last).to eq "RM13 8HQ"
    end

    it "should have a results hash" do
        expect(@response.class).to be Hash
    end

    it "should return a postcode between 5-7 in length"  do
        expect(@response['result']['query']['postcode'].length).to be_between(5,7)
    end

    it "should return an quality key integer between 1-9" do
        pending
    end

    it "should return an ordnance survey eastings value as integer" do
        pending
    end

    it "should return an ordnance survey eastings value as integer" do
        pending
    end

    it "should return a country which is one of the four constituent countries of the UK" do
        pending
    end

    it "should return a string value for NHS authority " do
        pending
    end

    it "should return a longitude float value" do
        pending
    end

    it "should return a latitude float value" do
        pending
    end

    it "should return a parliamentary constituency string" do
        pending
    end

    it "should return a european_electoral_region string" do
        pending
    end

    it "should return a primary_care_trust string" do
        pending
    end

    it "should return a region string" do
        pending
    end

    it "should return a parish string" do
        pending
    end

    it "should return a lsoa string" do
        pending
    end

    it "should return a msoa string" do
        pending
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
        pending
    end

    it "should return a incode string of three characters" do
        pending
    end

    it "should return a msoa string" do
        pending
    end

    # second values go here

    it "should return a incode string of 3-4 characters" do
        pending
    end

    it "should have a results hash" do
        pending
    end

    it "should return a postcode between 5-7 in length"  do
        pending
    end

    it "should return an quality key integer between 1-9" do
        pending
    end

    it "should return an ordnance survey eastings value as integer" do
        pending
    end

    it "should return an ordnance survey eastings value as integer" do
        pending
    end

    it "should return a country which is one of the four constituent countries of the UK" do
        pending
    end

    it "should return a string value for NHS authority " do
        pending
    end

    it "should return a longitude float value" do
        pending
    end

    it "should return a latitude float value" do
        pending
    end

    it "should return a parliamentary constituency string" do
        pending
    end

    it "should return a european_electoral_region string" do
        pending
    end

    it "should return a primary_care_trust string" do
        pending
    end

    it "should return a region string" do
        pending
    end

    it "should return a parish string" do
        pending
    end

    it "should return a lsoa string" do
        pending
    end

    it "should return a msoa string" do
        pending
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
        pending
    end

    it "should return a incode string of three characters" do
        pending
    end

    it "should return a msoa string" do
        pending
    end

    it "should return a incode string of 3-4 characters" do
        pending
    end

  end


end
