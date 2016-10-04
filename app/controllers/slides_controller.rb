class SlidesController < ApplicationController
  before_action :find_slide, except: [:index, :new, :create, :admin]
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD'], except: :index

  def index
    @slides = Slide.online.sort
  end

  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new(slide_params)

    if @slide.save
      flash[:notice] = "Le Slide #{@slide.id} a bien été créé"
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @slide.update(slide_params)
      flash[:notice] = "Le Slide #{@slide.id} a bien été mis à jour"
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def destroy
    @slide.destroy
    flash[:notice] = "Le Slide #{@slide.id} a bien été supprimé"
    redirect_to admin_path
  end

  def admin
    @slides = Slide.all.sort
  end

  def publish
    @slide = Slide.find(params[:id])

    @slide.go_online!
    flash[:notice] = "Le Slide #{@slide.id} est maintenant publié"
    redirect_to admin_path
  end

  def unpublish
    @slide = Slide.find(params[:id])

    @slide.go_offline!
    flash[:notice] = "Le Slide #{@slide.id} est maintenant offline"
    redirect_to admin_path
  end

  private

  def slide_params
    params.require(:slide).permit(:client_name, :client_logo, :project_title, :description, :image)
  end

  def find_slide
    @slide = Slide.find(params[:id])
  end
end
