require 'rails_helper'

describe V1::SessionsController do

  describe "POST v1/session#create" do

    it "should send params with email and password fields and expecting success response" do
      email = Faker::Internet.email
      password = Faker::Internet.password

      post :create, params: {email: email, password: password}

       if expect(response).to be_successful
         puts "The test was successful. Params: email => #{email} and password => #{password}"
       end
    end

  end
end