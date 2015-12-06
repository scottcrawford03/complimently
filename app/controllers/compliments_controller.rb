class ComplimentsController < ApplicationController
  before_action :authorize_current_user
  
  def index
    @compliments = Compliment.where(user_id: current_user.id)
  end
end
