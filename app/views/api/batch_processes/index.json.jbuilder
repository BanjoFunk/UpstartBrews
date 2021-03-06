json.all_processes do
  json.array! @process_types.each do |type|
    json.name type.name
    json.currently_on @batch_processes.kind(type.name).current.count > 0
    json.order type.sort_order
  end
end
json.batch_processes do
  json.array! @batch_processes do |batch_process|
    json.partial! '/api/batch_processes/batch_process', batch_process: batch_process
  end
end