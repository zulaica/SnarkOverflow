class Answer < ActiveRecord::Base

  after_create :send_welcome_message

  belongs_to :question
  belongs_to :user

  validates :body, :presence => true
  validates :user_id, :presence => true
  validates :question_id, :presence => true

  scope :by_date, -> { order(created_at: :desc) }

private
  def send_welcome_message
    UserMailer.welcome_email(self.question.user).deliver_now
  end
end
