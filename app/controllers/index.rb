get '/' do
  # Look in app/views/index.erb
  erb :index
end


post '/victory' do
  @winner = Player.find_by_name(params[:winner])
  @loser = Player.find_by_name(params[:loser])
  @game = Game.last.update_attributes(race_time: params[:raceTime], winner: @winner.id, loser: @loser.id)
  @ranking = Game.where(winner: @winner.id).order("race_time").limit(10)
  erb :victory, layout: false
end

post '/racer' do
  @player1 = Player.find_or_create_by_name(params[:post][:name1])
  @player2 = Player.find_or_create_by_name(params[:post][:name2])
  @game = Game.create
  @round1 = Round.create(player_id: @player1.id, game_id: @game.id) 
  @round2 = Round.create(player_id: @player2.id, game_id: @game.id)
  erb :racer
end

# saving 
post '/saving_race' do
  
  @winner = Player.find_by_name(params[:winner])
  @loser = Player.find_by_name(params[:loser])
  debugger
  @game = Game.last.update_attributes(race_time: params[:raceTime], winner: @winner.id, loser: @loser.id)
  @ranking = Game.where(winner: @winner.id).order("race_time").limit(10)
  redirect to '/victory'
end


