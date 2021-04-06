class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :update]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @markers = [{ lat: @booking.shop.latitude, lng: @booking.shop.longitude}]
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @shop = Shop.find(params[:shop_id])
    @booking.shop = @shop
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking), notice: "Your appointment at #{@shop.name} is created!"
    else
      render "shops/show"
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking), notice: "Booking updated!"
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: "Booking deleted!"
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:date, :comment, :status)
  end
end
