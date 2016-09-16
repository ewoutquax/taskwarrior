module Syncer
  module Tasks
    def self.invoke
      TaskWarrior::TasksSyncer.invoke
    end
  end
end
