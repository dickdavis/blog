##
# = FeedsController
# Author::    Richard Davis
# Copyright:: Copyright 2016-2019 Dick Davis
# License::   GNU Public License 3
#
# The controller for the articles RSS feed.
class FeedsController < ApplicationController
  def feed
    @articles = Article.all
    respond_to do |format|
      format.rss { render layout: false }
    end
  end
end
