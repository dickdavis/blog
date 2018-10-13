##
# = User
# Author::    Richard Davis
# Copyright:: Copyright 2016-2019 Dick Davis
# License::   GNU Public License 3
#
# The model for user resources.
class User < ApplicationRecord
  include Clearance::User
end
