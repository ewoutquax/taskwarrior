module TaskWarrior
  module TaskUpdater
    def self.invoke(current_task_values, new_task_values)
      values = []
      new_task_values.to_hash.each do |key, value|
        next if key == :uuid
        next if current_task_values.send(key) == value
        values << if key == :description
                    "\"#{value}\""
                  else
                    "#{key}:\"#{value}\""
                  end
      end

      Communicator.execute("task uuid:#{current_task_values.uuid} modify #{values.join(' ')}")
    end
  end
end
