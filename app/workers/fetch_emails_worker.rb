class FetchEmailsWorker

  def perform
    FetchEmailsService.fetch_and_create_sticky_notes
  end
end

