class Book < ActiveRecord::Base

  belongs_to :user
  has_many :readings

  def last_page_read
    last_reading = self.readings.max { |a, b| a.endpage <=> b.endpage }
    last_reading.endpage
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
