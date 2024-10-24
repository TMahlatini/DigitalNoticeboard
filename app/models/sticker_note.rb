class StickerNote < ApplicationRecord
  belongs_to :user
  
  def expired?
    date_sent < 1.month.ago || (requested_date.present? && requested_date < Date.today)
  end

  def self.not_expired
    where("date_sent >= ? AND (requested_date IS NULL OR requested_date >= ?)", 1.month.ago, Date.today)
  end
end
