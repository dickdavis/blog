##
# = ArticlesHelper
# Author::    Richard Davis
# Copyright:: Copyright 2016-2019 Dick Davis
# License::   GNU Public License 3
#
# Collection of helper methods to use for articles resources.
module ArticlesHelper
  ##
  # Renders list of tags as links separated by commas.
  def tag_links(tags)
    tags.split(',').map { |tag| link_to tag.strip, tag_path(tag.strip) }.join(', ')
  end

  ##
  # Renders tag cloud of provided tags with class based on number of tags occurrences.
  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end
end
