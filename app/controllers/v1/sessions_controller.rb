# frozen_string_literal: true

class V1::SessionsController < ApplicationController
  # before_action :configure_sign_in_params, only: [:create]

  api :POST, '/v1/sessions/', 'Create user. Will be return authentication_token'
  param :email, String, desc: 'email of the requested user' , :required => true
  param :password, String, desc: 'password of the requested user', :required => true
  def create
     @user = User.find_by(email: params[:email])
  #   render json: @user.as_json(only: [:id, :email, :name, :authentication_token]), status: 200, message: 'success'

    if (@user != nil) and @user.valid_password?("#{params[:password]}")
     render json: @user.as_json(only: [:id, :email, :name, :password, :authentication_token]), status: 200, message: 'success'
    else
      render json: { email: params[:email] }, status: 200
    end

  end

end
