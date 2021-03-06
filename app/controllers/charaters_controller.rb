class CharatersController < ApplicationController
  # GET /charaters
  # GET /charaters.json
  def index
    @charaters = Charater.all
    @charaters = Charater.order( :created_at)
    @json = Charater.all.to_gmaps4rails
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @charaters }
      format.csv { send_data @charaters.to_csv }           
      format.xls #{ send_data @charaters.to_csv(col_sep: "\t") }
    end
  end

  # GET /charaters/1
  # GET /charaters/1.json
  def show
    @charater = Charater.find(params[:id])
    @charaters = Charater.near([@charater.latitude, @charater.longitude],
    10, :order => :distance, :units => :km )

    @json1 = Charater.all.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @charater }
    end
  end

  # GET /charaters/new
  # GET /charaters/new.json
  def new
    @charater = Charater.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @charater }
    end
  end

  # GET /charaters/1/edit
  def edit
    @charater = Charater.find(params[:id])
  end

  # POST /charaters
  # POST /charaters.json
  def create
    @charater = Charater.new(params[:charater])
  
    respond_to do |format|
      if @charater.save 
        
        format.html { redirect_to @charater, notice: 'Su reporte ha sido registrado. Gracias por reportar con nosotros!' }
        format.json { render json: @charater, status: :created, location: @charater }

      else
        format.html { render action: "new" }
        format.json { render json: @charater.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /charaters/1
  # PUT /charaters/1.json
  def update
    @charater = Charater.find(params[:id])

    respond_to do |format|
      if @charater.update_attributes(params[:charater])
        format.html { redirect_to @charater, notice: 'Charater was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @charater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charaters/1
  # DELETE /charaters/1.json
  def destroy
    @charater = Charater.find(params[:id])
    @charater.destroy

    respond_to do |format|
      format.html { redirect_to iyyar195751_path}
      format.json { head :no_content }
    end
  end

  def inscribir
    @charater = Charater.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @charater }
    end
  end

  def about
  end

  def iyyar195751
    @charaters = Charater.all
    @charaters = Charater.order( :created_at)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
