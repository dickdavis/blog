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
  # GET /articles.json
  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).order(updated_at: :desc)
    elsif params[:search]
      @articles = Article.search(params[:search]).order(updated_at: :desc)
    else
      @articles = Article.all.order(updated_at: :desc)
    end
  end

  ##
  # GET /articles/1
  # GET /articles/1.json
  def show; end

  ##
  # GET /articles/new
  def new
    @article = Article.new
  end

  ##
  # GET /articles/1/edit
  def edit; end

  ##
  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        flash[:message] = 'Article was successfully created.'
        format.html { redirect_to @article }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        flash[:message] = 'Article was successfully updated.'
        format.html { redirect_to @article }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      flash[:message] = 'Article was successfully destroyed.'
      format.html { redirect_to articles_path }
      format.json { head :no_content }
    end
  end

  private

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
