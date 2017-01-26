ENV['RACK_ENV'] = 'test'

require './votacion'  # <-- your sinatra app
require 'capybara'
require 'capybara/dsl'
require 'test/unit'

class VotactionTest < Test::Unit::TestCase
  include Capybara::DSL

  def setup
    Capybara.app = Sinatra::Application.new
  end

  def test_title
    visit '/'
    assert page.has_content?("San Jose vs. The Strongest")
  end

  def test_tigre_vote
    visit '/'
    choose('tigre')
    click_button('Votar')
    assert page.has_content?("Gracias.")
  end

  def test_bolivar_vote
    visit '/'
    choose('bolivar')
    click_button('Votar')
    assert page.has_content?("Gracias por participar")
  end
end
