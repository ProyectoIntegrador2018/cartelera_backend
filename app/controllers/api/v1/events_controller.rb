#
class Api::V1::EventsController < ApplicationController
  respond_to :json
  before_action :authenticate_request!, except: %i[index show upcoming_events]

  def index
    respond_with Event.upcoming.published
  end

  def show
    respond_with Event.find(params[:id])
  end

  def registrees
    respond_with Event.find(params[:id]).registrees
  end

  def search; end

  def upcoming_events
    respond_with Event.published.upcoming.limit(8)
  end

  def upcoming
    @events = Event.upcoming
    @events = @events.where(sponsor: current_user) unless current_user.admin?
    render json: event_json, status: 200
  end

  def past
    @events = Event.past
    @events = @events.where(sponsor: current_user) unless current_user.admin?
    render json: event_json, status: 200
  end

  def create
    @event = Event.new(event_params)
    set_end_date
    if @event.save
      render json: @event, status: 201, location: [:api, @event]
    else
      render json: { errors: @event.errors }, status: 422
    end
  end

  def update
    @event = Event.find(params[:id])
    set_end_date
    if @event.update(event_params)
      render json: @event, status: 200, location: [:api, @event]
    else
      render json: { errors: @event.errors }, status: 422
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    head 204
  end

  private

  def set_end_date
    return if params[:event][:end_datetime] || @event.end_datetime
    @event.end_datetime = @event.start_datetime.end_of_day
  end

  def set_tags
    # TODO: use or create tags
  end

  def update_tags
    # TODO: check tag name param compare with
  end

  def event_json
    {
      events: camelize_events(@events.paginate(paginate_params)),
      total: @events.count,
      pages: @events.pages(paginate_params)
    }
  end

  def camelize_events(events)
    values = events.map do |e|
      camelize(e)
    end
    values
  end

  def camelize(object)
    object.as_json.deep_transform_keys { |k| k.camelize(:lower) }
  end

  def event_params
    params.require(:event).permit(:applicant_id, :sponsor_id, :status, :name,
                                  :description, :location, :campus,
                                  :category_id, :photo, :cost, :public_event,
                                  :start_datetime, :end_datetime,
                                  :requirements_to_register, :registration_url,
                                  :registration_deadline, :schedule,
                                  :facebook_url, :twitter_url, :contact_phone,
                                  :contact_name, :contact_email, :published,
                                  :cancelled, :cancel_message, :pet_friendly,
                                  :prefix, :has_registration, :max_capacity,
                                  :registration_message, :has_deadline,
                                  { languages: [] }, { tag_names: [] },
                                  majors: [])
  end

  def paginate_params
    { page: params[:page], per_page: params[:per_page] }
  end
end
