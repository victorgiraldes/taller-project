class ReservationsController < ApplicationController



  
  def set_book
    @book = Book.find(params[:id])
  end
end
