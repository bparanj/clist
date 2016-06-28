class TasksController < ApplicationController
  def index
    if current_user
      @incomplete_tasks = current_user.tasks.where(complete: false)
      @complete_tasks = current_user.tasks.where(complete: true)
    else
      @incomplete_tasks = []
      @complete_tasks = []
    end
  end
  
  def create
    @task = current_user.tasks.create!(allowed_params)
    redirect_to tasks_url
  end
  
  def update
    @task = current_user.tasks.find(params[:id])
    @task.update_attributes!(allowed_params)
    respond_to do |f|
      f.html { redirect_to tasks_url }
      f.js
    end
  end
  
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    respond_to do |f|
      f.html { redirect_to tasks_url }
      f.js
    end
  end
  
  private
  
  def allowed_params
    params.require(:task).permit(:name, :complete)
  end
end
