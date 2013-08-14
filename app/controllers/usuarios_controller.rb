class UsuariosController < ApplicationController
before_filter :signed_in_usuario, 
          only: [:index, :show, :edit, :update, :destroy]
before_filter :correct_usuario, only: [:show, :edit, :update]


  # GET /usuarios
  # GET /usuarios.json
  def index
    if params[:search].present?
      @usuarios = Usuario.near(params[:search], 50, :order => :distance)
    else
      @usuarios = Usuario.all
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])

    @charaters = Charater.near([@usuario.latitude, @usuario.longitude],
    10, :order => :distance, :units => :km )

    @json1 = Charater.all.to_gmaps4rails
    @json2 = Usuario.all.to_gmaps4rails

    @json = @json = (JSON.parse(@json1) + JSON.parse(@json2)).to_json
        
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @charater }
    end
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/1/edit
  def edit
    # @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(params[:usuario])

    respond_to do |format|
      if @usuario.save

        NewsletterMailer.weekly(@usuario).deliver
        
        sign_in @usuario
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render json: @usuario, status: :created, location: @usuario }

      else
        format.html { render action: "new" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    if @usuario.update_attributes(params[:usuario])
      sign_in @usuario
      flash[:success] = "Profile updated"
      redirect_to @usuario
    else
      render 'edit'
    end
    # @usuario = Usuario.find(params[:id])

    # respond_to do |format|
    #   if @usuario.update_attributes(params[:usuario])
    #     format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @usuario.errors, status: :unprocessable_entity }
    #   end
    # end

  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end

  private

  def correct_usuario
    @usuario = Usuario.find(params[:id])
    redirect_to root_path unless current_usuario?(@usuario)
  end
  
  
end
