class LettersController < ApplicationController
  # GET /letters
  # GET /letters.json



  def admin_user
    redirect_to(:back) unless current_user.admin?
  end
  def index
    @letters = Letter.all
    @letters = Letter.desc
    @letters = Letter.last(7)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @letters }
    end
  end

  # GET /letters/1
  # GET /letters/1.json
  def show
    @letter = Letter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @letter }
    end
  end

  # GET /letters/new
  # GET /letters/new.json
  def new
    @letter = Letter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @letter }
    end
  end

  # GET /letters/1/edit


  # POST /letters
  # POST /letters.json
  def edit
    @letter = Letter.find(params[:id])

  end
  def create
    @letter = Letter.new(params[:letter])

    respond_to do |format|
      if @letter.save
        format.html { redirect_to @letter }
        format.json { render json: @letter, status: :created, location: @letter }
      else
        format.html { render action: "new" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy

    respond_to do |format|
      format.html { redirect_to letters_url }
      format.json { head :no_content }
    end
  end
end
