RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.authorize_with do
    authenticate_or_request_with_http_basic('Login required') do |username, password|
      username == Rails.application.secrets.user &&
      password == Rails.application.secrets.password
    end
  end

  # Optional:
  # Configure global RailsAdminImport options
  config.configure_with(:import) do |config|
    config.logging = true
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    import

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  RailsAdmin.config do |config|
    config.model 'Show' do
      import do
        mapping_key :id
        # include_all_fields
      end
    end
  end  

  RailsAdmin.config do |config|
    config.model 'Song' do
      import do
        mapping_key :id
        # include_all_fields
        field :show_id do # (4)
          searchable [:name, :id]
          # eq. to [Team => :name, Team => :id]
          # or even [:name, Player => :team_id] will search on teams.name and players.team_id
          # if you need to specify the join association name:
          # (See #526 and http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html => table_aliasing)
          searchable [{:shows => :name}, {:shows => :id}]
          # or
          searchable ["shows.name", "shows.id"]
        end
      end
    end
  end  
end
