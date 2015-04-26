module SteamStoreParser
  class Database

    def initialize(params)
      @params = params
      # gotta be removed if I ever make it public
      if params == :default
        @params = {:host => "localhost",
                   :database => "coop_buddy_finder",
                   :username => "coop",
                   :password => "steamapps"}
      end

      @client = Mysql2::Client.new(@params)

    end

    def close
      @client.close
    end

    def create_category_table(table_name, games_array)

      if table_exists? table_name
        puts "Table #{table_name} already exists. Aborted."
        raise TableExistsError
      else
        query = "CREATE TABLE #{table_name} (
          id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          steamapp_id VARCHAR(40) NOT NULL,
          title VARCHAR(255) NOT NULL
          )"
        @client.query(query)
        games_array.each do |game|
          @client.xquery("INSERT INTO #{table_name} (steamapp_id, title) VALUES (?, ?)", game.steamapp_id, game.title)
        end
      end

    end


    private

      def table_exists?(table_name)
        begin
          @client.query("SELECT 1 FROM #{table_name} LIMIT 1");
        rescue Mysql2::Error
          false
        end

        true
      end

  end
end