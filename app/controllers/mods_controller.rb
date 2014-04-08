class ModsController < ApplicationController
	before_action :authenticate_account!, except: [:index, :show]

	def index
		@mods = Mod.paginate(:page => params[:page], :per_page => 15)
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

    if current_account.voted_up_on? mod
      mod.unliked_by current_account
    else
      mod.liked_by current_account
    end

    redirect_to mod
  end

  def dislike
    mod = Mod.find(params[:id])

    if current_account.voted_down_on? mod
      mod.undisliked_by current_account
    else
      mod.disliked_by current_account
    end

    redirect_to mod
  end

	private
	def mod_params
		params.require(:mod).permit(:name, :description, :description_short, :version, :tags, :download_count, :image, :youtube_url, :mod_file)
  end
end
