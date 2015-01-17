require 'rails_helper'

describe Api::V1::RankingsController do
  describe '#hero_of_the_week' do
    let(:mark) { create(:user) }
    let(:john) { create(:user) }
    let(:token) { double(EasyTokens::Token, owner: john, value: 'random_string') }
    let(:props) { [Prop.new(id: 3), Prop.new(id: 4)] }
    let(:props_repository) { double(:props_repository) }

    before do
      allow(controller).to receive(:props_repository)
        .and_return(props_repository)
      allow(EasyTokens::Token).to receive(:find_by_value).and_return(token)
      allow(EasyTokens::TokenValidator).to receive(:valid?).with(token.value).and_return(true)
      allow(props_repository).to receive_message_chain('all.where') { props }
      allow(controller).to receive(:propsed_users).and_return(mark.id => 3, john.id => 4)
      get :hero_of_the_week, { token: token.value }.as_json
    end

    it_behaves_like 'a successful JSON request'

    it 'returns most propsed user name with props count' do
      expect(response.body).to eq '{"user":"John","props_count":4}'
    end
  end
end
