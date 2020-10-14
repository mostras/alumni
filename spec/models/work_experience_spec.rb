require 'rails_helper'

RSpec.describe WorkExperience, :type => :model do
  let(:user) { FactoryBot.create(:user) }
  let(:company) { FactoryBot.create(:company) }

  context "vith valid attributes" do
    subject { WorkExperience.new title: 'Ingénieur', start_time: '2014', end_time: '2019', user: user, company: company }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without title" do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it "is not valid without a start date" do
      subject.start_time = ''
      expect(subject).to_not be_valid
    end

    it "is not valid without a end date" do
      subject.end_time = ''
      expect(subject).to_not be_valid
    end

    it "is not valid without a start date with 3 number" do
      subject.start_time = '200'
      expect(subject).to_not be_valid
    end

    it "is not valid without a end date with 3 number" do
      subject.start_time = '200'
      expect(subject).to_not be_valid
    end
  end

  context "set the end date" do
    subject { WorkExperience.new title: 'Ingénieur', start_time: '2014', user: user, company: company }

    it "should set end date to 'Aujourd'hui' when current true" do
      subject.current = true
      subject.save
      expect(subject.end_time).to eq("Aujourd'hui")
    end

    it "should set the current boolean true when end date 'Aujourd'hui' " do
      subject.end_time = "Aujourd’hui"
      subject.save
      expect(subject.current).to eq(true)
    end

    it "should set the current boolean true when end date 'Present' " do
      subject.end_time = "Present"
      subject.save
      expect(subject.current).to eq(true)
    end
  end
end







