class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def song_notes=(song_notes)
  	song_notes.each do |note|
  		self.notes << Note.find_or_create_by(content: note) unless note.empty?
  	end
  end

  def note_contents
  	self.notes.collect { |note| note.content }
  end
end
