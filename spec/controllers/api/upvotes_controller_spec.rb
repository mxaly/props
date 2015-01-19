require 'rails_helper'

describe Api::UpvotesController do
  let(:user) { double(:user, id: 5) }
  let(:prop) { build(:prop, id: 8) }
  let(:props_repository) { double(:props_repository) }
  let(:upvotes_repository) { double(:upvotes_repository) }
  let(:upvote_service) { double(:upvote_service, call: upvote_result) }
  let(:upvote_result) { double success?: true, data: prop }

  describe '#POST create' do
    before do
      sign_in(user)
      allow(controller).to receive(:props_repository)
        .and_return(props_repository)
      allow(controller).to receive(:upvotes_repository)
        .and_return(upvotes_repository)
      expect(props_repository).to receive(:find).with(prop.id.to_s) { prop }
      allow(Props::Upvote).to receive(:new).and_return(upvote_service)
      post :create, prop_id: prop.id
    end

    it 'calls Props::Upvote service' do
      expect(Props::Upvote).to have_received(:new)
        .with(prop: prop, user: user, upvotes_repository: upvotes_repository)
    end

    context 'when uvpote is created successfuly' do
      it 'renders JSON with prop attributes' do
        expect(json_response['id']).to eq prop.id
        expect(json_response['body']).to eq prop.body
      end
    end

    context 'when there are some errors on upvote save' do
      let(:upvote_result) { double success?: false, errors: ['Fatal error'] }

      it 'returns 422 status when something went wrong' do
        expect(response.status.to_i).to eq 422
        expect(json_response['errors']).to eq ['Fatal error']
      end
    end
  end
end
