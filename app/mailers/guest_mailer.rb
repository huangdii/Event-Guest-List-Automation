class GuestMailer < ApplicationMailer
    default from: 'notifications@example.com'
    # def rsvp_invitation_email(event, guest)
    def rsvp_invitation_email(guest)
        # puts @guest.email_address.to_s
        flash[:notice] = "hi hello what's up"
        # @event = event
        @guest = guest
        @url = 'http://www.gmail.com'
        mail(to: @guest.email, subject: "- Invitation")
    end
    
    def rsvp_confirmation_email(event, guest)
        @event = event
        @guest = guest
        
        mail(to: @guest.email_address, subject: "#{@event.title} - Seating Confirmation")
    end

end
