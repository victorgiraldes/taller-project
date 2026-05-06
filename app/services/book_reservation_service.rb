class BookReservationService
  attr_reader :book, :reservation

  def initialize(book, email)
    @book = book
    @user_email = email
  end

  def self.call(book, email)
    new(book, email).call
  end

  def call
    return false unless @book
    return false if already_reserved?

    @reservation = Reservation.create(book: @book, email: @user_email, status: :reserved)

    return true if @reservation.persisted?

    false
  end

  def already_reserved?
    Reservation.exists?(book: @book, status: :reserved)
  end
end