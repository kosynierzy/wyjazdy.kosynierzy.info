class SignInSection < SitePrism::Section
  element :username, '#user_username'
  element :password, '#user_password'
  element :submit, 'input[type=submit]'
end
