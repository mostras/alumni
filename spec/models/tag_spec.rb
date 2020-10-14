require 'rails_helper'

RSpec.describe Tag, :type => :model do
  let(:user) { FactoryBot.create(:user) }
  let(:diploma) { FactoryBot.create(:diploma) }

  context "with valid attributes" do
    subject { Tag.new user: user, diploma: diploma, year: 2017 }

    it "it should not be valid without diploma" do
      subject.diploma = nil
      expect(subject).to_not be_valid
    end

    it "it should not be valid without diploma" do
      subject.year = ''
      expect(subject).to_not be_valid
    end
  end
end
