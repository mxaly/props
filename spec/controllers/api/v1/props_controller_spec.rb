require 'rails_helper'

describe Api::V1::PropsController do
  let(:user) { double(:user, id: 5) }
  let(:token) { double(EasyTokens::Token, owner: user, value: 'random_string') }

  describe '#index' do
    let(:attrs) do
      { user_id: '1', propser_id: '2' , token: token.value }.as_json
    end
    let(:props) { [Prop.new(id: 3), Prop.new(id: 4)] }
    let(:paginated_props) { Kaminari.paginate_array(props) }
    let(:props_search) { double(:props_search, results: paginated_props) }
    let(:props_repository) { double(:props_repository, search: props_search) }

    before do
      allow(controller).to receive(:props_repository)
        .and_return(props_repository)
      allow(EasyTokens::Token).to receive(:find_by_value).and_return(token)
      allow(EasyTokens::TokenValidator).to receive(:valid?).with(token.value).and_return(true)
    end

    context "current_user is not present" do
      before { get :index, attrs }

      it_behaves_like 'a successful JSON request'

      it 'passes correct attributes including upvotes status to search method' do
        expected_attrs = attrs.merge!(show_upvote_status_for_user_id: nil).except("token")
        expect(props_repository).to have_received(:search).with(expected_attrs)
      end
    end

    context "current_user is present" do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        get :index, attrs.merge(propser_email: 'mail@example.com')
      end

      it_behaves_like 'a successful JSON request'

      it 'passes correct attributes including upvotes status to search method' do
        expected_attrs = attrs.merge!(show_upvote_status_for_user_id: 5).except("token")
        expect(props_repository).to have_received(:search).with(expected_attrs)
      end
    end

    it 'returns search results' do
      get :index, attrs
      results = json_response['props']
      expect(results.class).to be Array
      expect(results.count).to eq 2
      expect(results.first['id']).to eq props.first.id
    end
  end

  describe '#create' do
    let(:prop_attrs) { { user_ids: '1,2,3', body: 'body', token: token.value, propser_email: 'mail@example.com' }.as_json }
    let(:prop) { Prop.new }
    let(:props_repository) { double(:props_repository, add: prop) }

    before do
      allow(controller).to receive(:props_repository)
        .and_return(props_repository)
      allow(EasyTokens::Token).to receive(:find_by_value).and_return(token)
      allow(EasyTokens::TokenValidator).to receive(:valid?).with(token.value).and_return(true)
      allow(Slack::Notifier).to receive(:new).and_return(double(ping: true))
    end

    context 'with valid attributes' do
      context 'current_user is present' do
        before do
          allow(controller).to receive(:current_user).and_return(user)
          expect(prop).to receive(:persisted?).and_return(true)
          post :create, prop_attrs
        end

        it_behaves_like 'a successful JSON request'

        it 'passes correct attributes to repository' do
          expected_attrs = prop_attrs.merge('propser_id' => user.id).except("token").except("propser_email")
          expect(props_repository).to have_received(:add).with(expected_attrs)
        end
      end

      context "current_user is not present" do
        it 'raises and error' do
          allow(controller).to receive(:current_user).and_return(nil)
          post :create, prop_attrs
          expect(response.body).to eq 'Missing propser email'
          expect(response.status).to eq 422
        end
      end
    end
  end
end
