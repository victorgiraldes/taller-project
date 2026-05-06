class BooksController < ApplicationController
  before_action :set_book, only: [:reserve, :reserves]

  def reserves
    reservations = @book.reservations.order(created_at: :desc)

    render json: reservations, status: :ok
  end

  def reserve
    email = params[:email]
    service = BookReservationService.call(@book, email)

    if service
      render json: { message: 'Book reserved successfully' }, status: :ok
    else
      render json: { error: 'Book is already reserved' }, status: :unprocessable_entity
    end
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
