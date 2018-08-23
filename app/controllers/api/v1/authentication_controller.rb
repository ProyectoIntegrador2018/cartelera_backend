#
class Api::V1::AuthenticationController < ApplicationController
  def authenticate_user
    user = User.find_for_database_authentication(email: params[:email])
    if user && user.try(:enabled)
      if user.valid_password?(params[:password])
        render json: payload(user)
      else
        render json: { error: 'Usuario y/o contraseña inválida' }, status: :unauthorized
      end
    else
      render json: { error: 'Usuario bloqueado' }, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user && user.id
    {
      authToken: JsonWebToken.encode(user_id: user.id),
      id: user.id,
      isNewbie: user.is_newbie
    }
  end
end
