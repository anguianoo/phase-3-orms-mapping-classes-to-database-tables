class Song

  attr_accessor :name, :album, :id
  #initializes the name, album and Id into the Song object
  def initialize(name:, album:, id: nil)
    @name = name
    @album = album
    @id = id
  end
  # creates
  def self.create(name:, album:)
    song = Song.new(name: name, album: album)
    song.save
  end

  # creates a table
  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS songs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        album TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end

  # inserts or saves songs in the table that was created
  def save
    sql = <<-SQL
      INSERT INTO songs (name, album) VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.album)

  end

end
