Given(/^the (.*) team is closed$/) do |team|
  age_group = AgeGroup.find_by(description: team)
  age_group.open = false
  age_group.save
end