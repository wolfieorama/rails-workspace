class JobsController < ApplicationController

  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    @job = Job.page(params[:page]).per(5)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params.require(:job).permit(:title, :company, :url))

    if @job.save
      redirect_to @job
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @job.update(params.require(:job).permit(:title, :company, :url))
      redirect_to @job
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  private

  def find_job
    @job = Job.find(params[:id])
  end

end
