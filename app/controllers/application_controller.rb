class ApplicationController < ActionController::API
  def render_json(status, data = nil, errors = nil)
    payload = {}
    payload[:errors] = errors unless errors.nil?
    payload[:data] = data unless data.nil?
    render json: payload, status: status
  end
end
