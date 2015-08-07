class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  def like_add
	idea_id = params[:id]
	choice = params[:choice]
	if( choice == "dislike" )
		@idea = Idea.find_by(id: idea_id)
		@idea.like += 1
		@idea.dislike -= 1
		@idea.update_attributes(like: @idea.like, dislike: @idea.dislike)
		@vote = Vote.find_by(user_id: current_user.id, idea_id: idea_id)
		@vote.update_attributes(choice: "like")
	else
		@idea = Idea.find_by(id: idea_id)
		@idea.like += 1
		@idea.update_attributes(like: @idea.like)
		@vote = Vote.new(user_id: current_user.id, idea_id: idea_id, choice: "like")
		@vote.save
	end
	redirect_to ideas_path
  end

  def dislike_add
	idea_id = params[:id]
	choice = params[:choice]
	if( choice == "like" )
		@idea = Idea.find_by(id: idea_id)
		@idea.like -= 1
		@idea.dislike += 1
		@idea.update_attributes(like: @idea.like, dislike: @idea.dislike)
		@vote = Vote.find_by(user_id: current_user.id, idea_id: idea_id)
		@vote.update_attributes(choice: "dislike")
	else
		@idea = Idea.find_by(id: idea_id)
		@idea.dislike += 1
		@idea.update_attributes(dislike: @idea.dislike)
		@vote = Vote.new(user_id: current_user.id, idea_id: idea_id, choice: "dislike")
		@vote.save
	end
	redirect_to ideas_path
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
	@idea.user_id = current_user.id
	@idea.like = 0
	@idea.dislike = 0

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :description, :picture, :user_id, :like, :dislike)
    end
end
