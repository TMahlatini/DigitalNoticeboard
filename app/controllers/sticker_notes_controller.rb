class StickerNotesController < ApplicationController
    #before_action :authenticate_user!
    before_action :admin_user_only, only: [:destroy]
  
    def new
      @sticker_note = StickerNote.new
      
    end

    def destroy
        @sticker_note = StickerNote.find(params[:id])
        if @sticker_note.destroy
          redirect_to root_path, notice: 'Sticky note successfully deleted.'
        else
          redirect_to root_path, alert: 'Error deleting sticky note.'
        end
      end
      
  
    def create
      @sticker_note = StickerNote.new(sticker_note_params)
      @sticker_note.user = User.admin_user
      if @sticker_note.save
        redirect_to root_path, notice: 'Sticker note created successfully!'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def show
      @sticker_note = StickerNote.find(params[:id])
    end

    def expired_notes
      @expired_notes = StickerNote.where("date_sent < ? OR (requested_date IS NOT NULL AND requested_date < ?)", 1.month.ago, Date.today)
    end
  
    private
  
    def sticker_note_params
      params.require(:sticker_note).permit(:title, :content, :sender_email, :date_sent, :requested_date, :requesting_ride, :location_request)
    end

    def admin_user_only
      unless current_user.admin?
        redirect_to root_path, alert: 'You are not authorized to perform this action.'
      end
    end
  end

  