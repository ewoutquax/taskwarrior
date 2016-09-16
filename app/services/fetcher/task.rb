module Fetcher
  module Task
    NON_FILTER_KEYS = %w(controller action id).freeze

    def self.pending_tasks(params)
      filters = params.reject { |key, value| key.in?(NON_FILTER_KEYS) }
      TaskWarrior::PendingTasksFetcher.invoke(filters)
    end

    def self.by_uuid(uuid)
      TaskWarrior::ByUuidFetcher.invoke(uuid)
    end
  end
end
