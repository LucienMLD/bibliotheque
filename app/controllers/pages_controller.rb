class PagesController < ApplicationController

  def home
    @books = Book.all
    @books_available = Book.available
    @users = User.all
    @borrower = []

    @users.each do |user|
      @borrower << user if user.booking.present?
    end
  end
end
