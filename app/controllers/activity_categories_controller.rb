##
# = ActivityCategoriesController
# Author::    RV Davis
# Copyright:: Copyright 2017 RV Davis
# License::   GNU Public License 3
#
# This controller provides methods to access activity category resources
class ActivityCategoriesController < ApplicationController
  before_action :require_login, only: %i[index show new edit create update destroy]
  before_action :set_activity_category, only: [:show, :edit, :update, :destroy]

  ##
  # GET /activity_categories
  def index
    @page_title = 'Activity Categories'
    @activity_categories = ActivityCategory.all
  end

  ##
  # GET /activity_categories/:activity_category_id
  def show
    @page_title = @activity_category.label
  end

  ##
  # GET /activity_categories/new
  def new
    @page_title = 'New Activity Category'
    @activity_category = ActivityCategory.new
  end

  ##
  # GET /activity_categories/:activity_category_id/edit
  def edit
    @page_title = 'Edit Activity Category'
  end

  ##
  # POST /activity_categories
  def create
    @activity_category = ActivityCategory.new(activity_category_params)
    if @activity_category.save
      flash[:type] = 'success'
      redirect_to @activity_category, notice: 'Activity category was successfully created.'
    else
      flash[:type] = 'failure'
      redirect_to new_activity_category_path, notice: @activity_category.errors.full_messages
    end
  end

  ##
  # PATCH/PUT /activity_categories/:activity_category_id
  def update
    if @activity_category.update(activity_category_params)
      flash[:type] = 'success'
      redirect_to @activity_category, notice: 'Activity category was successfully updated.'
    else
      flash[:type] = 'failure'
      redirect_to edit_activity_category_path(@activity_category), notice: @activity_category.errors.full_messages
    end
  end

  ##
  # DELETE /activity_categories/:activity_category_id
  def destroy
    @activity_category.destroy
    flash[:type] = 'success'
    redirect_to activity_categories_path, notice: 'Activity category was successfully destroyed.'
  end

  private

  ##
  # Sets the activity category for the controller action.
  def set_activity_category
    @activity_category = ActivityCategory.find(params[:id])
  end

  ##
  # Defines acceptable parameters for activity category resources.
  def activity_category_params
    params.require(:activity_category).permit(:label, :description)
  end
end
