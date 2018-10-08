class BookingsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index

    condition = []
    condition << "facility_items.facility_name ILIKE '%#{params[:query]}%'" if params[:query].present?

    condition = condition.join(' and ')
    @bookings = Booking.includes({meeting_room: :facility_items}).where(condition).references(:facility_items).order(:id).page params[:page]
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        if @booking[:status].to_i != 0
          ApplicationMailer.booking_confirmation_for_waiting(current_user,@booking).deliver
          format.html { redirect_to bookings_path, :flash=> {notice: "This time slot is already booked. You are in Queue, If earlier record get cancelled then you will get the room booking confirmation" }}
          format.json { render :index, status: :created, location: bookings_path}
        else
          ApplicationMailer.booking_confirmation(current_user).deliver
          format.html { redirect_to bookings_path, :flash=> {notice: 'Booking was successfully Created.' }}
          format.json { render :index, status: :created, location: bookings_path }
        end
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        ApplicationMailer.update_confirmed_booking(current_user).deliver
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      ApplicationMailer.booking_cancellation(current_user).deliver
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:meeting_room_id, :user_id, :start_date, :duration,:status, :end_date)
    end
end
