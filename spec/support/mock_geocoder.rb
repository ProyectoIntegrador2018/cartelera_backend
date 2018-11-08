# rubocop:disable LineLength
# rubocop:disable MethodLength
require 'geocoder/results/google'
require 'geocoder/results/base'

module MockGeocoder
  def self.included(base)
    base.before :each do
      allow(::Geocoder).to receive(:search).and_raise(
        RuntimeError.new('Use "mock_geocoding!" method in your tests.')
      )
    end
  end

  def mock_geocoding!(options = {})
    mock_data = {
      'address_components' => [
        { 'long_name' => 'Marseille', 'short_name' => 'Marseille', 'types' => %w(locality political) },
        { 'long_name' => 'Bouches-du-Rhône', 'short_name' => 'Bouches-du-Rhône', 'types' => %w(administrative_area_level_2 political) },
        { 'long_name' => "Provence-Alpes-Côte d'Azur", 'short_name' => "Provence-Alpes-Côte d'Azur", 'types' => %w(administrative_area_level_1 political) },
        { 'long_name' => 'France', 'short_name' => 'FR', 'types' => %w(country political) }
      ],
      'formatted_address' => 'Marseille, France',
      'geometry' => {
        'bounds' => {
          'northeast' => { 'lat' => 43.3911601, 'lng' => 5.5323519 },
          'southwest' => { 'lat' => 43.169621, 'lng' => 5.228641 }
        },
        'location' => { 'lat' => 43.296482, 'lng' => 5.36978 },
        'location_type' => 'APPROXIMATE',
        'viewport' => { 'northeast' => { 'lat' => 43.3911601, 'lng' => 5.5323519 }, 'southwest' => { 'lat' => 43.169621, 'lng' => 5.228641 } }
      },
      'place_id' => 'ChIJM1PaREO_yRIRIAKX_aUZCAQ',
      'types' => %w(locality political)
    }

    options.reverse_merge!(address: 'Marseille, France',
                           coordinates: [43.296482, 5.36978],
                           state: "Provence-Alpes-Côte d'Azur",
                           state_code: "Provence-Alpes-Côte d'Azur",
                           country: 'France',
                           country_code: 'FR',
                           'address_components': {
                             'types':  %w(locality political),
                             'long_name': 'Marseille',
                             'short_name': 'Marseille'
                           })

    MockResult.new(mock_data).tap do |result|
      options.each do |prop, val|
        allow(result).to receive(prop).and_return(val)
      end
      allow(Geocoder).to receive(:search).and_return([result])
    end
  end

  class MockResult < ::Geocoder::Result::Google
    def initialize(data = [])
      super(data)
    end
  end
end

RSpec.configure do |config|
  config.include MockGeocoder
end
