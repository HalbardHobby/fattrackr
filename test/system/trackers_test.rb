require "application_system_test_case"

class TrackersTest < ApplicationSystemTestCase
  setup do
    @tracker = trackers(:one)
  end

  test "visiting the index" do
    visit trackers_url
    assert_selector "h1", text: "Trackers"
  end

  test "creating a Tracker" do
    visit trackers_url
    click_on "New Tracker"

    fill_in "Alcochol", with: @tracker.alcochol
    fill_in "Calories", with: @tracker.calories
    fill_in "Carb", with: @tracker.carb
    fill_in "Date", with: @tracker.date
    fill_in "Description", with: @tracker.description
    fill_in "Fat", with: @tracker.fat
    check "Intake" if @tracker.intake
    fill_in "Protein", with: @tracker.protein
    click_on "Create Tracker"

    assert_text "Tracker was successfully created"
    click_on "Back"
  end

  test "updating a Tracker" do
    visit trackers_url
    click_on "Edit", match: :first

    fill_in "Alcochol", with: @tracker.alcochol
    fill_in "Calories", with: @tracker.calories
    fill_in "Carb", with: @tracker.carb
    fill_in "Date", with: @tracker.date
    fill_in "Description", with: @tracker.description
    fill_in "Fat", with: @tracker.fat
    check "Intake" if @tracker.intake
    fill_in "Protein", with: @tracker.protein
    click_on "Update Tracker"

    assert_text "Tracker was successfully updated"
    click_on "Back"
  end

  test "destroying a Tracker" do
    visit trackers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tracker was successfully destroyed"
  end
end
