class ModsController < ApplicationController
	def index
		@mods = Mod.all
	end

	def show
		@mod = Mod.find(params[:id])
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def subscribe
	end

	def download
	end
end
