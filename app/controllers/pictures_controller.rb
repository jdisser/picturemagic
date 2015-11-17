class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  before_filter :get_album  #JRD111115
  # GET album/id/pictures
  # GET /pictures.json
  def index
    @pictures = @album.pictures   #JRD111115

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @pictures}
    end
  end

  # GET album/id/pictures/1
  # GET /pictures/1.json
  def show
    @picture = @album.pictures.find(params[:id])    #JRD111115

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture}
    end
  end

  # GET album/id/pictures/new
  def new
    @album = Album.find(params[:album_id])
    @picture = @album.pictures.build                #JRD111115

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture}
    end
  end

  # GET album/id/pictures/1/edit
  def edit
    @picture = @album.pictures.find(params[:id])    #JRD111115
  end

  # POST /pictures
  # POST /pictures.json
  def create
    #@picture = Picture.new(picture_params)
    @picture = @album.pictures.build(picture_params)  #JRD111115

    respond_to do |format|
      if @picture.save
        format.html { redirect_to ([@album, @picture]), notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture}
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT album/id/pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    @picture = @album.pictures.find(params[:id])    #JRD111115

    respond_to do |format|
      if @album.pictures.find(params[:id]).update_attributes(picture_params)
        format.html { redirect_to album_pictures_url(@album), notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @album.picture }
      else
        format.html { render :edit }
        format.json { render json: @album.picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = @album.pictures.find(params[:id])    #JRD111115
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to album_pictures_url(@album), notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    #get album

    def get_album
      @album = Album.find(params[:album_id])    #added JRD111115
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:title, :caption, :picurl, :id, :album_id)
    end
end
