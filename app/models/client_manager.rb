class ClientManager < User
    belongs_to :account
    ##This will be the only model with a trial mode.
    ##New account creation will take data from 1 form (Name, Company, Email, Password) and create both ClientManager and Account models and associate the two.
    ##Needs controller method to check if account exists. If not, needs to wizard user through account creation
    #Before create find_account
    #def find_account
    #logic to find account info
    #else, pop modal to create account
    #end
    
end
