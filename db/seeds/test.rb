lemon = Flavor.create(:name => 'lemon ginger')
berry = Flavor.create(:name => 'berry black')
mint = Flavor.create(:name => 'mint green')
rose = Flavor.create(:name => 'rose bud')

circulation = ProcessType.create(:name => 'circulation', :sort_order => 0, :category => ProcessType::FERMENTATION)
ventilation = ProcessType.create(:name => 'ventilation', :sort_order => 1, :category => ProcessType::FERMENTATION)
aeration = ProcessType.create(:name => 'aeration', :sort_order => 2, :secure => true, :category => ProcessType::FERMENTATION)
refrigeration = ProcessType.create(:name => 'refrigeration', :sort_order => 3, :category => ProcessType::FERMENTATION)
carbonation = ProcessType.create(:name => 'carbonation', :sort_order => 4, :category => ProcessType::CARBONATION)
bottling = ProcessType.create(:name => 'bottling', :sort_order => 5, :category => ProcessType::BOTTLING)

admin = User.create(:email => 'admin@bcj.com', :first_name => "Josh", :last_name => "Goodbelly", :password => 'testeroo', :password_confirmation => 'testeroo', :roles => [:admin])
brewer = User.create(:email => 'brewer@bcj.com', :first_name => "Phil", :last_name => "Sunderson", :password => 'testeroo', :password_confirmation => 'testeroo', :roles => [:brewer])
sales = User.create(:email => 'sales@bcj.com', :first_name => "Tania", :last_name => "Tazmania", :password => 'testeroo', :password_confirmation => 'testeroo', :roles => [:sales])

pkg4 = PackageType.create(:name => 'half_keg', :capacity => '15.5 gallons', :sort_order => 1)
pkg3 = PackageType.create(:name => 'sixth_keg', :capacity => '5 gallons', :sort_order => 2)
pkg2 = PackageType.create(:name => 'growler', :capacity => '64 oz', :sort_order => 3)
pkg4 = PackageType.create(:name => 'case', :capacity => '12 bottles', :sort_order => 4)
pkg1 = PackageType.create(:name => 'bottle', :capacity => '16 oz', :sort_order => 5)

ferm_1 = Fermenter.create(:flavor_id => lemon.id,:capacity => 250, :position => 1, :state => 1)
ferm_2 = Fermenter.create(:flavor_id => berry.id,:capacity => 250, :position => 2, :state => 1)
ferm_3 = Fermenter.create(:flavor_id => mint.id,:capacity => 250, :position => 3, :state => 1)
ferm_4 = Fermenter.create(:flavor_id => rose.id,:capacity => 250, :position => 4, :state => 0)
ferm_5 = Fermenter.create(:flavor_id => lemon.id,:capacity => 250, :position => 5, :state => 1)
ferm_6 = Fermenter.create(:flavor_id => berry.id,:capacity => 250, :position => 6, :state => 1)
ferm_7 = Fermenter.create(:flavor_id => mint.id,:capacity => 250, :position => 7, :state => 1)
ferm_8 = Fermenter.create(:flavor_id => rose.id,:capacity => 250, :position => 8, :state => 1)
ferm_9 = Fermenter.create(:flavor_id => lemon.id,:capacity => 250, :position => 9, :state => 1)
ferm_10 = Fermenter.create(:flavor_id => berry.id,:capacity => 250, :position => 10, :state => 1)
ferm_11 = Fermenter.create(:flavor_id => mint.id,:capacity => 250, :position => 11, :state => 1)
ferm_12 = Fermenter.create(:flavor_id => rose.id,:capacity => 250, :position => 12, :state => 1)

#lemon
Batch.create(:flavor_id => lemon.id, :fermenter_id => ferm_1.id, :state => 1, :brew_date => (Time.current-rand(1..20).days))
Batch.create(:flavor_id => lemon.id, :fermenter_id => ferm_5.id, :state => 1, :brew_date => (Time.current-rand(1..20).days))

#berry
Batch.create(:flavor_id => berry.id, :fermenter_id => ferm_10.id, :state => 1, :brew_date => (Time.current-rand(1..20).days))
Batch.create(:flavor_id => berry.id, :fermenter_id => ferm_6.id, :state => 1, :brew_date => (Time.current-rand(1..20).days))

#mint
Batch.create(:flavor_id => mint.id, :fermenter_id => ferm_3.id, :state => 1, :brew_date => (Time.current-rand(1..20).days))
Batch.create(:flavor_id => mint.id, :fermenter_id => ferm_11.id, :state => 1, :brew_date => (Time.current-rand(1..20).days))
Batch.create(:flavor_id => mint.id, :fermenter_id => ferm_7.id, :state => 1, :brew_date => (Time.current-rand(1..20).days))

#rose
Batch.create(:flavor_id => rose.id, :fermenter_id => ferm_12.id, :state => 1, :brew_date => (Time.current-rand(1..20).days))
Batch.create(:flavor_id => rose.id, :fermenter_id => ferm_8.id, :state => 1, :brew_date => (Time.current-rand(1..20).days))

Batch.all.each do |batch|
  batch.batch_readings.create(:ph => "3.#{rand(7..9)}".to_f.round(1), :temp => "#{rand(68..77)}".to_f.round(1), :brix => "7.#{rand(0..2)}".to_f.round(1), :reading_date => Time.current-rand(10..12).days)
  batch.batch_readings.create(:ph => "3.#{rand(5..7)}".to_f.round(1), :temp => "#{rand(68..77)}".to_f.round(1), :brix => "6.#{rand(8..9)}".to_f.round(1), :reading_date => Time.current-rand(8..9).days)
  batch.batch_readings.create(:ph => "3.#{rand(3..5)}".to_f.round(1), :temp => "#{rand(68..77)}".to_f.round(1), :brix => "6.#{rand(6..8)}".to_f.round(1), :reading_date => Time.current-rand(6..7).days)
  batch.batch_readings.create(:ph => "3.#{rand(2..3)}".to_f.round(1), :temp => "#{rand(68..77)}".to_f.round(1), :brix => "6.#{rand(3..6)}".to_f.round(1), :reading_date => Time.current-rand(3..5).days)
  batch.batch_readings.create(:ph => "3.#{rand(0..2)}".to_f.round(1), :temp => "#{rand(68..77)}".to_f.round(1), :brix => "6.#{rand(0..2)}".to_f.round(1), :reading_date => Time.current-rand(0..2).days)

  batch.comments.create(:user_id => admin.id, :text => "the brewery smells amazing after cookin this one up!", :created_at => Time.current-21.days)
  batch.comments.create(:user_id => brewer.id, :text => "tests are moving along. still to sweet to taste", :created_at => Time.current-12.days)
  batch.comments.create(:user_id => brewer.id, :text => "tastes amazing. still sweet, but it'll be a good batch", :created_at => Time.current-8.days)
  batch.comments.create(:user_id => admin.id, :text => "Nice man! glad to hear it", :created_at => Time.current-7.days)
  batch.comments.create(:user_id => brewer.id, :text => "pumping over to the bright tank. woot!", :created_at => Time.current-6.days)
  batch.comments.create(:user_id => sales.id, :text => "Good. we need to sell it to whole foods.")

  batch.batch_processes.create(:process_type => circulation, :started => batch.brew_date + 4.days, :stopped => Time.current - 1.day)
  batch.batch_processes.create(:process_type => ventilation, :started => batch.brew_date + 2.days, :stopped => Time.current - 1.day)
end
first_batch = Batch.order('brew_date ASC').first
first_batch.batch_processes.create(:process_type => aeration, :started => Time.current - 6.hours, :stopped => Time.current - 2.hours)

last_batch = Batch.order('brew_date ASC').last
last_batch.batch_processes.create(:process_type => circulation, :started => last_batch.brew_date + 4.days)

finished_batch = Batch.create(:flavor_id => rose.id, :fermenter_id => ferm_4.id, :state => 2, :brew_date => (Time.current-21.days))
finished_batch.batch_readings.create(:ph => "3.#{rand(7..9)}".to_f.round(1), :temp => "#{rand(68..77)}".to_f.round(1), :brix => "7.#{rand(0..2)}".to_f.round(1), :reading_date => Time.current-16.days)
finished_batch.batch_readings.create(:ph => "3.#{rand(5..7)}".to_f.round(1), :temp => "#{rand(68..77)}".to_f.round(1), :brix => "6.#{rand(8..9)}".to_f.round(1), :reading_date => Time.current-12.days)
finished_batch.batch_readings.create(:ph => "3.#{rand(3..5)}".to_f.round(1), :temp => "#{rand(68..77)}".to_f.round(1), :brix => "6.#{rand(6..8)}".to_f.round(1), :reading_date => Time.current-9.days)
finished_batch.batch_readings.create(:ph => "3.#{rand(2..3)}".to_f.round(1), :temp => "#{rand(68..77)}".to_f.round(1), :brix => "6.#{rand(3..6)}".to_f.round(1), :reading_date => Time.current-8.days)
finished_batch.batch_readings.create(:ph => "3.#{rand(0..2)}".to_f.round(1), :temp => "#{rand(68..77)}".to_f.round(1), :brix => "6.#{rand(0..2)}".to_f.round(1), :reading_date => Time.current-7.days)
finished_batch.batch_readings.create(:ph => "2.9", :temp => "#{rand(68..77)}".to_f.round(1), :brix => "5.9".to_f.round(1), :reading_date => Time.current-6.days)

finished_batch.batch_processes.create(:process_type => circulation, :started => Time.current-19.days, :stopped => Time.current-6.days)
finished_batch.batch_processes.create(:process_type => ventilation, :started => Time.current-19.days, :stopped => Time.current-6.days)
finished_batch.batch_processes.create(:process_type => aeration, :started => Time.current-6.days-6.hours, :stopped => Time.current-6.days-3.hours)

finished_batch.comments.create(:user_id => admin.id, :text => "the brewery smells amazing after cookin this one up!", :created_at => Time.current-21.days)
finished_batch.comments.create(:user_id => brewer.id, :text => "tests are moving along. still to sweet to taste", :created_at => Time.current-12.days)
finished_batch.comments.create(:user_id => brewer.id, :text => "tastes amazing. still sweet, but it'll be a good batch", :created_at => Time.current-8.days)
finished_batch.comments.create(:user_id => admin.id, :text => "Nice man! glad to hear it", :created_at => Time.current-7.days)
finished_batch.comments.create(:user_id => brewer.id, :text => "pumping over to the bright tank. woot!", :created_at => Time.current-6.days)

BatchCarbonationSetting::KINDS.each do |kind_hash|
  finished_batch.batch_carbonation_settings.create_or_update_from_hash(:kind => kind_hash[:kind_id], :quantity => rand(1..27), :unit => kind_hash[:unit])
end

BatchBottleSetting::KINDS.each do |kind_hash|
  finished_batch.batch_bottle_settings.create_or_update_from_hash(:kind => kind_hash[:kind_id], :quantity => rand(1..27), :unit => kind_hash[:unit])
end
