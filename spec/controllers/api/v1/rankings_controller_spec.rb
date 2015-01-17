require 'rails_helper'

describe Api::V1::RankingsController do
  describe '#hero_of_the_week' do
    let(:hero_of_the_week) do
      {
        user: 'John',
        props_count: 4,
      }
    end
    let(:ranking_repository) do
      double(:ranking_repository, hero_of_the_week: hero_of_the_week)
    end

    before do
      allow(controller).to receive(:ranking_repository)
        .and_return(ranking_repository)
      expect(controller).to receive(:validate_token) { true }
      get :hero_of_the_week, { token: 'foo' }.as_json
    end

    it_behaves_like 'a successful JSON request'

    it 'returns most propsed user name with props count' do
      expect(response.body).to eq '{"user":"John","props_count":4}'
    end
  end
end
