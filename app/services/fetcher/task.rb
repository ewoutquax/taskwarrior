module Fetcher
  module Task
    def self.pending_tasks
      TaskWarrior::PendingTasksFetcher.invoke
    end
  end
end
