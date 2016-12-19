class ContactMeMailer < ApplicationMailer
  default to: 'richardvincentdavis@gmail.com'

  def contact_me params
    mail from: params[:email], subject: params[:subject], body: params[:body]
  end
end
