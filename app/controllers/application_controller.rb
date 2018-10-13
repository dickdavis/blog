##
# = ApplicationController
# Author::    Richard Davis
# Copyright:: Copyright 2016-2019 Dick Davis
# License::   GNU Public License 3
#
# The base controller for the web application.
class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
end
