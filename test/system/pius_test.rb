require "application_system_test_case"

class PiusTest < ApplicationSystemTestCase
  setup do
    @piu = pius(:one)
  end

  test "visiting the index" do
    visit pius_url
    assert_selector "h1", text: "Pius"
  end

  test "creating a Piu" do
    visit pius_url
    click_on "New Piu"

    fill_in "Content", with: @piu.content
    fill_in "User", with: @piu.user_id
    click_on "Create Piu"

    assert_text "Piu was successfully created"
    click_on "Back"
  end

  test "updating a Piu" do
    visit pius_url
    click_on "Edit", match: :first

    fill_in "Content", with: @piu.content
    fill_in "User", with: @piu.user_id
    click_on "Update Piu"

    assert_text "Piu was successfully updated"
    click_on "Back"
  end

  test "destroying a Piu" do
    visit pius_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Piu was successfully destroyed"
  end
end
