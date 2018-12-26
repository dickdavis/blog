##
# = HourglassController
# Author::    RV Davis
# Copyright:: Copyright 2017 RV Davis
# License::   GNU Public License 3
#
# This controller provides methods to access article resources
class HourglassController < ApplicationController
  before_action :require_login, only: :index

  ##
  # /hourglass
  def index
    @page_title = 'Hourglass Dashboard'
    @current_activities = Activity.where(completed: [false, nil]).order(due_date: :asc)
    @completed_activities = Activity.where(completed: true).order(completion_date: :desc)
  end
end
