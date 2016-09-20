class TasksController < ApplicationController
  def new
    @task_form = TaskForm.new(TaskFormValues.new)
  end

  def create
    @task_form = TaskForm.new(TaskFormValues.new, params)

    Creator::Task.new(@task_form.model).invoke

    redirect_to root_path
  end

  def edit
    values = Fetcher::Task.by_uuid(params[:id])
    form_values = TaskFormValues.new(values.to_hash.slice(:uuid, :description, :next_action, :website, :project))
    @task_form = TaskForm.new(form_values)
  end

  def update
    values = Fetcher::Task.by_uuid(params[:id])
    form_values = TaskFormValues.new(values.to_hash.slice(:uuid, :description, :next_action, :website, :project))
    task_form = TaskForm.new(form_values, params)

    Updater::Task.new(values).with_form_values(task_form.model)

    redirect_to root_path
  end

  def sync
    Syncer::Tasks.invoke

    redirect_to root_path
  end
end
