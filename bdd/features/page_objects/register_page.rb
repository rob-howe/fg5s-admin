class RegisterPage
  include PageObject

  page_url "localhost:4569/register"

  h1(:heading, :id => 'heading')
  h1(:confirmation_heading, :id => 'confirmation_heading')

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
  td(:registered_age_group, :id => 'registered_age_group')
  td(:registered_club_name, :id => 'registered_club_name')
  td(:registered_manager_name, :id => 'registered_manager_name')
  td(:registered_email_address, :id => 'registered_email_address')
  td(:registered_mobile_phone, :id => 'registered_mobile_phone')
  td(:registered_home_phone, :id => 'registered_home_phone')
  td(:registered_address_line1, :id => 'registered_address_line1')
  td(:registered_address_line2, :id => 'registered_address_line2')
  td(:registered_town, :id => 'registered_town')
  td(:registered_county, :id => 'registered_county')
  td(:registered_postcode, :id => 'registered_postcode')
  div(:errors, :id => 'errors')


end