class ComplimentsController < ApplicationController
  before_action :authorize_current_user

  def index
    @compliments = Compliment.where(user_id: current_user.id)
  end

  def create
    if current_user.partner && permitted_params[:compliment]
      Compliment.create(
        compliment: permitted_params[:compliment],
        user_id: current_user.partner.id
      )
      flash[:success] = 'Compliment created!'
      redirect_to user_compliments_path
    else
      redirect_to user_compliments_path
    end
  end

  def destroy
    Compliment.find(params[:id]).destroy!
    flash[:success] = 'Compliment deleted'
    redirect_to user_compliments_path
  end

  private

  def permitted_params
    params.require(:compliment).permit(:compliment)
  end
end
