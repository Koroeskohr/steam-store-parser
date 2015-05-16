# steam-store-parser
*Parses Steam's web store to get lists of games from categories or keywords*

```ruby
# see full tag list in SteamStoreParser::Parameters
params = {:tags => [:action, :adventure], :player_amount => :singleplayer, :os => :linux}
parser = SteamStoreParser::Parser.new(params)

parser.games # gives you access to an array of games with the title of the game and the steamapp id
```

Feel free to participate !
