#
class Api::V1::RegistreesController < ApplicationController
  respond_to :json
  before_action :authenticate_request!, only: %i[index show]

  def index
    respond_with Registree.all.order(:email)
  end

  def create
    registree = Registree.new(registree_params)
    if registree.save
      event = Event.find(params[:event_id])
      RegistreeNotifierMailer.send_registree_email(registree.email, event)
                             .deliver
      render json: registree, status: 201
    else
      render json: { errors: registree.errors }, status: 422
    end
  end

  def show
    respond_with Registree.find(params[:id])
  end

  def destroy
    if Event.find(:event_id).registered_emails.include?(params[:email])
      Registree.find_by(email: params[:email], event_id: params[:event_id])
               .destroy
      head 204
    else
      render json: { errors: 'El correo no está registrado al evento' },
             status: 404
    end
  end

  private

  def registree_params
    params.require(:registree).permit(:email, :full_name, :event_id)
  end
end
