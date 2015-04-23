Given(/^the (.*) team is closed$/) do |team|
  age_group = AgeGroup.find_by_description(team)
  age_group.open = false
  age_group.save
end