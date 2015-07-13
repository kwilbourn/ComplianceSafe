class Ability
  include CanCan::Ability
def initialize(admin)
      if Admin
      can :manage, :all
end
  def initialize(client)
    #Users can read, update, and create their own documents.

      can :read, Document, :user_id => client.id
      can :create, Document, :user_id => client.id
      can :read, DocType
      can :read, Area
      #area above needs to be modified to show only areas associated with that user.

    if Client
       if Client.has_role? "owner"
         can :read, Account
         can :create, Document
         #can :validate, GroupClients
       elsif Client.has_role? "manager"
         #TODO: Add user defined, account scoped, user groups.
         #can :read, Group
         #can :create, Group
         #can :create, GroupClients 
         can :create, Document, :user_id => client.id
       elsif user.has_role? "site"
         can :create, Document, :user_id => client.id
         can :read, DocType
         can :read, Area
         can :read, DocCategory
       end
      #need method to get all users for account and show all areas belonging to those users
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
       
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
end