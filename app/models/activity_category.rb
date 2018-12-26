class ActivityCategory < ApplicationRecord
  has_many :activities, dependent: :destroy

  def self.labels
    labels = {}
    ActivityCategory.all.each do |cat|
      labels[cat.id] = cat.label
    end
    labels.to_h
  end
end
