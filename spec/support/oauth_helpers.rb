module OauthHelpers
  def auth_data
    user = attributes_for(:user)
 
      OmniAuth::AuthHash.new(
      {
        provider: user[:provider],
        uid: user[:uid].to_s,
        info: {
          name: user[:name],
          email: user[:email]
        }
      }
    )
  end
 
  def invalid_auth_data
    user = attributes_for(:user)
 
    OmniAuth::AuthHash.new(
      {
        provider: user[:provider],
        uid: user[:uid],
        info: { name: "", email: "" }
      }
    )
  end
 
  def sign_in_with_facebook
    OmniAuth.config.mock_auth[:facebook] = auth_data
    click_link "Sign in with Facebook"
  end
end