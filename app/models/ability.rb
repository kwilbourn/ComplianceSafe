class Ability
  include CanCan::Ability

  def initialize(user)
    #Users can read, update, and create their own documents.
    if Admin
      can :manage, :all
    else
      can :read, Document, :user_id => user.id
      can :create, Document, :user_id => user.id
      can :read, DocType
      can :read, Area
      #area above needs to be modified to show only areas associated with that user.
    end
    if ClientManager
      #need method to get all users for account and show all areas belonging to those users
    end
    if ClientViewer
      can :update, Document
    end
    if Manager
      can :read, DocType
      can :update, DocType
      can :create, Area
      can :update, Area
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
