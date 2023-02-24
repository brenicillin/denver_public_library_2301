class Book
  attr_reader :title,
              :author,
              :publication_date

  def initialize(hash)
    @title = hash[:title]
    @author = (hash[:author_first_name] + ' ' + hash[:author_last_name])
    @publication_date = hash[:publication_date]
  end

  def publication_year
    @publication_date.split[2].to_i
  end
  
end
