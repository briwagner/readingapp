class Reading < ActiveRecord::Base

  belongs_to :book

  def open_reading?
    self.endtime.nil?
  end

  def duration_minutes
    if self.endtime
      (( self.endtime - self.starttime ) / 60).to_i
    else
      0
    end
  end

end
