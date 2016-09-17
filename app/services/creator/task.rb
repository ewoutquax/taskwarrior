module Creator
  class Task
    def initialize(task_form_value)
      raise ArgumentError unless task_form_value.is_a?(TaskFormValues)
      @task_form_value = task_form_value
    end

    def invoke
      TaskWarrior::TaskCreator.invoke(@task_form_value)
    end
  end
end
