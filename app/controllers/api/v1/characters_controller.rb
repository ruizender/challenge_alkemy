module Api
  module V1
      class CharactersController < V1Controller
        before_action :find_character, only: [:destroy, :update, :show]
      
        def index
          render json: json_structure_index(Character.all())
        end

        def json_structure_index(characters)
          characters_array = []
          characters.each do |character|
              hash = {}
              hash['image'] = character.image
              hash['name'] = character.name
              characters_array.push(hash)
          end
          characters_array
        end
        
        def show
          @character = Character.find(params[:id])
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

      def search_characters
        search = Character.find_by_name(params[:name])
        render json: search
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