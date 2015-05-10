class League < ActiveRecord::Base
  belongs_to :user
  has_many :membership_requests, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :league_weeks, dependent: :destroy
  has_many :league_games, dependent: :destroy

  after_create :create_league_weeks
  after_create :create_league_owner
  after_create :create_league_games

  validates :title,
    presence: true,
    uniqueness: true

  # def is_league_member(user)
  #   memberships.find_by(user_id: user.id, league_id: params[:id])
  # end

  # def is_league_owner
  #   current_user && Membership.find_by(league: params[:id], owner: true)
  # end

  private

  def create_league_weeks
    Week.all.each do |week|
      self.league_weeks.create(week: week)
    end
  end

  def create_league_owner
    Membership.create(owner: true, user: League.last.user, league: self)
  end

  def create_league_games
    games = Game.all
    league_weeks = LeagueWeek.where(league_id: self.id)

    games.each do |g|
      league_weeks.each do |lw|
        if g.week_id == lw.week_id
          LeagueGame.create(league_id: lw.league_id,
                            league_week_id: lw.id,
                            week_id: g.week_id,
                            day: g.day,
                            date: g.date,
                            visitor_team: g.visitor_team,
                            home_team: g.home_team,
                            time: g.time)
        end
      end
    end
  end
end
