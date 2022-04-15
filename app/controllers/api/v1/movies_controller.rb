module Api
  module V1
      class MoviesController < V1Controller
        before_action :find_movie, only: [:destroy, :update]

        def index
          @movie = Movie.pluck(:image,:title, :creation_date)
          render json: @movie
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