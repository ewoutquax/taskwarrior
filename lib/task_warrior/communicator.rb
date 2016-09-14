module TaskWarrior
  module Communicator
    def self.execute(command)
      `#{command}`
    end
  end
end
