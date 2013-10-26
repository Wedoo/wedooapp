class Initiative < ActiveRecord::Base
  belongs_to :ong
  has_one :initiative_stat, dependent: :destroy
  has_one :campaign, dependent: :destroy
  has_many :donations, dependent: :destroy
  has_many :signs, dependent: :destroy
  has_many :ads, dependent: :destroy
  has_many :related_links, dependent: :destroy
  belongs_to :spam_receiver, polymorphic: true
  

  attr_accessor :delete_image, :spam_param
  
  before_save :delete_image?
  
  has_attached_file :image,
      styles: { medium: "300x300>", thumb: "80x80>" },
      default_url: '/assets/placeholder.png',
      path: (Rails.env == 'development' ? ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename" : ":id/:style/:filename"),
      dropbox_options: {
        path: proc { |style| "#{style}/initiative_#{id}/#{image.original_filename}" }
      }
  
  scope :ong_by_actions, -> (ong) { where(ong: ong).order('donations_active OR signs_active DESC, created_at DESC') }
  scope :only_active, -> { where(active: true) }
  
  # delegate :signs_count, to: :initiative_stat
  delegate :donations_count, to: :initiative_stat
  
  validates :title, presence: true
  validates :description, presence: true
  validates :hashtag, presence: true, format: { with: /\A[a-z][\w]*\Z/i }
  
  def has_actions?
    signs_active || donations_active || spam_active
  end
  
  def spam_receiver_selected
    return nil if self.spam_receiver.nil?
    return self.spam_receiver.codename.to_sym if self.spam_receiver_type == Chamber.name
    return :commission if self.spam_receiver_type == Commission.name
    return nil
  end
  
  def spam_receiver_selected=(value)
    case value
    when :commission.to_s
      self.spam_receiver = Commission.find(self.spam_param)
    when :deputies.to_s
      self.spam_receiver = Chamber.find_by(codename: :deputies)
    when :senate.to_s
      self.spam_receiver = Chamber.find_by(codename: :senate)
    end
  end

  def has_paypal_app?
    !self.ong.payment_apps.empty?
  end

  def get_paypal_id
    self.ong.get_paypal.id
  end  
  
  private
  def delete_image?
    image.clear if delete_image == '1'
  end
  


end
