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
        task: {
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

  context 'edit' do
    before do
      tasks = File.read(fixture_path + '/pending_tasks.json')
      expect(TaskWarrior::Communicator).to receive(:execute).with('task export uuid:35bdb52d-da98-4f85-8229-adcb160c1a9e').and_return(tasks)

      post :edit, id: '35bdb52d-da98-4f85-8229-adcb160c1a9e'
    end

    it 'returns http-success' do
      expect(response).to be_success
    end
  end

  context 'update' do
    before do
      tasks = File.read(fixture_path + '/pending_tasks.json')
      expect(TaskWarrior::Communicator).to receive(:execute).with('task export uuid:35bdb52d-da98-4f85-8229-adcb160c1a9e').and_return(tasks)
      update_command = 'task uuid:35bdb52d-da98-4f85-8229-adcb160c1a9e modify "my updated task"'
      expect(TaskWarrior::Communicator).to receive(:execute).with(update_command)

      payload = {
        task: {
          description: "my updated task",
          next_action: "Next action text",
          website:     "TaskWarriorWeb",
          project:     "Development"
        },
        id: "35bdb52d-da98-4f85-8229-adcb160c1a9e"
      }

      put :update, payload
    end

    it 'redirects to the homepage' do
      expect(response).to redirect_to('/')
    end
  end
end
