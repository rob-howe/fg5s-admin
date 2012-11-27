class FivesTeam < ActiveRecord::Base
  self.table_name = "fives_team"
  #attr_accessor :id,
  #              :age_group,
  #              :team_name,
  #              :team_designation,
  #              :manager_name,
  #              :home_phone,
  #              :mobile_phone,
  #              :email_address,
  #              :paid,
  #              :paypal,
  #              :address_line1,
  #              :address_line2,
  #              :address_town,
  #              :address_county,
  #              :address_postcode,
  #              :date_registered,
  #              :division

  belongs_to :age_group

  def ref_id
    ref_id = "000#{self.id}"
    "fg5s-" + ref_id[-3..-1]
  end
end