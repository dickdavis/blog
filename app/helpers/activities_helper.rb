module ActivitiesHelper
  def format_categories(categories)
    ActivityCategory.where(id: categories).order(label: :asc)
  end
end
