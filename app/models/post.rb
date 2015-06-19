class Post < ActiveRecord::Base
	belongs_to :user
	has_many :guesses, dependent: :destroy
	validates :image_url, :answer, presence: true
	validates :image_url, format: {with:/\.(png|jpg|gif)\z/, message: "not a valid image_url"}

end
