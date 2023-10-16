require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'Purchase model' do
    let(:user) { User.create(name: 'naruto', email: 'naruto@gmail.com') }

    it 'should have an integer author_id' do
      purchase = Purchase.new(author_id: user.id, name: 'apple', amount: 11)
      purchase.author_id = nil
      expect(purchase).to_not be_valid
    end

    it 'name should be presence' do
      purchase = Purchase.new(author_id: user.id, name: 'apple', amount: 11)
      purchase.name = nil
      expect(purchase).to_not be_valid
    end

    it 'amount should be greater than or equal to zero' do
      purchase = Purchase.new(author_id: user.id, name: 'apple', amount: 11)
      purchase.amount = -1
      expect(purchase).to_not be_valid
    end
  end
end
