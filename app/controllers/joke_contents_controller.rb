class JokeContentsController < ApplicationController
  before_action :set_joke_content, only: [:show, :edit, :update, :destroy]

  # GET /joke_contents
  # GET /joke_contents.json
  def index
    @joke_contents = JokeContent.all
  end

  # GET /joke_contents/1
  # GET /joke_contents/1.json
  def show
  end

  # GET /joke_contents/new
  def new
    @joke_content = JokeContent.new
  end

  # GET /joke_contents/1/edit
  def edit
  end

  # POST /joke_contents
  # POST /joke_contents.json
  def create
    user = User.find_by(id: session[:user_id])
    @joke_content = user.joke_contents.new(joke_content_params)
    @joke_content.like_count = 0
    @joke_content.dislike_count =0

    respond_to do |format|
      if @joke_content.save
        format.html { redirect_to @joke_content, notice: 'Joke content was successfully created.' }
        format.json { render :show, status: :created, location: @joke_content }
      else
        format.html { render :new }
        format.json { render json: @joke_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /joke_contents/1
  # PATCH/PUT /joke_contents/1.json
  def update
    respond_to do |format|
      if @joke_content.update(joke_content_params)
        format.html { redirect_to @joke_content, notice: 'Joke content was successfully updated.' }
        format.json { render :show, status: :ok, location: @joke_content }
      else
        format.html { render :edit }
        format.json { render json: @joke_content.errors, status: :unprocessable_entity }
      end
    end
  end

  def content_check(content_id)
    str = cookies[:joke_content_has_checked]? cookies[:joke_content_has_checked] : ""
    if str == ""
      str = content_id
    else
      str = str + "," + content_id
    end
    cookies[:joke_content_has_checked] = str

  end

  def like_method
    content_check(params[:id])

    jokecontent = JokeContent.find(params[:id])
    if jokecontent
      jokecontent.like_count += 1
      jokecontent.save
    end
    redirect_to home_page_path
  end

  def dislike_method
    content_check(params[:id])

    JokeContent.dislike(params[:id])
    redirect_to home_page_path
  end

  # DELETE /joke_contents/1
  # DELETE /joke_contents/1.json
  def destroy
    @joke_content.destroy
    respond_to do |format|
      format.html { redirect_to joke_contents_url, notice: 'Joke content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joke_content
      @joke_content = JokeContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joke_content_params
      params.require(:joke_content).permit(:title, :content, :like_count, :dislike_count)
    end
end
