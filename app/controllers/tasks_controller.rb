class TasksController < ApplicationController
  before_action :authenticate_user!
  def new
    @task = Task.new
  end

  def index
    @pagy, @tasks = pagy(Services::Tasks::Index.new(task_id: params[:task_id]).call)
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      flash[:notice] = I18n.t('flash.create')
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_params)
      redirect_to @task
    else
      render :edit
    end
  end

  private

  def tasks_params
    params.require(:task).permit(:task_number, :comment, :status, :date)
  end
end
