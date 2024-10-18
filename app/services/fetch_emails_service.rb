require 'http'

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
        StickerNote.create!(
          title: email['subject'],
          content: email['body'],
          email_thread_id: email['message_id'],
          sender_email: email['sender'],
          user: User.admin_user 
        )
        puts "Created sticky note for email: #{email['subject']}"
      end
    end
  end
end
