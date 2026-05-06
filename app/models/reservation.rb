class Reservation < ApplicationRecord
  belongs_to :book

  enum :status, { pending: 0, reserved: 1 }
end
