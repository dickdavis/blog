class WelcomeController < ApplicationController
  include SendGrid
  def index
    @page = { title: 'Hello!',
              subtitle: 'My name is Richard Davis, and I am a software engineer.' }
  end

  def projects
    @page = { title: 'Projects',
              subtitle: 'A collection of my efforts and contributions.' }
  end

  def contact
  end

  def mail
    from = Email.new email: params[:email]
    subject = params[:subject]
    to = Email.new 'rvdavis@member.fsf.org'
    content = Content.new type: 'text/plain', value: params[:body]
    mail = Mail.new from, subject, to, content
    sg = SendGrid::API.new api_key: ENV['SENDGRID_API_KEY']
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    redirect_to :contact, notice: "#{response.status_code} #{response.body} #{response.headers}"
  end
end
