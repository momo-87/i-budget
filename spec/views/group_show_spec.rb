require_relative '../rails_helper'

RSpec.describe 'Group', type: :system do
  # Create some test users and their associated data
  before do
    @user1 = User.create!(name: 'Christian Momo', email: 'mm@recipapp.com', password: '123456')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    @group = @user1.groups.create!(name: 'Group name', icon: 'https://placehold.co/200x200')

    @entity1 = Entity.create!(author_id: @user1.id, name: 'entity1', amount: 10)
    @entity2 = Entity.create!(author_id: @user1.id, name: 'entity2', amount:25)

    @group.entities << @entity1
    @group.entities << @entity2

  end

  it 'displays group informations on the group show page index page' do
    visit group_path(@group.id)

    expect(page).to have_content('entity1')
    expect(page).to have_content('$10')
    expect(page).to have_content('entity2')
    expect(page).to have_content('$25')
    expect(page).to have_content('Total Amount')
    expect(page).to have_content('$35')
  end

  it 'redirects to groups index page when clicking on left arrow' do
    visit group_path(@group.id)
    find("a[id='left-arrow-1']").click

    sleep(5)
    current_path
    expect(current_path).to eq(groups_path)
  end

  it 'redirects to Add transaction page when clicking on Add new transaction link' do
    visit group_path(@group.id)
    click_link('Add a new transaction')

    sleep(5)
    current_path
    expect(current_path).to eq(new_group_entity_path(@group.id))
  end
end