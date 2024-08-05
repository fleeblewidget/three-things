class TasksController < ApplicationController
  def index
    @promoted_tasks = Task.where(complete: nil).where(promoted: true).order(:order)
    @open_tasks = Task.where(complete: nil).where(promoted: false).order(:order)
    @closed_tasks = Task.where.not(complete: nil).order(:complete)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.order = Task.maximum(:order) + 1

    if @task.save
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def complete
    @task = Task.find(params[:id])

    @task.complete = Time.now
    @task.save

    redirect_to root_path
  end

  def reopen
    @task = Task.find(params[:id])

    @task.complete = nil
    @task.save

    redirect_to root_path
  end

  def promote
    @task = Task.find(params[:id])

    @task.promoted = true
    @task.save

    redirect_to root_path
  end

  def demote
    @task = Task.find(params[:id])

    @task.promoted = false
    @task.save

    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to root_path, status: :see_other
  end
  
  private
  def task_params
    params.require(:task).permit(:summary, :details, :due_date)
  end
end
