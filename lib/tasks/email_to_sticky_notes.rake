namespace :email do
  desc "Fetch emails from Flask API and create or update sticky notes"
  task create_sticky_notes: :environment do
    puts "Fetching emails and creating sticky notes"
    FetchEmailsService.fetch_and_create_sticky_notes
  end
end
