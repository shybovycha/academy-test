class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def city
    City.find(city_id) rescue City.new name: 'unknown'
  end

  def city=(city)
    self.city_id = city.id
  end
end
