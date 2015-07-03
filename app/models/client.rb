class Client < User
    belongs_to :account
    accepts_nested_attributes_for :account
    include DeviseInvitable::Inviter
    include RoleModel
    roles_attribute :roles_mask

    # declare the valid roles -- do not change the order if you add more
    # roles later, always append them at the end!
    roles :owner, :manager, :site, :viewer
    #owner is first user created for a new account.
    # TODO: add to ability.rb for owner to use invitations and view users within account
    #manager has universal permissions throughout the group assigned (groups must be defined)
    # TODO: Define group ability. Add this ability to the user dashboard and give admins and client owners the ability to group all of the clients within an account into user defined groups.
    # TODO: In ability.rb, managers should have ability to view and correct documents and metadata for any site within their group(s), request sites and viewers be added to their group (client manager approves these requests) and view documents and reports for their group(s)
    #site is the basic user level and should be granted upload permissions
    # TODO: In ability.rb, define the site as able to generate document uploads and view documents within their personal scope.
    #viewer is a special, non-billed user created by a manager or owner with permissions to view a specific document or document category. This needs to be explored in full.
end
