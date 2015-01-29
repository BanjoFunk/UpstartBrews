json.id batch.id
json.fermenter batch.fermenter.id
json.fermenter_state batch.fermenter.state_name
json.full batch.fermenter.state_name == 'full'
json.flavor do |flavor|
  flavor.name batch.flavor.name
  flavor.abv batch.flavor.name.split(/\s+/).map(&:first).join.upcase
  json.color do |color|
    flavor.primary "Flavor::#{batch.flavor.name.gsub(' ','_').upcase}".constantize[:primary]
    flavor.secondary "Flavor::#{batch.flavor.name.gsub(' ','_').upcase}".constantize[:secondary]
  end
end
json.inventory_set batch.inventory_set
json.created_at batch.created_at.in_time_zone.strftime("%m/%d/%Y")
json.brew_date batch.brew_date.in_time_zone.strftime("%m/%d/%Y")
json.days_ago ((Time.current - batch.brew_date.in_time_zone)/(60*60*24)).round
json.last_ph batch.batch_readings.order("reading_date DESC").first.ph.to_f.to_s
json.last_brix batch.batch_readings.order("reading_date DESC").first.brix.to_f.to_s
json.batch_reading_days_ago ((Time.current - batch.batch_readings.order("reading_date DESC").first.reading_date.in_time_zone)/(60*60*24)).round
