class InstrumentSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :model,
              :brand,
              :category,
              :daily_price,
              :image_url,
              :description,
              :city,
              :latitude,
              :longitude,
              :user_id

  has_many :bookings
end
