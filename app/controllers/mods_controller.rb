class ModsController < ApplicationController
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
	end

	def download
	end

	private
	def mod_params
		params.require(:mod).permit(:name, :description, :description_short, :version, :tags, :download_count)
	end
end
