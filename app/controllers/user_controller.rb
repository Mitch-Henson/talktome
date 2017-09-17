class UserController < ApplicationController
  def create
    new_user = User.new(username: request.request_parameters['username'],
                        password: request.request_parameters['password'],
                        password_confirmation: request.request_parameters['password_confirmation'])
    new_user.save!

    results = ActiveModelSerializers::SerializableResource.new(new_user, serializer: UserSerializer)
    render_json(:ok, results)
  rescue ActiveRecord::RecordNotSaved, ActiveRecord::RecordInvalid
    render_json(:bad_request)
  end

  def show
    user = User.where(username: request.params['username']).first
    render_json(:ok, username: user.username, password_digest: user.password_digest)
  end
end
