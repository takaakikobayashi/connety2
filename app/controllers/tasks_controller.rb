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
      @task = Task.all
      render action: :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def task_params
    params.require(:task).permit(:name, :deadline)
  end
end
