class Api::ComplimentsController < ApplicationController
  def index
    @compliment = current_user.compliments.shuffle.pop
    render json: @compliment
  end
end
