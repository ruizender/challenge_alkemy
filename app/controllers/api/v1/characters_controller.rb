module Api
  module V1
      class CharactersController < V1Controller
        before_action :find_character, only: [:destroy, :update, :show]
        def index
          @character = Character.pluck(:id,:image,:name)
          render json: @character
        end
        
        def show
          render :json => @character.to_json(:include => :movies)
        end
        
        
        def create
          @character = Character.new(character_params)
          if @character.save
              render json: @character
          else
              render json: @character.errors
          end
      end

      def update
          if @character.update(character_params)
              render json: @character
          else
              render json: @character.errors
          end
      end

      def destroy
          @character.destroy
          render json: "Character was successfully destroyed."
      end
      private

      def find_character
        @character = Character.find(params[:id])
      end

      def character_params
        params.require(:character).permit(:image, :name, :age, :weight, :history, {movie_ids:[]})        
      end
      
      
    end
  end
end