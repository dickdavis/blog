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

  ##
  # GET /links
  def index
    @page = { title: 'Links', 'navbar-title': 'Links' }
    @links = Link.all.order(updated_at: :desc)
  end

  ##
  # GET /links/1
  def show; end

  ##
  # GET /links/new
  def new
    @page = { title: 'Create Link', 'navbar-title': 'Create Link' }
    @link = Link.new
  end

  ##
  # GET /links/1/edit
  def edit
    @page = { title: 'Edit Link', 'navbar-title': 'Edit Link' }
  end

  ##
  # POST /links
  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:type] = 'success'
      redirect_to @link, notice: 'Link was successfully created.'
    else
      flash[:type] = 'failure'
      redirect_to new_link_path, notice: @link.errors.full_messages
    end
  end

  ##
  # PATCH/PUT /links/1
  def update
    if @link.update(link_params)
      flash[:type] = 'success'
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      flash[:type] = 'failure'
      redirect_to new_link_path, notice: @link.errors.full_messages
    end
  end

  ##
  # DELETE /links/1
  def destroy
    @link.destroy
    flash[:type] = 'success'
    redirect_to links_path, notice: 'Link was successfully destroyed.'
  end

  private

  ##
  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  ##
  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:message, :published)
  end
end
