class Task < ApplicationRecord
	has_many :statuses
	has_many :users, through: :statuses
end
