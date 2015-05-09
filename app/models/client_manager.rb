class ClientManager < User
    belongs_to :account
    ##This will be the only model with a trial mode.
    accepts_nested_attributes_for :account
    include DeviseInvitable::Inviter
    
end
