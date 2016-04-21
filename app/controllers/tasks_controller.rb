class TasksController < ApplicationController
before_action :set_task, only: [:show, :edit, :update]
before_action :authenticate_user!, :except => [:show, :index]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
  	@task = Task.new
  end

  def edit 
  end

  def home
  end

  def create
    if params[:task_id]
      parent = Task.find(params[:task_id])
      @task = parent.tasks.build(task_params)
    else
      @task  = Task.new(task_params)
    end
    @task.user = current_user
    if @task.save
      flash[:success] = "task created!"
      redirect_to :back
    else
      render 'new'
    end
  end

  def update
    if @task.update_attributes(task_params)
      flash[:success] = "task updated"
      redirect_to request.referrer || root_url
    end 
  end


  def destroy
  	@task = Task.find(params[:id])
      @task.destroy
  	  flash[:alert] = "Task deleted."
  	redirect_to request.referrer || root_url
  end

  def completed
    @task = Task.find(params[:id])
    if @task.update_attributes(:completed => params[:completed])
     flash[:notice] = "Task completed"
   else
     flash[:notice] = "task failed"
   end
       redirect_to root_path
  end


  private

  def set_task
  	@task = Task.find(params[:id])
  end

  def task_params
  	params.require(:task).permit(:title, :note, :completion_date, :completed)
  end
end
