module Api
  module V1
      class MoviesController < V1Controller
        before_action :find_movie, only: [:destroy, :update, :show]

        def index
          render json: json_structure_index(Movie.all())
        end

        def json_structure_index(movies)
          movies_array = []
          movies.each do |movie|
              hash = {}
              hash['image'] = movie.image
              hash['title'] = movie.title
              hash['creation_date'] = movie.creation_date
              movies_array.push(hash)
          end
          movies_array
        end


        def show
          render :json => @movie.to_json(:include => :characters)
        end

        def create
          @movie = Movie.new(movie_params)
          if @movie.save
              render json: @movie
          else
              render json: @movie.errors
          end
      end

      def update
          if @movie.update(movie_params)
              render json: @movie
          else
              render json: @movie.errors
          end
      end

      def search_movies
        search = Movie.find_by_title(params[:title])
        render json: search
      end


      def destroy
          @movie.destroy
          render json: "movie was successfully destroyed."
      end

      private

      def find_movie
        @movie = Movie.find(params[:id])
      end
      
      def movie_params
        params.require(:movie).permit(:image, :title, :creation_date, :score, {character_ids:[]})        
      end
    end
  end
end