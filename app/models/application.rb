class Application < ActiveRecord::Base
  belongs_to :user
  has_many :events
  validates :url, uniqueness:true
end
