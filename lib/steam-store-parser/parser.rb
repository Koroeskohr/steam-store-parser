module SteamStoreParser
  class Parser
    attr_reader :games

    PAGE_AMOUNT_CSS = '.search_pagination_right a'
    CONTAINER_CSS = '#search_result_container div'

    def initialize(params)
      @base_client = BaseClient.new(params)
      @pages_nb = page_amount
      @games = parse_games
    end



    private
      def page_amount
        home_page = Nokogiri::HTML(@base_client.home_page)
        home_page.css(PAGE_AMOUNT_CSS)[2].text.to_i
      end

      def parse_games
        @pages_nb.times.flat_map do |page_nb|
          page = Nokogiri::HTML(@base_client.page(page_nb))
          page.css(CONTAINER_CSS)[1].css('a').map do |item|
            Game.new(item.css('.title').text, item['data-ds-appid'])
          end
        end
      end

  end
end