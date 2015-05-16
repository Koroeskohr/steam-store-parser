module SteamStoreParser

  # TODO : add more tags
  module Parameters

    TAGS = {
      action: 19,
      indie: 492,
      adventure: 21,
      strategy: 9,
      rpg: 122,
      simulation: 599,
      casual: 597,
      free_to_play: 113,
      singleplayer: 4182,
      mmo: 128,
      multiplayer: 3859,
      racing: 699,
      sports: 701,
      coop: 1685,
      atmospheric: 4166,
      open_world: 1695,
      puzzle: 1664,
      fps: 1663,
      platformer: 1625
    }

    PLAYER_AMOUNT = {
      singleplayer: 2,
      multiplayer: 1,
      crossplatform_multiplayer: 27,
      coop: 9,
      local_coop: 24
    }

    OS = {
      windows: 'win',
      mac: 'mac',
      linux: 'linux'
    }

    # @param [Symbol] label The label of the tag
    # @return [Number] Id of the chosen tag
    def self.tag_id(label)
      raise LabelDoesntExistError unless TAGS.has_key? label
      TAGS[label]
    end

    # @param [Symbol] label The label of the tag
    # @return [Number] Id of the chosen tag
    def self.player_amount_id(label)
      raise LabelDoesntExistError unless PLAYER_AMOUNT.has_key? label
      PLAYER_AMOUNT[label]
    end

    # @param [Symbol] label The label of the tag
    # @return [Number] Id of the chosen tag
    def self.os_id(label)
      raise LabelDoesntExistError unless OS.has_key? label
      OS[label]
    end


  end
end