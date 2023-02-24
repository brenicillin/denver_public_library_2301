class Author
  attr_reader :name,
              :books
              
  def initialize(hash)
    @name = (hash[:first_name] + ' ' + hash[:last_name])
    @books = []
  end

  def write(name, publication_date)
    hash = Hash.new
    hash[:author_first_name] = self.name.split[0]
    hash[:author_last_name] = self.name.split[-1]
    hash[:title] = name
    hash[:publication_date] = publication_date
    book = Book.new(hash)
    @books << book
    book
  end
end
