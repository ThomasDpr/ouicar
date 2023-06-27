class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) # Ça permet de récupérer l'utilisateur en fonction de l'id passé en paramètre dans l'URL
  end
end

# Ce controller permet de récupérer l'utilisateur en fonction de l'id passé en paramètre dans l'URL.
# On peut ensuite utiliser cet utilisateur dans la view show.html.erb
