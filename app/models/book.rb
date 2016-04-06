class Book < ActiveRecord::Base

  belongs_to :user
  has_many :readings

  def last_page_read
    last_reading = self.readings.max { |a, b| a.endpage <=> b.endpage }
    last_reading.endpage
  end

  def current_reading
    self.readings.each { |r| r if r.endpage.nil? }
  end

end