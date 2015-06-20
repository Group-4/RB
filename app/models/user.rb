class User < ActiveRecord::Base

  PER_PAGE = 28
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

  def get_solved(page)
    solved = self.guesses.where(correct:true).page(page).per(PER_PAGE)
    sorted_guesses = solved.sort_by {|guess| guess.created_at}.reverse!
    solved_posts = sorted_guesses.map {|guess| guess.post}
  end

  def get_unsolved(page,top=nil)
    unsolved = Post.page(page).per(PER_PAGE) - self.get_solved(page)
    if top
      unsolved.sort_by {|post| -post.attempts}
    else
      unsolved.sort_by {|post| post.created_at}.reverse!
    end
  end
  
end