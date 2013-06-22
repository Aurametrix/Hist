module HistoriesHelper
  def display_action_taken_for(entry)
    "#{entry.f.action} #{time_ago_in_words entry.created_at} ago"
  end

  def display_date(time)
    time.strftime("%m/%d/%Y")
  end


  def hours_of_the_day
   (0..23).map do |hour|
      meridian = hour/12 >= 1 ? "pm" : "am" 
      
      id = "%02d" % hour
      
      hour = 12 if hour == 0
      display_hour = hour%12 != 0 ? hour%12 : hour 
      
      ["#{display_hour}:00 #{meridian}", id]
    end
  end

  def select_hour(time)
    if time.nil?
      "00"
    else
      "%02d" % time.hour
    end
  end

end
