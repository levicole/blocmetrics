class Application < ActiveRecord::Base
  belongs_to :user
  validates :url, uniqueness:true
end
