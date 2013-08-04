class AccountPage < SitePrism::Page
  set_url 'http://account.lvh.me/'

  section :sign_in, SignInSection, '#sign_in'
end
