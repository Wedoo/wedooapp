class Initiative < ActiveRecord::Base
  belongs_to :ong
  has_one :initiative_stat
  has_many :donations
  has_many :signs
  scope :ong_by_actions, -> (ong) { where(ong: ong).order('donations_active DESC, signs_active DESC, created_at DESC') }
  scope :only_active, -> { where(active: true) }
  
  # delegate :signs_count, to: :initiative_stat
  delegate :donations_count, to: :initiative_stat
  
  validates :hashtag, format: { with: /\A[a-z][\w]*\Z/i }
  
  def has_actions?
    signs_active || donations_active
  end
  
end
