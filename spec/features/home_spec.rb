require 'rails_helper'

RSpec.feature 'Home', type: :feature do
  before do
    tasks = File.read(fixture_path + '/pending_tasks.json')
    expect(TaskWarrior::Communicator).to receive(:execute).with('task export +PENDING').and_return(tasks)
    expect(TaskWarrior::Communicator).to receive(:execute).with('task export uuid:35bdb52d-da98-4f85-8229-adcb160c1a9e').and_return(tasks)
  end

  scenario 'show start screen', js: true do
    when_i_am_on_the_homepage
    then_i_see_the_app_name
    and_i_see_the_main_report
    and_i_can_add_a_task
    and_i_can_see_a_pending_task
    and_when_i_click_the_task
    then_i_see_the_details_of_the_task
  end

  def when_i_am_on_the_homepage
    visit root_path
  end

  def then_i_see_the_app_name
    within('.navbar-header') do
      expect(page).to have_content 'TaskWarrior'
    end
  end

  def and_i_see_the_main_report
    expect(page).to have_content 'Pending tasks'
  end

  def and_i_can_add_a_task
    expect(page).to have_link 'Add task'
  end

  def and_i_can_see_a_pending_task
    within('table#tasks') do
      expect(page).to have_content('Task-description')
      expect(page).to have_content('Next action text')
      expect(page).to have_content('TaskWarriorWeb')
      expect(page).to have_content('Development')
    end
  end

  def and_when_i_click_the_task
    first('table#tasks tbody tr td').click
  end

  def then_i_see_the_details_of_the_task
    within('#task_detail') do
      expect(page).to have_content('Task-description')
      expect(page).to have_content('Next action text')
    end
  end
end
