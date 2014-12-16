require 'rails_helper'

describe UserPropsRepository do
  let(:user) { create(:user) }
  let(:repo) { described_class.new user }

  describe '#given' do
    it 'returns given props' do
      prop = create :prop, propser: user
      expect(repo.given).to eq [prop]
    end
  end

  describe '#received' do
    it 'returns received props' do
      prop = create :prop
      prop.users << user
      expect(repo.received).to eq [prop]
    end
  end
end
