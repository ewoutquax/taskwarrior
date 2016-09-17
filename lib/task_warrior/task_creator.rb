module TaskWarrior
  module TaskCreator
    def self.invoke(task_form_value)
      raise ArgumentError unless task_form_value.is_a?(TaskFormValues)

      values = []
      task_form_value.to_hash.each do |key, value|
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
