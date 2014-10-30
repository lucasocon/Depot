require "spec_helper"
 
feature "Facebook Login" do
  let!(:oauth_data)   { auth_data }
 
  background do
    visit "/users/sign_in"  
  end
  
  scenario "Signing in with a new Facebook Account" do
    OmniAuth.config.mock_auth[:facebook] = auth_data
    
    click_link "Sign in with Facebook"
    
    expect{User.where(email: auth_data.info.email)}.should be
    expect{User.last.provider} == ("facebook")
    expect{User.last.uid} == (auth_data.uid)
    expect{current_path} ==  ('/?locale=en#_=_')
  end
end