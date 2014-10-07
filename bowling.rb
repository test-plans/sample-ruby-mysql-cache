require 'mysql2'

class Bowling
  @var = 0

  def hit()
    con = Mysql2::Client.new(
      :host => ENV['MYSQL_HOSTNAME'],
      :username => ENV['MYSQL_USERNAME'],
      :password => ENV['MYSQL_PASSWORD'],
      :port => ENV['MYSQL_PORT'],
      :database => ENV['MYSQL_DB_NAME']
    )

    con.query("DROP TABLE IF EXISTS scores")
    con.query("CREATE TABLE scores(score INT)")
    con.query("INSERT INTO scores(score) VALUES(1234)")
    con.query("SELECT * FROM scores").each do |row|
      @var = row['score']
    end
  end

  def score
  	return @var
  end
end

