class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @booking = Booking.new
  end

  def new
    @booking = Booking.new
    @users = User.all
    @books = Book.all
  end

  def create
    @booking = Booking.new(booking_params)
    @book = Book.find(@booking.book)
    if @booking.save && @book.available?
      @book.borrowed!
      flash[:notice] = "#{@book.title} est maintenant indisponible"
      respond_to do |format|
        format.html { redirect_to new_booking_path }
        format.js
      end
    elsif @booking.save
      flash[:notice] = "#{@book.title} n'est pas disponible"
      respond_to do |format|
        format.html { render 'bookings/new' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'bookings/new' }
        format.js
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :book_id)
  end
end
