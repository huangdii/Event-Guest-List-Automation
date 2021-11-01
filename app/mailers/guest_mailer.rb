require "uri"
require "net/http"
require "json"
class GuestMailer < ApplicationMailer
    default from: 'notifications@example.com'
    # def rsvp_invitation_email(event, guest)
    def rsvp_invitation_email(guest)
        url = URI.parse(ENV['TRUSTIFI_URL'] + "/api/i/v1/email")
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        
        request = Net::HTTP::Post.new(url)
        request["x-trustifi-key"] = ENV['TRUSTIFI_KEY']
        request["x-trustifi-secret"] = ENV['TRUSTIFI_SECRET']
        request["content-type"] = "application/json"
        request.body = "{\"recipients\": [{\"email\": \"hwangdi66@gmail.com\"}],\"title\":\"Title\",\"html\":\"Body\"}"
    
        response = https.request(request)
        puts response.read_body
        
        # puts @guest.email_address.to_s
        flash[:notice] = "hi hello what's up"
        # @event = event
        @guest = guest
        @url = 'http://www.gmail.com'
        # mail(to: @guest.email, subject: "- Invitation")
    end
    
    def rsvp_confirmation_email(event, guest)
        @event = event
        @guest = guest
        
        mail(to: @guest.email_address, subject: "#{@event.title} - Seating Confirmation")
    end
    
    #########
    # require "uri"
    # require "net/http"
    # require "json"
    
        
end
