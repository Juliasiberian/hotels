json.extract! hotel, :id, :name, :address, :picture, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
