require 'rails_helper'

RSpec.describe User, :type => :model do

  context "with valid attributes" do
    subject { User.new first_name: 'Adrien', last_name: 'Barbier', email: 'test@gmail.com', password: 'password' }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "it is not valid without first_name" do
      subject.first_name = ''
      expect(subject).to_not be_valid
    end

    it "it is not valid without last_name" do
      subject.last_name = ''
      expect(subject).to_not be_valid
    end
  end

  context "callbacks" do
    subject { User.create first_name: 'adrien', last_name: 'barbier', email: 'test@gmail.com', password: 'password' }

    it "it should titleize the full name" do
      expect(subject.first_name).to eq('Adrien')
      expect(subject.last_name).to eq('Barbier')
    end
  end

end
