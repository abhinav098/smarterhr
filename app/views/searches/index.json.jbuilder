json.accesses @accesses do |access|
  json.call(access, :name)
  json.url new_access_issuance_url(access)
end
json.equipment @equipment do |equipment|
  json.call(equipment, :name)
  json.url equipment_issuances_url(equipment, method: :post, format: :json)
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
