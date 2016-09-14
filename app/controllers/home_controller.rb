class HomeController < ApplicationController
  def index
    @tasks = Fetcher::Task.pending_tasks
  end
end
