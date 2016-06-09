class Book < ActiveRecord::Base

  belongs_to :user
  has_many :readings

  validates :pagecount, presence: true

  def last_page_read
    all_readings = self.complete_readings
    if all_readings.count >= 2
      last_reading = all_readings.max { |a, b| a.endpage <=> b.endpage }
      last_reading.endpage
    elsif all_readings.count == 1 && all_readings.last.endpage
      all_readings.last.endpage
    else
      0
    end
  end

  def complete_readings
    all_readings = self.readings.to_a
    all_readings.keep_if {|b| !b.open_reading?}
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
