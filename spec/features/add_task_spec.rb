require 'rails_helper'

RSpec.feature 'Add task', type: :feature do
  before do
    expect(TaskWarrior::Communicator).to receive(:execute).with('task export +PENDING').exactly(:twice).and_return('[]')
    create_command = 'task add "my new task" next_action:"Next action value" website:"Website-name" project:"Custom Project"'
    expect(TaskWarrior::Communicator).to receive(:execute).with(create_command)
  end

  scenario 'new task' do
    given_i_am_on_the_homepage
    when_i_click_the_add_task_button
    and_i_enter_the_details
    and_i_submit_the_form
    then_i_see_the_new_task
  end

  def given_i_am_on_the_homepage
    visit root_path
  end

  def when_i_click_the_add_task_button
    click_link('Add task')
  end

  def and_i_enter_the_details
    fill_in('Description', with: 'my new task')
    fill_in('Next action', with: 'Next action value')
    fill_in('Project',     with: 'Custom Project')
    fill_in('Website',     with: 'Website-name')
  end

  def and_i_submit_the_form
    click_button 'Submit'
  end

  def then_i_see_the_new_task
    within('h1') do
      expect(page).to have_content 'Pending tasks'
    end
  end
end
