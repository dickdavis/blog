class WelcomeController < ApplicationController
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
    ContactMeMailer.contact_me params
    redirect_to :contact, notice: 'Message sent successfully! I will be in touch soon. Thanks.'
  end
end
