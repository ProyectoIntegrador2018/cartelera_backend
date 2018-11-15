#
class Api::V1::EventsController < ApplicationController
  respond_to :json
  before_action :authenticate_request!, except: %i[index show upcoming_events applicant upcoming_applicant past_applicant user_events]

  def index
    @events = Event.where(nil)
    @events = @events.campus(params[:campus]) if params[:campus].present?
    @events = @events.city(params[:city]) if params[:city].present?
    @events = @events.state(params[:state]) if params[:state].present?
    @events = @events.category(params[:category]) if params[:category].present?
    @events = @events.cost(params[:cost]) if params[:cost].present?
    @events = @events.end_date(params[:end_date]) if params[:end_date].present?
    @events = @events.start_date(params[:start_date]) if params[:start_date].present?
    # @events = @events.tags(params[:tags]) if params[:tags].present?
    respond_with @events.upcoming.published
  end

  def show
    respond_with Event.find(params[:id])
  end

  def registrees
    respond_with Event.find(params[:id]).registrees
  end

  def applicant
    respond_with Event.where(applicant_id: params[:applicant_id])
  end

  def search; end

  def user_events
    @events = Event.all
    @events = @events.where(applicant_id: params[:applicant_id])
    render json: event_json, status: 200
  end

  def upcoming_events
    respond_with Event.published.upcoming.limit(8)
  end

  def upcoming
    @events = Event.upcoming
    if current_user.user_type == 'sponsor'
      @events = @events.where(sponsor_id: current_user.id) unless current_user.admin?
      @events = @events.where(review_status: 'sponsor_review')
                       .or(@events.where(review_status: 'event_approved'))
                       .or(@events.where(review_status: ''))
    end
    if current_user.user_type == 'applicant'
      @events = @events.where(applicant_id: current_user.id) unless current_user.admin?
    end
    render json: event_json, status: 200
  end

  def upcoming_applicant
    @events = Event.upcoming
    @events = @events.where(applicant_id: current_user.id)
    render json: event_json, status: 200
  end

  def past_applicant
    @events = Event.past
    @events = @events.where(applicant_id: current_user.id)
    render json: event_json, status: 200
  end

  def past
    @events = Event.past
    if current_user.user_type == 'sponsor'
      @events = @events.where(sponsor: current_user) unless current_user.admin?
    end
    if current_user.user_type == 'applicant'
      @events = @events.where(applicant: current_user) unless current_user.admin?
    end
    render json: event_json, status: 200
  end

  def create
    @event = Event.new(event_params)
    set_end_date
    @sponsor = User.find(@event.sponsor_id)
    @applicant = User.find(@event.applicant_id)

    if @event.save
      if @sponsor != @applicant
        NewEventReviewMailer.review_new_event(@sponsor, @applicant, @event)
                            .deliver
      end
      render json: @event, status: 201, location: [:api, @event]
    else
      render json: { errors: @event.errors }, status: 422
    end
  end

  def update
    @event = Event.find(params[:id])
    set_end_date
    @sponsor = User.find(@event.sponsor_id)
    @applicant = User.find(@event.applicant_id)

    @review_status_change = false
    @review_status_change = true if @event.review_status != event_params[:review_status]

    if @event.update(event_params)
      if @review_status_change && @event.review_status == 'sponsor_review'
        EventReviewMailer.sponsor_review_event(@sponsor, @applicant, @event)
                         .deliver
      else
        EventReviewMailer.applicant_review_event(@sponsor, @applicant, @event)
                         .deliver
      end
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
    params.require(:event).permit(:applicant_id, :sponsor_id, :review_status, :name,
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
                                  :latitude, :longitude, :city, :state,
                                  :review_comments,
                                  { languages: [] }, { tag_names: [] },
                                  majors: [])
  end

  def paginate_params
    { page: params[:page], per_page: params[:per_page] }
  end
end
