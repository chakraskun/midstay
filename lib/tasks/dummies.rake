namespace :dummies do
  desc 'add neighborhoods'
  task neighbor: :environment do
    bali = Neighborhood.find_or_initialize_by(
      name: 'Bali'
    )
    bali.north_boundary = -8.013862
    bali.west_boundary = 114.437166
    bali.east_boundary = 115.695202
    bali.south_boundary = -8.895744
    bali.save!
    
    jakarta = Neighborhood.find_or_initialize_by(
      name: 'Jakarta'
    )
    jakarta.north_boundary = -6.061452
    jakarta.west_boundary = 106.680410
    jakarta.east_boundary = 106.982148
    jakarta.south_boundary = -6.379064
    jakarta.save!
  end
end
