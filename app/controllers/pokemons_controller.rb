class PokemonsController < ApplicationController
    helper_method :capture
    def capture
        pokemon = Pokemon.find(params[:id])
        pokemon.trainer_id = current_trainer.id
        pokemon.save
        redirect_to :controller => 'home', :action => 'index'
    end

    def damage
        pokemon = Pokemon.find(params[:id])
        pokemon.health = pokemon.health - 10
        if pokemon.health <= 0
            pokemon.destroy
        end
        pokemon.save
        redirect_to request.referrer
    end
  
  end