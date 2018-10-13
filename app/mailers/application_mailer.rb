##
# = ApplicationMailer
# Author::    Richard Davis
# Copyright:: Copyright 2016-2019 Dick Davis
# License::   GNU Public License 3
#
# Mailer class for email communications.
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@rvdavis.me'
  layout 'mailer'
end
