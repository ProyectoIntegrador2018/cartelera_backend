#
class WelcomeController < ApplicationController
  def index
    render json: { message: 'Hello world!' }, status: 200
  end
end
