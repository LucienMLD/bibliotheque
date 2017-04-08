class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @booking = Booking.new
    @books = Book.where(aasm_state: "unvailable")
  end

  def new
    @booking = Booking.new
    @users = User.all
    @books = Book.all
  end

  def create
    @booking = Booking.new(booking_params)
    @book = Book.find(@booking.book)
    if @booking.valid? && @book.available?
      @booking.save
      @book.borrowed!
      flash[:notice] = "#{@book.title} est maintenant indisponible"
      respond_to do |format|
        format.html { redirect_to new_booking_path }
        format.js
      end
    elsif @booking.valid?
      flash[:alert] = "#{@book.title} n'est pas disponible"
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

  def destroy
    @booking = Booking.find(params[:booking][:id])
    @book = @booking.book
    @book.rendered!
    @booking.delete
    redirect_to bookings_path
    flash[:notice] = "#{@book.title} est de <nouveau></nouveau> disponible"
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :book_id)
  end
end
