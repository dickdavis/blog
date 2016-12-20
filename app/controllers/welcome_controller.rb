class WelcomeController < ApplicationController
  include SendGrid
  def index
  end

  def projects
  end

  def contact
  end

  def mail
    from = Email.new(email: params[:email])
    subject = params[:subject]
    to = Email.new(email: 'rvdavis@member.fsf.org')
    content = Content.new(type: 'text/plain', value: params[:body])
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    if response.status_code == '202'
      flash[:success] = 'Message sent successfully!'
    else
      flash[:danger] = 'Something went wrong. Try again.'
    end
    redirect_to :contact
  end
end
