class Registration < ApplicationRecord
  belongs_to :event

  validates :name, presence: true

  validates :email, format: { with: /\A#{URI::MailTo::EMAIL_REGEXP}\z/ }

  HOW_HEARD_OPTIONS = [
    "Newsletter",
    "Blog Post",
    "Twitter",
    "Web Search",
    "Friend/Coworker",
    "Other"
]
  validates :how_heard,
            inclusion: { in: HOW_HEARD_OPTIONS }
end
