class Room < ActiveRecord::Base

  belongs_to :hotel

  has_many :bookings

  def is_booked?(date_start, date_end)
  	dates = check_all_dates
  	if !dates.nil?
      start_date = Date.parse(date_start)
      end_date = Date.parse(date_end)
  		dates.each { |date| return true if date == start_date || date == end_date || date > start_date && date < end_date }
  	end
  	false
  end

  def check_all_dates
    dates = []
    bookings.all.each do |range|
      (range.date_start..range.date_end).each { |date| dates << date }
    end
    dates
  end

  def check_dates
    dates = []
    bookings.where("date_start > ?", Time.now).each do |range|
      (range.date_start..range.date_end).each {|date| dates << date }
    end
    dates
  end

  private :check_dates, :check_all_dates

end
