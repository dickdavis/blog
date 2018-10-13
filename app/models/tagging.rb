##
# = Tagging
# Author::    Richard Davis
# Copyright:: Copyright 2016-2019 Dick Davis
# License::   GNU Public License 3
#
# The model for tagging resources which serves to join articles and tags.
class Tagging < ApplicationRecord
  belongs_to :article
  belongs_to :tag
end
