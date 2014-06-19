require 'spec_helper'

describe Api::PropsController do
  describe '#index' do
    let(:attrs) do
      { user_id: '1', propser_id: '2' }.as_json
    end
    let(:props) { [Prop.new(id: 3), Prop.new(id: 4)]}
    let(:props_search) { double(:props_search, results: props)}
    let(:props_repository) { double(:props_repository, search: props_search) }

    before do
      sign_in
      allow(controller).to receive(:props_repository)
        .and_return(props_repository)
      get :index, attrs
    end

    it_behaves_like 'a successful JSON request'

    it 'passes correct attributes to search method' do
      expect(props_repository).to have_received(:search).with(attrs)
    end

    it 'returns search results' do
      expect(json_response.class).to be Array
      expect(json_response.count).to eq 2
      expect(json_response.first['id']).to eq props.first.id
    end
  end
end
