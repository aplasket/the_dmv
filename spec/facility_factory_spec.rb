require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_a(FacilityFactory)
      expect(@oregon_facilities.sample).to be_an(Hash)
      expect(@new_york_facilities.sample).to be_an(Hash)
      expect(@missouri_facilities.sample).to be_an(Hash)
    end
  end

  before(:each) do
    @oregon = @factory.create_facilities(@oregon_facilities, :OR)
    @new_york = @factory.create_facilities(@new_york_facilities, :NY)
    @missouri = @factory.create_facilities(@missouri_facilities, :MO)
  end

  describe '#creates facilities' do
    it 'returns an array of facilities' do
      expect(@oregon).to be_an(Array)
      expect(@new_york).to be_an(Array)
      expect(@missouri).to be_an(Array)
    end
  end
  
  describe '#oregon processing' do
    it 'creates oregon facility objects' do
      expect(@oregon.first).to be_a(Facility)
      expect(@oregon.sample).to be_a(Facility)
    end
    
    it 'formats :OR facility attributes' do
      expect(@oregon.first.name).to eq("Albany DMV Office")
      expect(@oregon.sample.name).to be_a(String)
      expect(@oregon.first.address).to eq("2242 Santiam Hwy SE Albany OR 97321")
      expect(@oregon.sample.address).to be_a(String)
      expect(@oregon.sample.services).to eq([])
      expect(@oregon.sample.registered_vehicles).to eq([])
      expect(@oregon.sample.collected_fees).to eq(0)
    end
    
    it 'formats :OR facility phone number' do
      expect(@oregon.first.phone).to eq("541-967-2014")
      expect(@oregon.sample.phone).to be_a(String)
    end
end

  describe '#new york processing' do
    it 'creates new york facility objects' do
      expect(@new_york.first).to be_a(Facility)
      expect(@new_york.sample).to be_a(Facility)
    end

    it 'formats :NY facility attributes' do
      expect(@new_york.first.name).to eq("Selden DMV Office")
      expect(@new_york.sample.name).to be_a(String)
      expect(@new_york.first.address).to eq("407 SELDEN RD SELDEN NY 11784")
      expect(@new_york.sample.address).to be_a(String)
      expect(@new_york.sample.services).to eq([])
      expect(@new_york.sample.registered_vehicles).to eq([])
      expect(@new_york.sample.collected_fees).to eq(0)
    end

    it 'formats :NY facility phone number' do
      expect(@new_york.first.phone).to eq(nil)
      expect(@new_york.sample.address).to be_a(String)
    end
  end

  describe '#missouri processing' do
    it 'creates missouri facility objects' do
      expect(@missouri.first).to be_a(Facility)
      expect(@missouri.sample).to be_a(Facility)
    end

    it 'formats :MO facility attributes' do
      expect(@missouri.first.name).to eq("Oakville DMV Office")
      expect(@missouri.first.address).to eq("3164 TELEGRAPH ROAD ST LOUIS MO 63125")
      expect(@missouri.sample.name).to be_a(String)
      expect(@missouri.sample.address).to be_a(String)
      expect(@missouri.sample.services).to eq([])
      expect(@missouri.sample.registered_vehicles).to eq([])
      expect(@missouri.sample.collected_fees).to eq(0)

    end

    it 'formats :MO facility phone number' do
      expect(@missouri.first.phone).to eq("314-887-1050")
      expect(@missouri.sample.phone).to be_a(String)
    end
  end
end