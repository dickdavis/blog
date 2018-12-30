json.activities @activities.each do |activity|
  json.description activity.description
  json.category activity.activity_category.label
  json.start_date activity.start_date
  json.due_date activity.due_date
  json.completion_date activity.completion_date
  json.hourglasses activity.hourglasses
end
