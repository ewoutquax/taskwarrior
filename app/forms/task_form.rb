class TaskForm < BaseForm
  def self.model_name
    ActiveModel::Name.new(self, nil, 'Task')
  end

  private

    def params_for_create
      @params.require(:task).permit(
        :description, :next_action, :website, :project
      )
    end
end
