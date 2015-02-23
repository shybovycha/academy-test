cities = CreateCitiesService.new.call
puts "CREATED CITIES: #{ cities.map(&:name).join(', ') }"

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
