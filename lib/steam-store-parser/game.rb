module SteamStoreParser
  class Game
    attr_reader :title
    attr_reader :steamapp_id

    def initialize(title, steamapp_id)
      @title = title
      @steamapp_id = steamapp_id
    end

  end
end

