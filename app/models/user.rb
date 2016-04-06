class User < ActiveRecord::Base

  before_validation :downcase_username

  validates :username, presence: true, uniqueness: true

  has_many :books

  def current_book
    self.books.each { |b| b if b.current_reading}
  end

  private

  def downcase_username
    self.username = self.username.downcase if self.username.present?
  end

end
