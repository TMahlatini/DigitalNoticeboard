class StickerNotesController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @sticker_note = StickerNote.new
    end
  
    def create
      @sticker_note = current_user.sticker_notes.build(sticker_note_params)
      if @sticker_note.save
        redirect_to root_path, notice: 'Sticker note created successfully!'
      else
        render :new, alert: 'Error creating sticker note. Please try again.'
      end
    end
  
    def show
      @sticker_note = StickerNote.find(params[:id])
    end
  
    private
  
    def sticker_note_params
      params.require(:sticker_note).permit(:title, :content)
    end
  end
  