class TasksController < ApplicationController

  def index
    @tasks = Task.all
    p params
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)

  end
end
