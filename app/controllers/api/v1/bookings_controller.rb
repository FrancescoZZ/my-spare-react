module Api
  module V1
    class BookingsController < ApplicationController
      protect_from_forgery with: :null_session
      # before_action :authenticate_user!
      def destroy
        @booking = Booking.find_by_id(params[:id])

        if @booking&.destroy
          head :no_content
        else
          render json: { error: @booking&.errors&.messages }, status: 422
        end
      end

      def create
        @instrument = Instrument.find(params[:instrument_id])
        @booking = Booking.new(booking_params)
        # TODO: make this cost calculation private so that it isn't vulnerable through exposure
        @booking.cost = @instrument.daily_price * (@booking.end_date - @booking.start_date + 1)
        if @booking.save
          render json: BookingSerializer.new(@booking).serialized_json
        else
          render json: { error: @booking.errors.messages }, status: 422
        end
      end

      private

      def booking_params
        # book_start = Date.parse(params["booking"]['start_date'].split.first)
        # book_end = Date.parse(params["booking"]['start_date'].split.last)
        params
          .require(:booking)
          .permit(:start_date, :end_date, :instrument_id, :user_id)
        # .merge(
        #   user: current_user,
        #   start_date: book_start,
        #   end_date: book_end
        # )
      end
    end
  end
end
