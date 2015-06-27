class Client < User
    belongs_to :account
    accepts_nested_attributes_for :account
    include DeviseInvitable::Inviter
    
end
