class Guess < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	validates :guess, presence: true

	def check_solution
		if self.guess == self.post.answer
			self.post.update(solved: self.user.id)

		end
	end

end
