require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET users#index" do
    it "should get index" do
      get users_path
      expect(response).to have_http_status(302)
    end
  end

  describe "GET users#show" do
    it "should get show" do
      get user_path(user)
      expect(response).to have_http_status(302)
    end
  end

  describe "POST users#create" do
      it 'create user with valid attributes' do
        user_params = { user: {
          first_name: 'John',
          last_name: 'Doe',
          password: '123',
          email: 'johndoe@example.com'
        }}
        post tags_path, :params => user_params
        expect(response).to have_http_status(302)
      end
    end

end
