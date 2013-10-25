class Commission < ActiveRecord::Base
  belongs_to :chamber
  has_and_belongs_to_many :representatives
  
end
