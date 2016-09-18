require 'rails_helper'

RSpec.describe Api::V1::TasksController, type: :controller do

  describe "GET #index" do
    before do
      tasks = File.read(fixture_path + '/pending_tasks.json')
      expect(TaskWarrior::Communicator).to receive(:execute).with('task export uuid:35bdb52d-da98-4f85-8229-adcb160c1a9e').and_return(tasks)

      get :show, id: '35bdb52d-da98-4f85-8229-adcb160c1a9e', format: :json
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'returns details of the task' do
      expected_output = {
        'annotations' => [{
          'description' => 'First annotation to the task',
          'entry'       => '2016-09-05T08:33Z'
        }],
        'description' => 'Task-description',
        'entry'       => '2016-08-19T07:47Z',
        'id'          => 1,
        'mail_body'   => 'Mail-body text',
        'modified'    => '20160905T083332Z',
        'next_action' => 'Next action text',
        'project'     => 'Development',
        'status'      => 'pending',
        'tags' => [
          'testing'
        ],
        'urgency' => 2.74247,
        'uuid'    => '35bdb52d-da98-4f85-8229-adcb160c1a9e',
        'website' => 'TaskWarriorWeb'
      }

      expect(JSON.parse(response.body)).to eq(expected_output)
    end
  end
end
