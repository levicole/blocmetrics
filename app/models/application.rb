class Application < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy
  validates :url, uniqueness:true
end
