require 'rails_helper'

describe Api::PropsController do
  let(:user) { double(:user, id: 5) }

  describe '#index' do
    let(:attrs) do
      { user_id: '1', propser_id: '2' }.as_json
    end
    let(:props) { [Prop.new(id: 3), Prop.new(id: 4)] }
    let(:paginated_props) { Kaminari.paginate_array(props) }
    let(:props_search) { double(:props_search, results: paginated_props) }
    let(:props_repository) { double(:props_repository, search: props_search) }

    before do
      sign_in(user)
      allow(controller).to receive(:props_repository)
        .and_return(props_repository)
      get :index, attrs
    end

    it_behaves_like 'a successful JSON request'

    it 'passes correct attributes including upvotes status to search method' do
      expected_attrs = attrs.merge!(show_upvote_status_for_user_id: user.id)
      expect(props_repository).to have_received(:search).with(expected_attrs)
    end

    it 'returns search results' do
      results = json_response['props']
      expect(results.class).to be Array
      expect(results.count).to eq 2
      expect(results.first['id']).to eq props.first.id
    end

    it 'returns meta key with pagination data' do
      results = json_response['meta']
      expect(results['current_page']).to eq 1
      expect(results['total_count']).to eq 2
      expect(results['total_pages']).to eq 1
    end

    it 'returns hash of objects' do
      expect(json_response.keys).to include 'props'
      expect(json_response.keys).to include 'meta'
    end
  end

  describe '#create' do
    let(:attrs) { prop_attrs.as_json }
    let(:prop) { Prop.new }
    let(:props_repository) { double(:props_repository, add: prop) }

    before do
      sign_in(user)
      allow(controller).to receive(:props_repository)
        .and_return(props_repository)
      expect(prop).to receive(:persisted?).and_return(true)
      allow(Slack::Notifier).to receive(:new).and_return(double(ping: true))
      post :create, attrs
    end

    context 'with valid attributes' do
      let(:prop_attrs) { { user_ids: '1,2,3', body: 'body' }.as_json }

      it_behaves_like 'a successful JSON request'

      it 'passes correct attributes to repository' do
        expected_attrs = prop_attrs.merge('propser_id' => user.id)
        expect(props_repository).to have_received(:add).with(expected_attrs)
      end
    end
  end
end
