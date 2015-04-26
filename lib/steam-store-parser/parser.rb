module SteamStoreParser
  class Parser
    attr_reader :games

    PAGE_AMOUNT_CSS = '.search_pagination_right a'
    CONTAINER_CSS = '#search_result_container div'

    def initialize(category)
      puts "Parsing... it might take a while"
      @pages_nb = page_amount(category)
      @games = parse_games(category)
    end

    private
      def page_amount(category)
        home_page = Nokogiri::HTML(BaseClient::home_page(category))
        home_page.css(PAGE_AMOUNT_CSS)[2].text.to_i
      end

      def parse_games(category)
        games_array = Array.new
        (1..@pages_nb).each do |page_nb|
          puts "Parsing page #{page_nb}/#{@pages_nb}"
          page = Nokogiri::HTML(BaseClient::page(category, page_nb))
          page.css(CONTAINER_CSS)[1].css('a').each do |item|
            game = Game.new(item.css('.title').text, item['data-ds-appid'])
            games_array.push(game)
          end
        end
        games_array
      end

  end
end