task :seed => :environment do
    100.times do |i|
        c = ['India', 'China', 'Brazil', 'USA'].sample
        u = User.create(name: FFaker::Name.name, country: c)
        s = ['Active', 'Inactive', 'Dormant'].sample
        u.create_status(status: s)
    end
    puts 'Users created'
end
