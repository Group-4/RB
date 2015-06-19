class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :guesses, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :password, :access_token, presence: true
  validates :email, :username, uniqueness: true, presence: true
  validates :email, format: { with: EMAIL_REGEX,
                              message: "is not a valid email." }

  before_validation :ensure_access_token

  def ensure_access_token
    if self.access_token.blank?
      self.access_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(access_token: token)
      token = SecureRandom.hex
    end
    token
  end

  def count_posts
    self.posts.length
  end

  def get_solved
    guesses = self.guesses
    solved = []
    guesses.each do |guess|
      if guess.correct 
        solved << guess.post
      end
    end
    solved
  end
  
end