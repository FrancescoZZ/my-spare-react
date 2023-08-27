class BookingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_date, :end_date, :cost, :instrument_id, :user_id
end
