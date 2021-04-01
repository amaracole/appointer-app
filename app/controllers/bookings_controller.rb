class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @booking = Booking.new(booking_params)
    @booking.shop = @shop
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path(@booking), notice: "Your appointment at #{@shop} is created!"
    else
      render "shops/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :comment)
  end
end
