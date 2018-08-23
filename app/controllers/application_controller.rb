#
class ApplicationController < ActionController::API
  attr_reader :current_user

  protected

  def authenticate_request!
    unless user_id_in_token?
      render json: { errors: ['No se ha iniciado sesión'] }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[0]['user_id'])
    unless @current_user.enabled
      @current_user = nil
      render json: { errors: ['El usuario está desactivado'] }, status: :unauthorized
      return
    end
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['No se ha iniciado sesión'] }, status: :unauthorized
  end

  private

  def http_token
    @http_token ||= request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[0]['user_id'].to_i
  end
end
