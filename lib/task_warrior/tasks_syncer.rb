module TaskWarrior
  module TasksSyncer
    def self.invoke
      TaskWarrior::Communicator.execute('task sync')
    end
  end
end
