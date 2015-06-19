class Post < ActiveRecord::Base
	belongs_to :user
	has_many :guesses, dependent: :destroy

	validates :image_url, :answer, presence: {message: "Must provide an image_url and answer"}

end
