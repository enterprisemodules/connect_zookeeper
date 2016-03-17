require 'spec_helper'
require 'connect/datasources/consul_value_store'

RSpec.describe Connect::Datasources::ConsulValueStore do

  describe '#initialize' do
    it_behaves_like 'a consul_initializer'
  end


  describe "#lookup" do

    let(:data_source) { described_class.new('data_source_type')}    

    it 'asks the consul server for the data' do
      expect(::Diplomat::Kv).to receive(:get).with('consul_key')
      data_source.lookup('consul_key')
    end
  end

end

