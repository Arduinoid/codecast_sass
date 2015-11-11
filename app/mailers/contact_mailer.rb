class ContactMailer < ActionMailer::Base
    default to: "pinnowj@gmail.com"
    def contact_email(name, email, body)
        @name = name
        @email = email
        @body = body
        
        mail(from: email, subject: "Contact F orm Message")
    end
end