class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  after_create :assign_tasks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :statuses
	has_many :tasks, through: :statuses


	def assign_tasks
		@tasks = Task.all
		@tasks.each do |task|
			@status = Status.new(:task_id => task.id, :user_id => self.id, :completed => false)
			@status.save
		end
	end 
end
