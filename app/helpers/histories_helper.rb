module HistoriesHelper
  def display_action_taken_for(entry)
    "#{entry.f.action} #{time_ago_in_words entry.created_at} ago"
  end
end
