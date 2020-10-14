require 'rails_helper'

RSpec.describe School, :type => :model do

  context "callbacks" do
    subject { School.create name: 'business school' }

    it "it should titleize the name" do
      expect(subject.name).to eq('Business School')
    end
  end
end
