require "spec_helper"
 
feature "Facebook login" do

  background do
    visit "/users/sign_in?locale=en"
  end
 
  scenario "login with facebook" do
    OmniAuth.config.mock_auth[:facebook] = auth_data

    click_link "Sign in with Facebook"
 
    expect{User.where(email: auth_data.info.email)}.should be

    expect{User.last.provider} == ("facebook")
    expect{User.last.uid} == (auth_data.uid)
    expect{current_path} == ('/?locale=en#_=_')

    #expect{page}.to have_content (auth_data.info.name)
    #expect{page}.to have_content 'Signed in as'
    #expect{page}.to have_content 'Sign out'
  end
 
  scenario "fails at login with facebook" do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    click_link "Sign in with Facebook"
 
    expect{User.count} == (0)
    expect{current_path} == ('/')
  end
 
end