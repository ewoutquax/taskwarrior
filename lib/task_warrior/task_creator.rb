module TaskWarrior
  module TaskCreator
    def self.invoke(task_form_value)
      raise ArgumentError unless task_form_value.is_a?(TaskFormValues)

      Communicator.execute("task add \"#{task_form_value.description}\"")
    end
  end
end
