class KittensController < ApplicationController
  before_action :set_kitten, only: [:edit, :show ,:update, :destroy]
  before_action :non_existent_kitten, only: [:edit, :show]

  def show
  end

  def new
    @kitten = Kitten.new
  end

  def index
    @kittens = Kitten.all
  end

  def create
      @kitten = Kitten.new(kitten_params)
      if @kitten.save
          format.html { redirect_to root_path, notice: 'Kitten was successfully created.' }
          format.json { render :show, status: :created, location: @kitten }
      else
          format.html { render :index }
          format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
  end

  def edit
  end


  def update
      respond_to do |format|
       if @kitten.update(kitten_params)
         format.html { redirect_to @kitten, notice: 'Kitten was successfully updated.' }
         format.json { render :show, status: :ok, location: @kitten }
       else
         format.html { render :edit }
         format.json { render json: @kitten.errors, status: :unprocessable_entity }
       end
     end
  end


  def destroy
     if @kitten.destroy
         respond_to do |format|
           format.html { redirect_to kittens_path, notice: 'Kitten was successfully destroyed.' }
           format.json { head :no_content }
         end
     else

     end
  end

 private

 def set_kitten
     @kitten = Kitten.find(params[:id])
 end

    # Only allow a list of trusted parameters through.
 def kitten_params
     params.require(:kitten).permit(:name, :age, :cuteness,:softness)
 end

 def non_existent_kitten
     unless @kitten
          content_not_found
     end
 end
end
