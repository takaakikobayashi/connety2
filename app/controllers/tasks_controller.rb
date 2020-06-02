class TasksController < ApplicationController
  def index
    @newtask = Task.new
    @tasks = Task.all
  end

  def create
    @newtask = Task.new(task_params)
    @newtask.user_id = current_user.id
    if @newtask.save
       redirect_to user_tasks_path(current_user.id)
    else
       @tasks = Task.all
       render action: :index
    end
  end

  def complete
    @task = Task.find(params[:id])
    if @task.update(progress_status: false)
       redirect_to user_tasks_path(current_user.id)
    else
       @newtask = Task.new
       @tasks = Task.all
       render action: :index
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
       redirect_to user_tasks_path(current_user.id)
    else
       render action: :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_tasks_path(current_user.id)
  end

  private
  def task_params
    params.require(:task).permit(:name, :deadline)
  end
end
