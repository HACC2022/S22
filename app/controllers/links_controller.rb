class LinksController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :index]
  before_action :admin_user, only: [:destroy]

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    # Check that the original url inputted by the user is a valid URL
    if @link.original_url =~ /\A#{URI::regexp(['http', 'https'])}\z/
      @link.short_code = SecureRandom.alphanumeric(6)
      # Check that the generated shortened code does not already match another URL in the database
      while Link.find_by(short_code: @link.short_code)!=nil
        @link.short_code = SecureRandom.alphanumeric(6)
      end
    else
      @link.errors.add(:base, "The URL you entered is not a valid URL. The URL must begin with http or https.")
      render 'new', status: :unprocessable_entity and return
    end
    if @link.save
      flash[:success] = "Your shortened URL was successfully created!"
      redirect_to @link
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @link = Link.find_by(id: params[:id])
  end

  def go
    link = Link.find_by(short_code: params[:short_code])
    redirect_to link.original_url, status: :moved_permanently, allow_other_host: true
  end

  def preview
    @search_initiated = false
    if params[:query]
      @link = Link.find_by(short_code: params[:query])
      @search_initiated = true
    end
  end

  def search
    @search_initiated = false
    if params[:query]
      @links = Link.where(original_url: params[:query])
      @search_initiated = true
    end
  end

  def index
    @links = Link.all
  end

  def destroy
    Link.find(params[:id]).destroy
    flash[:success]="Link deleted"
    redirect_to links_url
  end

  private

    def link_params
      params.require(:link).permit(:original_url)
    end

    def admin_user
      redirect_to(root_url, status: :see_other) unless current_user.admin?
    end
  end
