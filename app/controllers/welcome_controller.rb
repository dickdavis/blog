class WelcomeController < ApplicationController
  def index
    @page = { title: 'Hello!',
              subtitle: 'My name is Richard Davis, and I am a software engineer.' }
  end
end
