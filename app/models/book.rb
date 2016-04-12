class Book < ActiveRecord::Base

  belongs_to :user
  has_many :readings

  validates :pagecount, presence: true

  def last_page_read
    if self.readings.count > 2
      last_reading = self.readings.max { |a, b| a.endpage <=> b.endpage }
      last_reading.endpage
    elsif self.readings.count == 1 && self.readings.last.endpage
      self.readings.last.endpage
    else
      0
    end
  end

  def current_reading
    if self.readings.any?
      open_readings = []
      self.readings.each do |r|
        open_readings << r if r.endpage.nil?
      end
      open_readings if open_readings.any?
    end
  end

end
