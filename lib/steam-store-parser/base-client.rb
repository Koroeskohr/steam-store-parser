module SteamStoreParser
  module BaseClient

    # TODO : change to a class, to support initializing and parametering

    # for now, it suits my needs

    BASE_URL = 'http://store.steampowered.com/search/?'
    GAMES_ONLY = '&category1=998' # to filter games only


    # @param [Hash] Parameters
    # @see SteamStoreParser::Parameters
    # @param [Number] page number
    # @return [String] Webpage
    def self.page(params, page)
      raise ArgumentError unless params.is_a?(Hash)

      url = build_url(params)
      RestClient.get "#{url}&page=#{page}"
    end


    # @param [Hash] Parameters
    # @see SteamStoreParser::Parameters
    # @return [String] Webpage
    def self.home_page(params)
      self.page(params, 1)
    end

    private
      def build_url(params)
        tags = params[:tags].map! {|tag| Parameters::tag_id(tag)}
        os = params[:os].map! {|os| Parameters::os_id(os)}
        player_amount = params[:player_amount].map! {|pa| Parameters::player_amount_id(pa)}

        url = "#{BASE_URL}"
        url << "tags=#{tags.join(',')}&" unless tags.empty?
        url << "os=#{os.join(',')}&" unless os.empty?
        url << "category3=#{player_amount.join(',')}" unless player_amount.empty?
        url << GAMES_ONLY

        url
      end

  end

end