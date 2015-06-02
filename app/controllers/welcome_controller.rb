class WelcomeController < ApplicationController
  layout 'welcome'

  def index
    @statistics = Stats.find_by(name: '2014 Statistics')
  end
end
