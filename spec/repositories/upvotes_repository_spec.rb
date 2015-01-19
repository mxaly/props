require 'rails_helper'

describe UpvotesRepository do
  let(:repo) { described_class.new }
  let(:user) { create(:user) }
  let(:prop) { create(:prop) }

  describe '#add' do
    let(:upvote) { Upvote.last }

    it 'creates an upvote' do
      expect { repo.add(prop, user) }.to change { Upvote.count }.by(1)
    end

    it 'increments upvotes_count on props' do
      expect do
        repo.add(prop, user)
      end.to change { prop.reload.upvotes_count }.by(1)
    end
  end
end
