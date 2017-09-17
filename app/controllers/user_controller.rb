class UserController < ApplicationController
  def create
    User.new(username: request.request_parameters['username'],
             password: request.request_parameters['password'],
             password_confirmation: request.request_parameters['password_confirmation'])
        .save

    render json: {}, status: :ok
  end

  def show
    user = User.where(username: request.params['username']).first
    render json: { username: user.username, password_digest: user.password_digest }, status: :ok
  end
end
