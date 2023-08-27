class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :first_name, :last_name, :city, :latitude, :longitude

  has_many :bookings
end
