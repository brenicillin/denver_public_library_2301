class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    author.books.each do |book|
      @books << book
    end
    @authors << author
  end

  def publication_time_frame_for(author)
    years = []
    hash = Hash.new
    author.books.each do |book|
      years << book.publication_year
    end
    first_book = years.min 
    last_book = years.max
    hash[:start] = first_book
    hash[:end] = last_book
    hash
  end
end
