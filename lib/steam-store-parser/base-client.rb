module SteamStoreParser
  module BaseClient

    # TODO : change to a class, to support initializing and parametering

    # for now, it suits my needs

    BASE_URL = 'http://store.steampowered.com/search/?category2='
    GAMES_ONLY = '&category1=998' # to filter games only

    # @param [Symbol] category, see SteamStoreParser::Categories
    # @param [Number] page number

    # @return [String] Webpage
    def self.page(category, page)
      RestClient.get "#{BASE_URL}#{Categories::get_id(category)}#{GAMES_ONLY}&page=#{page}"
    end


    # @param [Symbol] category See SteamStoreParser::Categories
    # @return [String] Webpage
    def self.home_page(category)
      self.page(category, 1)
    end

  end

end