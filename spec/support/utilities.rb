include ApplicationHelper

def sign_in(user, options = {})
  if options[:no_capybara]
    # Sign in when not using Capybara
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
    visit signin_path
    fill_in "Email",   with: user.email.upcase
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end

def sign_out(options = {})
  click_link 'Sign out'
end

def user_params
  { user: { name: "Example user",
            email: "user@example.com",
            password: "password",
            password_confirmation: "password" } }
end

def signin_params
  { email: "user@example.com", password: "password" }
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end