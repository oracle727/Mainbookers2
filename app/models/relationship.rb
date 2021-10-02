class Relationship < ApplicationRecord
  belongs_to :follows, class_name: 'User'
  belongs_to :followers, class_name: 'User'
end