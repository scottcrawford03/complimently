class AdminController < ApplicationController
  before_action :authorize_current_user
  def index
  end
end
