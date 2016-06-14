require 'test_helper'

class PartyTest < ActiveSupport::TestCase
  def setup
    @nightHouse = NightHouse.first
    @party = Party.new(name: 'College',
                      category: 'Open Bar',
                      add_info: 'R$50,00',
                      music_style: 'indie',
                      party_date: '2016-06-19',
                      party_time: '23h',
                      night_house_id: @nightHouse.id )
  end

  # test "the truth" do
  #   assert true
  # end
end
