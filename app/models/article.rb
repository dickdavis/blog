##
# = Article
# Author::    Richard Davis
# Copyright:: Copyright 2016-2019 Dick Davis
# License::   GNU Public License 3
#
# The model for article resources.
class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  validates :title, presence: true, length: { minimum: 5 }

  ##
  # Saves each tag for the article record.
  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  ##
  # Renders each tag separated by commas.
  def all_tags
    tags.map(&:name).join(', ')
  end

  ##
  # Returns list of articles that have the specified tag.
  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end

  ##
  # Returns a list of articles matching the search criteria.
  def self.search(search)
    where 'title ILIKE ? OR summary ILIKE ? OR subtitle ILIKE ? OR text ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"
  end
end
