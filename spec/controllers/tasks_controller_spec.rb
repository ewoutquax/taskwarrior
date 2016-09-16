require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe "#sync" do
    it "redirects to the index-page" do
      expect(TaskWarrior::Communicator).to receive(:execute).with('task sync')

      post :sync

      expect(response).to redirect_to('/')
    end
  end
end
