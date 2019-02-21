require 'spec_helper'

describe 'Artist Integration Tests' do
  describe "GET '/artists/new' - New Artist Form" do
    it "Shows the heading" do
      visit '/artists/new'
      expect(page.body).to include('Create a new artist!')
    end

    it "Should return a 200" do
      visit "/artists/new"
      expect(page.status_code).to be(200)
    end

    it 'has a greeting form with a name and town field' do
      visit "/artists/new"
      expect(page).to have_selector("form")
      expect(page).to have_field(:name)
      expect(page).to have_field(:town)
    end
  end

  describe "POST '/artists' - Create Artist" do
    it 'displays the artist after successfully creating one' do
      visit '/artists/new'

      fill_in(:name, :with => 'Artist1')
      fill_in(:town, :with => 'Town1')
      click_button "Submit"

      expect(page.body).to include('Information about Artist1')
    end

    it 'renders the form again if a valid name is not provided' do
      visit '/artists/new'

      fill_in(:town, :with => 'Town1')
      click_button "Submit"

      expect(page).to have_selector("form")
    end
  end
end
