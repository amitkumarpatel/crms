class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  CRMS_PART = "https://meeting-room-management.herokuapp.com/users/sign_in"

  def booking_confirmation(user)
    @user = user
    @url  = CRMS_PART
    mail(to: @user.email, subject: 'Confirmation mail for Room Booking')
  end

   def booking_cancellation(user)
    @user = user
    @url  = CRMS_PART
    mail(to: @user.email, subject: 'Room booking cancelation mail')
  end

  def booking_confirmation_for_waiting(user,booking)
    @user = user
    @booking = booking
    @url  = CRMS_PART
    mail(to: @user.email, subject: 'Confirmation mail for Room Booking')
  end

  def update_booking_confirmation(user,booking)
  	@user = user
    @booking = booking
    @url  = CRMS_PART
    mail(to: @user.email, subject: 'Update of Room Booking status')
  end

  def update_confirmed_booking(user)
  	@user = user
    @url  = CRMS_PART
    mail(to: @user.email, subject: 'Room Booking updates')
  end

end
