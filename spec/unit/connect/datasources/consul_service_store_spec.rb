require 'spec_helper'
require 'connect/datasources/consul_service_store'

RSpec.describe Connect::Datasources::ConsulServiceStore do

  describe '#initialize' do
    it_behaves_like 'a consul_initializer'
  end

  describe "#lookup" do

    let(:data_source) { described_class.new('data_source_type')}    

    it 'asks the consul server for the data' do
      expect(::Diplomat::Service).to receive(:get).with('service_name')
      data_source.lookup('service_name')
    end

  end

end

