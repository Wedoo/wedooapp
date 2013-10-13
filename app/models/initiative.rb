class Initiative < ActiveRecord::Base
  belongs_to :ong
  has_one :initiative_stat
  
  scope :ong_by_actions, -> (ong) { where(ong: ong).order('donations_active DESC, signs_active DESC, created_at DESC') }
  
  delegate :signs_count, to: :initiative_stat
  delegate :donations_count, to: :initiative_stat
  
  def has_actions?
    signs_active || donations_active
  end
  
end
