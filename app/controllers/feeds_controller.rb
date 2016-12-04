class FeedsController < ApplicationController
  def feed
    @articles = Article.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
end
