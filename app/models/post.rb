class Post < ActiveRecord::Base
  # attr_accessible :body, :title
  has_many :comments
  belongs_to :user
  belongs_to :topic
  default_scope { order('created_at DESC') }

  validates :title, length: {minimum: 5}, presence: true
  validates :user, presence: true
  validates :topic, presence: true

  scope :ordered_by_title, -> {order('title DESC')}
  scope :order_by_reverse_created_at, -> {order('created_at ASC')}
end
