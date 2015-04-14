After('@clean_age_group') do
  AgeGroup.all.each do |age_group|
    age_group.open = true
    age_group.save
  end
end

