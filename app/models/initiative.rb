class Initiative < ActiveRecord::Base
  belongs_to :ong
  has_one :initiative_stat, dependent: :destroy
  has_many :donations, dependent: :destroy
  has_many :signs, dependent: :destroy
  has_many :ads, dependent: :destroy
  has_many :related_links, dependent: :destroy
  
  has_attached_file :image,
      styles: { medium: "300x300>", thumb: "80x80>" },
      default_url: '/assets/placeholder.png'
  
  scope :ong_by_actions, -> (ong) { where(ong: ong).order('donations_active OR signs_active DESC, created_at DESC') }
  scope :only_active, -> { where(active: true) }
  
  # delegate :signs_count, to: :initiative_stat
  delegate :donations_count, to: :initiative_stat
  
  validates :title, presence: true
  validates :description, presence: true
  validates :hashtag, presence: true, format: { with: /\A[a-z][\w]*\Z/i }
  
  def has_actions?
    signs_active || donations_active
  end
  
end
