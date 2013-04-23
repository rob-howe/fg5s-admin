class LogInPage
  include PageObject

  page_url "localhost:4569/"

  text_field(:user_name, :id => "user_name")
  text_field(:user_password, :id => "user_password")
  button(:login, :id => 'login')
end