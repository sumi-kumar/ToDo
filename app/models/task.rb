class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :taskable, polymorphic: true
  has_many :tasks, as: :taskable
  # default_scope -> {order(created_at: :desc)}

  validates :title, presence: true, :length => {maximum: 20}
  validates :note, presence: true, :length => {maximum: 50}
end
