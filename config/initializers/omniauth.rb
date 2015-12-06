Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  :scope => 'public_profile, email,user_birthday,user_relationship_details', :display => 'popup',
  :authorize_url => "https://www.facebook.com/v2.0/dialog/oauth"
end
