class Initiative < ActiveRecord::Base
  belongs_to :ong
  has_one :initiative_stat
  
  delegate :signs_count, to: :initiative_stat
  delegate :donations_count, to: :initiative_stat
end
