class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_areas
  has_many :areas, through: :user_areas
  has_many :documents
  has_settings do |s|
    s.key :alerts, :defaults=> { :days=> [60,30,15,10,5,4,3,2,1], :overdue=> true}
  end
  def name
    first_name + " " + last_name
  end
end
