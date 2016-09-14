module Fetcher
  module Task
    def self.pending_tasks(filters)
      TaskWarrior::PendingTasksFetcher.invoke(filters)
    end
  end
end
