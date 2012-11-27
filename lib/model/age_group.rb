require 'active_record'
class AgeGroup < ActiveRecord::Base
  #attr_accessor :description , :day

  self.table_name = "age_group"

  has_many :fives_teams

  def exhibition_team?
     self.description.match /U6|U7|U8/
  end

end