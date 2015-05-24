module SteamStoreParser
  class BaseClient

    BASE_URL = 'http://store.steampowered.com/search/?'
    GAMES_ONLY = '&category1=998' # to filter games only

    def initialize(params)
      raise ArgumentError unless params.is_a? Hash
      @url = build_url(params)
    end

    # @see SteamStoreParser::Parameters
    # @return [String] Webpage
    def page(page)
      RestClient.get "#{@url}&page=#{page}"
    end

    # @return [String] the HTML source of the page
    def home_page
      page(1)
    end

    private
      def build_url(params)
        url = "#{BASE_URL}"
        params.each { |key, value| params[key] = [value] unless value.is_a? Array }

        if params.has_key? :tags
          tags = params[:tags].map! {|tag| Parameters::TAGS.fetch(tag)}
          url << "tags=#{tags.join(',')}&"
        end
        if params.has_key? :os
          os = params[:os].map! {|os| Parameters::OS.fetch(os)}
          url << "os=#{os.join(',')}&"
        end
        if params.has_key? :player_amount
          player_amount = params[:player_amount].map! {|pa| Parameters::PLAYER_AMOUNT.fetch(pa)}
          url << "category3=#{player_amount.join(',')}"
        end

        url << GAMES_ONLY

        url
      end

  end

end