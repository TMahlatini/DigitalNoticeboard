class StickerNotesController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @sticker_note = StickerNote.new
    end

    def destroy
        @sticker_note = current_user.sticker_notes.find(params[:id])
        if @sticker_note.destroy
          redirect_to root_path, notice: 'Sticky note successfully deleted.'
        else
          redirect_to root_path, alert: 'Error deleting sticky note.'
        end
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
  