require 'rails_helper'

describe Api::V1::SessionsController do

  describe "POST api/v1/session#create" do
    before {
      email = Faker::Internet.email
      password = Faker::Internet.password
      post :create, params: {email: email, password: password}
    }

    it "should check empty response" do
      expect(response.body).to_not be_empty
    end

    it 'returns a successful json string with success message "Nice"' do
      expect(response).to be_successful
    end

  end
end