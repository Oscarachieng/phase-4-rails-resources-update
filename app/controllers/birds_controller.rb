class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  # update action
  def update 
    @plant_bird = Bird.find_by(id: params[:id])
    if @plant_bird 
      @plant_bird.update(bird_params)
      render json: @plant_bird
    else
      render json: {error: "Resource not found"}, status: :not_found
    end
  end

  def increment_likes
    @bird_to_update = Bird.find_by(id: params[:id])
    if @bird_to_update
      @bird_to_update.update(likes: @bird_to_update.lkes + 1)
      render json: @bird_to_update
    else
      render json: {error: "Resource not found"}, status: :not_found
    end
  end

  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

end

# class Birds::LikesController < ApplicationController
  
# end
