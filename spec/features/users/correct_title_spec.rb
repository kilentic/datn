describe "correct title", type: :feature do 
  it "should return 'Cinema House' only when visit root path" do
    visit user_controllers_root_path 
    expect(page).to have_title "Cinema House"
  end
end
