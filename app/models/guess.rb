class Guess < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	validates :guess, presence: true

	def check_solution
		if self.guess == self.post.answer
			self.update(correct: true)
			if self.post.solved
				self.user.update(points: self.user.points + 50)
			else 
				self.post.update(solved: self.user.id)
				self.post.update(solved_by: self.user.username)
				self.user.update(points: self.user.points + 200)
			end
		else
			self.post.update(attempts: self.post.attempts + 1)
		end
	end

end
