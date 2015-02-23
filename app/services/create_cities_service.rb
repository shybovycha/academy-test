class CreateCitiesService
  def call
    cities_fixture_path = File.join(Rails.root, %w(db cities.json))
    city_params = JSON.parse(File.read(cities_fixture_path))['cities']

    cities = city_params.map do |params|
      City.find_or_create_by! params
    end
  end
end
