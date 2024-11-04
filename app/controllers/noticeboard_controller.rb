class NoticeboardController < ApplicationController
  before_action :authenticate_user!, except: [:index] # this line is used to make sure that only logged in users can access the noticeboard page

  def index
    @sticker_notes = StickerNote.not_expired.order(date_sent: :desc)

  end

  
end
