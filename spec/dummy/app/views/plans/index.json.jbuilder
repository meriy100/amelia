json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :date
  json.url plan_url(plan, format: :json)
end
