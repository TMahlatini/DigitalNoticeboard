require 'http'
require 'date'

class FetchEmailsService
  FLASK_API_URL = Rails.application.credentials.fetch_emails_url


  def self.fetch_and_create_sticky_notes
    response = HTTP.get(FLASK_API_URL)
    email_data = JSON.parse(response.body.to_s)

    email_data.each do |email|
      existing_note = StickerNote.find_by(email_thread_id: email['message_id'])

      if existing_note
        existing_note.update(
          title: email['subject'],
          content: email['body']
        )
        puts "Updated sticky note for email thread: #{email['message_id']}"
      else
        
        regex_ride_type_request = /(need a ride|looking for a ride|give me a ride|will pay for gas|provide snacks| ISO|cover gas)/i
        regex_location_request = /(Airport|Seattle|Portland|Pasco|Oregon|ALW|Idaho|Spokane|Tacoma)/i
        regex_date_request = /\b(?:Mon(?:day)?|Tue(?:sday)?|Wed(?:nesday)?|Thu(?:rsday)?|Fri(?:day)?|Sat(?:urday)?|Sun(?:day)?),?\s*(?:the\s*)?(?:(?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|Oct(?:ober)?|Nov(?:ember)?|Dec(?:ember)?)\s+\d{1,2}(?:st|nd|rd|th)?)?,?\s*\d{4}?\b/i

        requested_date_string = (email['subject'] + email['body']).scan(regex_date_request).first
        requested_date = nil

        if requested_date_string
          begin
            requested_date = Date.parse(requested_date_string)
          rescue Date::Error
            # Handle parsing errors, e.g., log the error or set a default date
            puts "Error parsing date: #{requested_date_string}"
          end
        end

        requesting_ride_true = (email['subject'] + email['body']).match?(regex_ride_type_request)
        location_request = (email['subject'] + email['body']).match?(regex_location_request)
        

        StickerNote.create!(
          title: email['subject'],
          content: email['body'],
          email_thread_id: email['message_id'],
          sender_email: email['sender'],
          date_sent: DateTime.parse(email['date']),
          user: User.admin_user,
          requested_date: requested_date,
          requesting_ride: requesting_ride_true,
          location_request: location_request
        )
        puts "Created sticky note for email: #{email['subject']} sent at #{email['date']}"
        puts "requested_date: #{requested_date}"
        puts "requesting_ride_true: #{requesting_ride_true}"
        puts "location_request: #{location_request}"
      end
    end
  end
end
