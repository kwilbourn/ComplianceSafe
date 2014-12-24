class ClientSite < User
    belongs_to :account
    has_many :user_areas
    has_many :areas, through: :user_areas
end
