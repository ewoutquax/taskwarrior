class TasksController < ApplicationController
  def new
    @task_form = TaskForm.new(TaskFormValues.new)
  end

  def create
    @task_form = TaskForm.new(TaskFormValues.new, params)

    Creator::Task.new(@task_form.model).invoke

    redirect_to root_path
  end

  def sync
    Syncer::Tasks.invoke

    redirect_to root_path
  end
end
