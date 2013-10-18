class Sign < ActiveRecord::Base
  belongs_to :initiative, counter_cache: true
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_blank: true }, uniqueness: { scope: :initiative_id, allow_blank: true }
  validates :identifier, presence: true, rut: { allow_blank: true }, uniqueness: { scope: :initiative_id }
end
