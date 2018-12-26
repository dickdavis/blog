##
# = ActivitiesController
# Author::    RV Davis
# Copyright:: Copyright 2017 RV Davis
# License::   GNU Public License 3
#
# This controller provides methods to access activity resources
class ActivitiesController < ApplicationController
  before_action :require_login, only: %i[show new edit complete export create update revert destroy]
  before_action :set_activity, only: %i[show edit complete update revert destroy]

  ##
  # GET /activities/show
  def show
    @page_title = 'View Activity'
  end

  ##
  # GET /activities/new
  def new
    @page_title = 'New Activity'
    @activity = Activity.new
  end

  ##
  # GET /activities/:activity_id/edit
  def edit
    @page_title = 'Edit Activity'
  end

  ##
  # GET /activities/:activity_id/complete
  def complete
    @page_title = 'Complete Activity'
  end

  ##
  # GET /activities/export
  def export
    @activities = Activity.where(completed: true).order(completion_date: :desc)
  end

  ##
  # POST /activities
  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      flash[:type] = 'success'
      redirect_to hourglass_path, notice: 'Activity was successfully created.'
    else
      flash[:type] = 'failure'
      redirect_to new_activity_path, notice: @activity.errors.full_messages
    end
  end

  ##
  # PATCH/PUT /activities/:activity_id
  def update
    if @activity.update(activity_params)
      @activity.touch(:completion_date) if activity_params[:completed] == '1'
      flash[:type] = 'success'
      redirect_to hourglass_path, notice: 'Activity was successfully updated.'
    else
      flash[:type] = 'failure'
      redirect_to edit_activity_path(@activity), notice: @activity.errors.full_messages
    end
  end

  ##
  # PATCH/PUT /activities/:activity_id/revert
  def revert
    @activity.completed = nil
    @activity.completion_date = nil
    if @activity.save
      flash[:type] = 'success'
      redirect_to hourglass_path, notice: 'Activity was successfully reverted.'
    else
      flash[:type] = 'failure'
      redirect_to hourglass_path, notice: @activity.errors.full_messages
    end
  end

  ##
  # DELETE /activities/:activity_id
  def destroy
    @activity.destroy
    flash[:type] = 'success'
    redirect_to hourglass_path, notice: 'Activity was successfully destroyed.'
  end

  private

  ##
  # Sets the activity for a given action.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def activity_params
    params.require(:activity).permit(:description, :hourglasses, :completed, :due_date, :start_date, :activity_category_id)
  end
end
