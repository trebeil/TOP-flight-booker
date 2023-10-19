class PassengerMailer < ApplicationMailer
  default from: 'nao-responda@exemplo.com.br'

  def booking_confirmation_email
    @booking = params[:booking]
    @passenger = params[:passenger]
    mail(to: @passenger.email,
         subject: "Booking confirmed - Flight #{@booking.flight_id}")
  end
end
