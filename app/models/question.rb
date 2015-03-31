class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :title, :presence => true
  validates :body, :presence => true
  # validates :user_id, :presence => true

  scope :by_date, -> { order(created_at: :desc) }

end
