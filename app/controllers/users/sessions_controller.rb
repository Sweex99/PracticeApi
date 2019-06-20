# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  # before_action :configure_sign_in_params, only: [:create]

  api :POST, '/users/sessions', 'Create user with specifed user params'
  param :email, String, desc: 'email of the requested user' , :required => true
  param :password, String, desc: 'password of the requested user', :required => true
  def create
     @user = User.find_by(email: params[:email])

    if @user.valid_password?("#{params[:password]}")
     render json: @user.as_json(only: [:id, :email, :name, :password, :authentication_token]), status: :ok
    else
      head(:unauthorized)
    end
  end

end
