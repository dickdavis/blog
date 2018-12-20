##
# = ArticlesController
# Author::    RV Davis
# Copyright:: Copyright 2017 RV Davis
# License::   GNU Public License 3
#
# This controller provides methods to access article resources
class ArticlesController < ApplicationController
  before_action :require_login, only: %i[new edit create update destroy]
  before_action :set_article, only: %i[show edit update destroy]

  ##
  # GET /articles
  def index
    @page_title = 'Articles'
    @articles = if params[:tag]
                  Article.tagged_with(params[:tag]).order(created_at: :desc)
                elsif params[:search]
                  Article.search(params[:search]).order(created_at: :desc)
                else
                  Article.all.order(created_at: :desc)
                end
  end

  ##
  # GET /articles/:article_id
  def show
    @page_title = @article.title
  end

  ##
  # GET /articles/new
  def new
    @page_title = 'Create Article'
    @article = Article.new
  end

  ##
  # GET /articles/:article_id/edit
  def edit
    @page_title = 'Edit Article'
  end

  ##
  # POST /articles
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:type] = 'success'
      redirect_to @article, notice: 'Article was successfully created.'
    else
      flash[:type] = 'failure'
      redirect_to new_article_path, notice: @article.errors.full_messages
    end
  end

  ##
  # PATCH/PUT /articles/:article_id
  def update
    if @article.update(article_params)
      flash[:type] = 'success'
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      flash[:type] = 'failure'
      redirect_to edit_article_path(@article), notice: @article.errors.full_messages
    end
  end

  ##
  # DELETE /articles/:article_id
  def destroy
    @article.destroy
    respond_to do |format|
      flash[:message] = 'Article was successfully destroyed.'
      format.html { redirect_to articles_path }
      format.json { head :no_content }
    end
  end

  private

  ##
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  ##
  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :text, :subtitle, :summary, :all_tags)
  end
end
