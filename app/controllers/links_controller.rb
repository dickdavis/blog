##
# = LinksController
# Author::    RV Davis
# Copyright:: Copyright 2017 RV Davis
# License::   GNU Public License 3
#
# This controller provides methods to access links resources
class LinksController < ApplicationController
  before_action :require_login, only: %i[new edit create update destroy]
  before_action :set_link, only: %i[show edit update destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all.order(updated_at: :desc)
  end

  # GET /links/1
  # GET /links/1.json
  def show; end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit; end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    respond_to do |format|
      if @link.save
        flash[:message] = 'Link was successfully created.'
        format.html { redirect_to @link }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        flash[:message] = 'Link was successfully updated.'
        format.html { redirect_to @link }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      flash[:message] = 'Link was successfully destroyed.'
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:message, :published)
  end
end
