require 'rails_helper'

RSpec.feature 'Edit task', js: true, type: :feature do
  before do
    tasks = File.read(fixture_path + '/pending_tasks.json')
    expect(TaskWarrior::Communicator).to receive(:execute).with('task export +PENDING').exactly(:twice).and_return(tasks)
    expect(TaskWarrior::Communicator).to receive(:execute).with('task export uuid:35bdb52d-da98-4f85-8229-adcb160c1a9e').exactly(:twice).and_return(tasks)
    modify_command = 'task uuid:35bdb52d-da98-4f85-8229-adcb160c1a9e modify "blabla"'
    expect(TaskWarrior::Communicator).to receive(:execute).with(modify_command)
  end

  scenario 'edit task' do
    given_i_am_on_the_homepage
    when_i_open_a_task
    and_i_click_the_edit_button
    and_i_modify_the_description
    and_i_submit_the_form
    then_i_see_the_pending_tasks
  end

  def given_i_am_on_the_homepage
    visit root_path
  end

  def when_i_open_a_task
    all('table tbody tr').first.all('td').first.click
  end

  def and_i_click_the_edit_button
    click_link('Edit task')
  end

  def and_i_modify_the_description
    fill_in('Description', with: 'my updated task')
  end

  def and_i_submit_the_form
    click_button 'Submit'
  end

  def then_i_see_the_pending_tasks
    within('h1') do
      expect(page).to have_content 'Pending tasks'
    end
  end
end
