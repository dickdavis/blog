##
# = Tag
# Author::    Richard Davis
# Copyright:: Copyright 2016-2019 Dick Davis
# License::   GNU Public License 3
#
# The model for tag resources.
class Tag < ApplicationRecord
  has_many :taggings
  has_many :articles, through: :taggings

  ##
  # Returns a list of tags and their associated counts.
  def self.counts
    select('name, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id, tags.name')
  end
end
