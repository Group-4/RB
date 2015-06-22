class Guess < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	validates :guess, presence: true

def check_solution
		self.user.update(guess_count: self.user.guess_count + 1)
		if self.guess == self.post.answer
			self.update(correct: true)
			self.post.update(times_solved: self.post.times_solved + 1 )
			self.user.update(correct_count: self.user.correct_count + 1 )
			win_percent = ((self.user.correct_count.to_f/self.user.guess_count)*100).round(2)
			self.user.update(win_percent: win_percent)
			case self.post.times_solved
			when 1
				self.user.update(points: self.user.points + 200)
				self.post.update(solved: self.user.id)
				self.post.update(solved_by: self.user.username)
			when 2
				self.user.update(points: self.user.points + 100)
			when 3
				self.user.update(points: self.user.points + 75)
			else 
				self.user.update(points: self.user.points + 50)
			end
		else
			self.post.update(attempts: self.post.attempts + 1)
			self.user.update(incorrect_count: self.user.incorrect_count + 1)
			win_percent = ((self.user.correct_count.to_f/self.user.guess_count)*100).round(2)
			self.user.update(win_percent: win_percent)
		end
	end

end
