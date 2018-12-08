##
# = ProjectsController
# Author::    Richard Davis
# Copyright:: Copyright 2016-2019 Dick Davis
# License::   GNU Public License 3
#
# The controller for projects resources.
class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  ##
  # GET /projects
  def index
    @page = { title: 'Projects', 'navbar-title': 'Projects' }
    @projects = Project.all
  end

  ##
  # GET /projects/1
  def show
    @page = { title: 'Show Project', 'navbar-title': 'Show Project' }
  end

  ##
  # GET /projects/new
  def new
    @page = { title: 'Create Project', 'navbar-title': 'Create Project' }
    @project = Project.new
  end

  ##
  # GET /projects/1/edit
  def edit
    @page = { title: 'Edit Project', 'navbar-title': 'Edit Project' }
  end

  ##
  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:type] = 'success'
      redirect_to @project, notice: 'Project was successfully created.'
    else
      flash[:type] = 'failure'
      redirect_to new_project_path, notice: @project.errors.full_messages
    end
  end

  ##
  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      flash[:type] = 'success'
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      flash[:type] = 'failure'
      redirect_to edit_project_path, notice: @project.errors.full_messages
    end
  end

  ##
  # DELETE /projects/1
  def destroy
    @project.destroy
    flash[:type] = 'success'
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  ##
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  ##
  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
