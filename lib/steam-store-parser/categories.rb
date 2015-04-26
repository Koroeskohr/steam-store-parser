module SteamStoreParser

  # TODO if publishing : add more categories
  module Categories
    CATEGORIES = {
        :multiplayer => 1,
        :coop => 9,
        :local_coop => 24
    }

    # @param [Symbol] name The name of the category
    # @return [Number] Id of the chosen category
    def self.get_id(name)
      CATEGORIES[name]
    end
  end
end