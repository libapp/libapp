class ReservationMailer < ApplicationMailer
   default from: "libapp517@gmail.com"

    def reservation_mail(member)
    	@member = member
    	mail(to: @member.email, subject: 'Reservation')
  	end

  	    def release_mail(member)
    	@member = member
    	mail(to: @member.email, subject: 'Release room')
  	end
end
