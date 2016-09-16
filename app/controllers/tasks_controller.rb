class TasksController < ApplicationController
  def sync
    Syncer::Tasks.invoke

    redirect_to root_path
  end
end
