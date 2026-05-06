require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "POST /reserve" do
    let(:book) { create(:book) }
    let(:valid_email) { "test@example.com" }

    it "reserves a book successfully" do
      post "/books/#{book.id}/reserve", params: { email: valid_email }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["message"]).to eq("Book reserved successfully")
    end

    it "returns an error if the book is already reserved" do
      create(:reservation, book: book, email: valid_email, status: :reserved)

      post "/books/#{book.id}/reserve", params: { email: valid_email }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)["error"]).to eq("Book is already reserved")
    end
  end

  describe "GET /reserves" do
    let(:book) { create(:book) }
    let!(:reservation1) { create(:reservation, book: book, email: "test@example.com", status: :reserved) }

    it 'returns a list of reservations for the book' do
      get "/books/#{book.id}/reserves"
      expect(response).to have_http_status(:ok)
      reservations = JSON.parse(response.body)
      expect(reservations.length).to eq(1)
      expect(reservations.first["email"]).to eq(reservation1.email)
    end
  end
end
