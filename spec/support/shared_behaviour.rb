RSpec.shared_examples "a consul_initializer" do 

  context 'no consul server specified' do

    it 'connects to the local consul server at the default port' do
      expect_any_instance_of(Diplomat::Configuration).to receive(:url=).with('http://localhost:8500')
      described_class.new('data_source_type')
    end

  end

  context 'a consul server specified' do
    it 'connects to the consul server at the specified url' do
      expect_any_instance_of(Diplomat::Configuration).to receive(:url=).with('http://farandaway:300')
      described_class.new('data_source_type', 'http://farandaway:300')
    end

  end

end