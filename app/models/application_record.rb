##
# = ApplicationRecord
# Author::    Richard Davis
# Copyright:: Copyright 2016-2019 Dick Davis
# License::   GNU Public License 3
#
# The base model for application resources.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
