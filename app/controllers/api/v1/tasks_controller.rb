class Api::V1::TasksController < Api::BaseController
  def show
    values = Fetcher::Task.by_uuid(params[:id])
    render status: :ok, json: values.to_hash
  end
end
