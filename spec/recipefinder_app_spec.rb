Capybara.default_driver = :selenium
# Capybara.default_driver = :poltergeist

Capybara.app_host = "http:///recipefinder7657651.herokuapp.com/"

describe "RecipeFinder App" do

  describe "visit root" do
  	before { visit '/' }
    
    it "displays 'Chocolate' (default)" do
      expect(page).to have_content 'Chocolate'
    end

    it "displays table element that has a row with 3 columns" do
      expect(page).to have_selector(:xpath, "//table//tr[count(td)=3]")
    end

    it "column 1 should have the thumbnail inside img tag" do
      expect(page).to have_selector(:xpath, "//table//tr/td[1]//img")
    end
  end

  it "displays 'Spiked' when looking_for=mocha" do
    visit "?search=mocha"
    expect(page).to have_content 'Spiked'  	
  end

end
