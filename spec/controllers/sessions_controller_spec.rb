require 'rails_helper'

describe V1::SessionsController do

  describe "POST v1/session#create" do

    it "should send params with email and password fields and expecting success response" do
      post :create, params: {email: 'swexx99@gmail.com', password: '12345678'}

       if expect(response).to be_successful
         puts 'The test was successful'
       end
    end

  end
end