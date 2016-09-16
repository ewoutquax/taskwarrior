module TaskWarrior
  module PendingTasksFetcher
    def self.invoke(filters)
      extend = filters.inject([]) do |list, (key, value)|
        list << "#{key}=#{value}"
      end.join(' ')

      result = TaskWarrior::Communicator.execute("task export +PENDING #{extend}".strip)

      items = JSON.parse(result)
      items.inject([]) do |list, item|
        list << TaskValues.new(item)
      end
    end
  end
end
