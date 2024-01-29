require_relative '../rails_helper'

RSpec.describe 'Group', type: :system do
  # Create some test users and their associated data
  before do
    @user1 = User.create!(name: 'Christian Momo', email: 'mm@recipapp.com', password: '123456')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    @group = @user1.groups.create!(name: 'Group name', icon: 'https://placehold.co/200x200')

    @entity1 = Entity.create!(author_id: @user1.id, name: 'entity1', amount: 10)
    @entity2 = Entity.create!(author_id: @user1.id, name: 'entity2', amount: 25)

    @group.entities << @entity1
    @group.entities << @entity2
  end

  it 'displays group informations on the group index page' do
    visit groups_path

    expect(page).to have_selector("img[src='#{@group.icon}']")
    expect(page).to have_content('Group name')
    expect(page).to have_content('$35')
  end

  it 'redirects to group show page when clicking on a group' do
    visit groups_path
    find("a[id='#{@group.id}']").click

    sleep(5)
    current_path
    expect(current_path).to eq(group_path(@group.id))
  end

  it 'redirects to new category page when clicking on Add new category link' do
    visit groups_path
    click_link('Add a new category')

    sleep(5)
    current_path
    expect(current_path).to eq(new_group_path)
  end
end
