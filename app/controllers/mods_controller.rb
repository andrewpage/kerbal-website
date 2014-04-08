class ModsController < ApplicationController
	before_action :authenticate_account!, except: [:index, :show]

	def index
		@mods = Mod.all
	end

	def show
		@mod = Mod.find(params[:id])
	end

	def new
		@mod = Mod.new
	end

	def create
		@mod = Mod.new(mod_params)

		if @mod.save
			flash[:success] = 'Mod has been successfully created.'
			redirect_to @mod
		else
			flash[:danger] = 'Mod has not been created.'
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def subscribe
    @mod = Mod.find(params[:id])
    flash[:success] = 'You have subscribed to ' + @mod.name + '.'
    redirect_to @mod
	end

	def download
  end

  def like
    mod = Mod.find(params[:id])
    rate(:like, mod)

    render nothing: true
  end

  def dislike
    mod = Mod.find(params[:id])
    rate(:dislike, mod)

    render nothing: true
  end

	private
	def mod_params
		params.require(:mod).permit(:name, :description, :description_short, :version, :tags, :download_count, :image, :likes, :dislikes)
  end

  def rate(type, mod)
    if type == :like
      mod.likes = mod.likes + 1
    elsif type == :dislike
      mod.dislikes = mod.dislikes + 1
    end

    mod.save
  end
end
