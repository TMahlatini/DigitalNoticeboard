class NoticeboardController < ApplicationController
  before_action :authenticate_user!, except: [:index] # this line is used to make sure that only logged in users can access the noticeboard page

  def index
    @sticker_notes = StickerNote.all.order(created_at: :desc)  #retrieves all the sticker notes from the database and orders them by the time they were created
  end

end
