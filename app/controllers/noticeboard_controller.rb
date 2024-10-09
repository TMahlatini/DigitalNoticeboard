class NoticeboardController < ApplicationController
  before_action :authenticate_user! # this line is used to make sure that only logged in users can access the noticeboard page

  def index
    @sticker_notes = StickerNote.all.order(created_at: :desc)  #retrieves all the sticker notes from the database and orders them by the time they were created
  end



  def new
  end

  def create
  end

  def show
  end
end
