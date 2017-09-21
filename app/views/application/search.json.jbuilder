json.accesses @accesses do |access|
  json.call(access, :name)
  json.url access_url(access, format: :json)
end
json.equipment @equipment do |equipment|
  json.call(equipment, :name)
  json.url equipment_url(equipment, format: :json)
end
# json.accesses do
#   json.array!(@accesses) do |access|
#     json.name access.name
#     json.url access_url(access, format: :json)
#   end
# end
#
# json.equipment do
#   json.array!(@equipment) do |equipment|
#     json.name equipment.name
#     json.url equipment_url(equipment, format: :json)
#   end
# end
