module TaskWarrior
  module ByUuidFetcher
    def self.invoke(uuid)
      result = TaskWarrior::Communicator.execute("task export uuid:#{uuid}")
      item = JSON.parse(result).first

      TaskValues.new(item)
    end
  end
end
