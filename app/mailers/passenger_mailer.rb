class PassengerMailer < ApplicationMailer
  default from: 'odin_airlines@top.com'

  def confirmation_email(passenger)
    @user = passenger
    @url = 'http://odin-airlines.com/ticket'
    mail(to: @user.email, subject: 'You have booked your ticket')
  end
end
