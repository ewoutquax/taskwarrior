module TaskWarrior
  module TaskCreator
    def self.invoke(task_form_values)
      enforce_argument_type(TaskFormValues, task_form_values)

      values = []
      task_form_values.to_hash.each do |key, value|
        values << if key == :description
                    "\"#{value}\""
                  else
                    "#{key}:\"#{value}\""
                  end
      end

      Communicator.execute("task add #{values.join(' ')}")
    end
  end
end
