#
class Api::V1::UsersController < ApplicationController
  include Sponsors
  include Applicants
  respond_to :json
  before_filter :authenticate_request!, except: %i[recover_password]

  def create
    user = User.new(user_params)
    create_method(user)
  end

  def create_sponsor
    if current_user.admin?
      user = User.new(sponsor_params)
      user.password = Creation.new.new_password
      create_method(user)
    else
      render json: { error: 'No tienes los privilegios necesarios para crear un sponsor' }, status: :unauthorized
    end
  end

  def create_applicant
    if current_user.user_type == 'sponsor'
      user = User.new(applicant_params)
      user.password = Applicantcreation.new.new_password
      create_applicant_method(user)
    else
      render json: { error: 'No tienes los privilegios necesarios para crear un aplicante' }, status: :unauthorized
    end
  end

  def admins
    if current_user.admin?
      respond_with User.admins
    else
      render json: { error: 'No tienes los privilegios necesarios para crear un admin' }, status: :unauthorized
    end
  end

  def sponsors
    respond_with User.sponsors
  end

  def applicants
    respond_with User.applicants
  end

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update(update_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  def recover_password
    user = User.find_for_database_authentication(email: params[:email])
    if user
      user.password = Creation.new.new_password
      user.is_newbie = true
      if user.save
        UserRecoveryMailer.send_recovery_email(user.email, user.password)
                          .deliver
        render json: user, status: 200, location: [:api, user]
      else
        render json: { errors: user.errors }, status: 422
      end
    else
      render json: { errors: 'Usuario no encontrado' }, status: 404
    end
  end

  private

  def create_method(user)
    if user.save
      render json: user,
             status: 201, serializer: SponsorSerializer
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def create_applicant_method(user)
    if user.save
      render json: user,
             status: 201, serializer: ApplicantSerializer
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def sponsor_params
    params.require(:user).permit(:email)
  end

  def applicant_params
    params.require(:user).permit(:email)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(
      :password, :password_confirmation, :first_name, :last_name,
      :office, :phone_number, :campus, :is_newbie, :enabled
    )
  end
end
