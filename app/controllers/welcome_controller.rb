##
# = WelcomeController
# Author::    RV Davis
# Copyright:: Copyright 2017 RV Davis
# License::   GNU Public License 3
#
# This controller provides methods to access static resources
class WelcomeController < ApplicationController
  ##
  # GET /about
  def about
    @page_title = 'About RV Davis'
  end
end
