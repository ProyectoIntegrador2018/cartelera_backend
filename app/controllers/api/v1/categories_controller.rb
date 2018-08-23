#
class Api::V1::CategoriesController < ApplicationController
  respond_to :json
  before_action :authenticate_request!

  def index
    respond_with Category.all.order(:name)
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: category, status: 201, location: [:api, category]
    else
      render json: { errors: category.errors }, status: 422
    end
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      render json: category, status: 200, location: [:api, category]
    else
      render json: { errors: category.errors }, status: 422
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.events.empty?
      category.destroy
      head 204
    else
      render json: { errors: 'La categoría contiene eventos' }, status: 403
    end
  end

  def event_count
    @category = Category.find(params[:id])
    if @category
      render json: count_json, status: 200
    else
      render json: { errors: 'La categoría no existe' }, status: 404
    end
  end

  private

  def count_json
    {
      totalCount: @category.events.count,
      upcomingCount: @category.events.upcoming.count,
      pastCount: @category.events.past.count
    }
  end

  def category_params
    params.require(:category).permit(:name, :enabled)
  end
end
