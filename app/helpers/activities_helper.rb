module ActivitiesHelper

  def display_activity(activity)
    activity.name.gsub('_', ' ').titleize
  end

end
