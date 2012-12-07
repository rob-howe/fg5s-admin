class RegisterPage
  include PageObject

  page_url "localhost:4569/register"

  h1(:heading, :id => 'heading')

  select_list(:age_group, :id => 'age_group')
  text_field(:team_name, :id => "team_name")
  text_field(:designation, :id => "designation")
  text_field(:manager_name, :id => "manager_name")
  text_field(:email_address, :id => "email_address")
  text_field(:mobile_phone, :id => "mobile_phone")
  text_field(:home_phone, :id => "home_phone")
  text_field(:address_line1, :id => "address_line1")
  text_field(:address_line2, :id => "address_line2")
  text_field(:town, :id => "town")
  text_field(:county, :id => "county")
  text_field(:postcode, :id => "postcode")
  button(:submit_team, :id => 'submit_team')


end