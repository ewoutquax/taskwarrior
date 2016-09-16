module Fetcher
  module Task
    NON_FILTER_KEYS = %w(controller action id).freeze

    def self.pending_tasks(params)
      filters = params.reject { |key, value| key.in?(NON_FILTER_KEYS) }
      TaskWarrior::PendingTasksFetcher.invoke(filters)
    end

    def self.by_uuid(uuid)
      task = TaskWarrior::ByUuidFetcher.invoke(uuid)
      task.entry = Time.parse(task.entry).strftime('%Y-%m-%dT%H:%MZ')
      if task.annotations
        task.annotations.each do |annotation|
          annotation.entry = Time.parse(annotation.entry).strftime('%Y-%m-%dT%H:%MZ')
        end
      end
      task
    end
  end
end
