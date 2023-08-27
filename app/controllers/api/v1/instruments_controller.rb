module Api
  module V1
    require 'json'
    class InstrumentsController < ApplicationController
      protect_from_forgery with: :null_session
      # before_action :authenticate_user!, only: %i[new create edit update destroy]
      before_action :set_instrument, only: %i[show edit update destroy]
      helper_method :distance_from_user

      def index
        @instruments =  if params[:query].present?
                          Instrument.search(params[:query])
                        else
                          Instrument.all
                        end
        if params[:dates].present?
          @start_date = Date.parse(params[:dates].split(' to ').first)
          @end_date = Date.parse(params[:dates].split(' to ').last)
          @instruments = @instruments.available_between(@start_date, @end_date)
        end
        if params[:distance].present? && params[:distance].to_i != 100
          @instruments = @instruments.near(visitor_coordinates, params[:distance], units: :km)
        end

        render json: InstrumentSerializer.new(@instruments, options).serialized_json
      end

      def show
        # @user = User.find(@instrument.user_id)
        # @instrument_bookings = booked_dates(@instrument.bookings)
        # @booking = Booking.new
        # @distance = distance_from_user(@instrument)
        # 1. test whether logged in user == instrument.user
        # @my_instrument = (@user == current_user)
        # 2. if true, render buttons for edit and destroy
        render json: InstrumentSerializer.new(@instrument, options).serialized_json
      end

      def new
        @instrument = Instrument.new
      end

      def create
        @instrument = Instrument.new(instrument_params)
        if @instrument.save
          render json: InstrumentSerializer.new(@instrument).serialized_json
        else
          render json: { error: @instrument.errors.messages }, status: 422
        end
      end

      def edit
      end

      def update
        if @instrument.update(instrument_params)
          render json: InstrumentSerializer.new(@instrument, options).serialized_json
        else
          render json: { error: @instrument.errors.messages }, status: 422
        end
      end

      def destroy
        if @instrument.destroy
          head :no_content
        else
          render json: { error: @instrument.errors.messages }, status: 422
        end
      end

      def distance_from_user(instrument)
        Geocoder::Calculations.distance_between(
          visitor_coordinates, instrument.coordinates
        ).round
      end

      private

      def booked_dates(bookings)
        booked_dates = []
        bookings.each do |booking|
          booked_dates.push({ from: booking.start_date.to_s, to: booking.end_date.to_s })
        end
        return booked_dates.to_json
      end

      def set_instrument
        @instrument = Instrument.find_by_id(params[:id])
      end

      def instrument_params
        params.require(:instrument)
              .permit(
                :model,
                :brand,
                :category,
                :daily_price,
                :description,
                :image_url,
                :city,
                :user_id
              )
        # .merge(user: current_user)
      end

      def options
        @options ||= { include: %i[bookings] }
      end
    end
  end
end
