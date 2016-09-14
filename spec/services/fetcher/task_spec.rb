require 'rails_helper'

RSpec.describe Fetcher::Task do
  context 'pending_tasks' do
    let(:response) { Fetcher::Task.pending_tasks }

    context 'without present tasks' do
      before do
        expect(TaskWarrior::Communicator).to receive(:execute).with('task export +PENDING').and_return("[\n]")
      end

      it 'returns an empty array' do
        expect(response).to eq([])
      end
    end

    context 'with a found task' do
      before do
        tasks = File.read(fixture_path + '/pending_tasks.json')
        expect(TaskWarrior::Communicator).to receive(:execute).with('task export +PENDING').and_return(tasks)
      end

      it 'returns an array with a task-object' do
        expect(response).to be_kind_of(Array)
        expect(response.size).to eq(1)
        expect(response.first).to be_kind_of(TaskValues)
      end

      it 'parses the task into a Objection-class' do
        task = response.first

        expect(task.description).to eq('Task-description')
        expect(task.mail_body).to eq('Mail-body text')
        expect(task.next_action).to eq('Next action text')
        expect(task.project).to eq('Development')
        expect(task.tags.first).to eq('testing')
        expect(task.website).to eq('TaskWarriorWeb')
        expect(task.annotations.first.description).to eq('First annotation to the task')
      end
    end
  end
end
