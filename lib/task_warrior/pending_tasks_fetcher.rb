module TaskWarrior
  module PendingTasksFetcher
    def self.invoke
      result = TaskWarrior::Communicator.execute('task export +PENDING')
      items = JSON.parse(result)
      items.inject([]) do |list, item|
        list << TaskValues.new(item)
      end
    end
  end
end
