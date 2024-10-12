class FetchEmailsWorker
  include Sidekiq::Worker

  def perform
    FetchEmailsService.fetch_and_create_sticky_notes
  end
end

