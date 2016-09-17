require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  context '#sync' do
    it 'redirects to the index-page' do
      expect(TaskWarrior::Communicator).to receive(:execute).with('task sync')

      post :sync

      expect(response).to redirect_to('/')
    end
  end

  context 'create' do
    before do
      payload = {
        task_form_values: {
          description: 'my new task'
        }
      }

      expect(TaskWarrior::Communicator).to receive(:execute).with('task add "my new task"')

      post :create, payload
    end

    it 'redirects to the homepage' do
      expect(response).to redirect_to('/')
    end
  end
end
