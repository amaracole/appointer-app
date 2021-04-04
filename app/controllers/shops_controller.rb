class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  def index
    @shops = policy_scope(Shop)
  end

  # GET /shops/1
  def show
    @booking = Booking.new
    authorize @booking
    @markers = [{ lat: @shop.latitude, lng: @shop.longitude}]
  end

  # GET /shops/new
  def new
    @shop = Shop.new
    authorize @shop

    @markers = @shops.geocoded.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude
      }
    end
  end

  # GET /shops/1/edit
  def edit

  end

  # POST /shops
  def create
    @shop = Shop.new(shop_params)
    authorize @shop

    if @shop.save!
      redirect_to shop_path(@shop), notice: 'Shop was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shops/1
  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop), notice: 'Shop was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shops/1
  def destroy
    @shop.destroy
    redirect_to shops_url, notice: 'Shop was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shop
    @shop = Shop.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def shop_params
    params.require(:shop).permit(:name, :address, :description, :availability, :phone_number, :category, :capacity, :longitude, :latitude, :photo)
  end
end
