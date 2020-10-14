require 'rails_helper'

RSpec.describe Company, :type => :model do

  context "callbacks" do
    subject { Company.create name: 'le garage peugeot' }

    it "it should titleize the name" do
      expect(subject.name).to eq('Le Garage Peugeot')
    end
  end
end
