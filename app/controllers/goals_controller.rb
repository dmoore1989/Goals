class GoalsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @goal = Goal.new
    render :new
  end

  def create

    @goal = Goal.new(goal_params)
    if @goal.save!
      redirect_to user_url(@goal.user_id)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def edit

    render :edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  def goal_params
    params.require(:goal).permit(:name, :description, :private, :user_id, :completed)
  end

  def ensure_correct_user
    @goal = Goal.find(params[:id])
    unless current_user.id == @goal.user_id
      flash[:errors] = ["Invalid User- Cannot change others goals you monster"]
      redirect_to user_url(current_user)
    end
  end
end
