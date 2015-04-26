class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.user = current_user

    if @league.save
      redirect_to league_path(@league)
      flash[:notice] = "Your league has been successfully created."
    else
      render :new
    end
  end

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])

    if @league.update_attributes(league_params)
      redirect_to league_path(@league)
      flash[:notice] = "Your league has been successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @league = current_user.leagues.find(params[:id])
    @league.destroy
    flash[:notice] = "Your league has been deleted."
    redirect_to root_path
  end

  private

  def league_params
    params.require(:league).permit(:title, :description)
  end
end
