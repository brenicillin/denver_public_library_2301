require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  describe '#initialize' do
    it 'exists' do
      library = Library.new('Denver Public Library')

      expect(library).to be_a(Library)
      expect(library.books).to eq([])
      expect(library.authors).to eq([])
    end
  end

  describe '#add_author' do
    it 'can add authors' do
      library = Library.new('Denver Public Library')
      charlotte_bronte = Author.new({
        first_name: "Charlotte", 
        last_name: "Bronte"
        })
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1846")
      villette = charlotte_bronte.write("Villette", "1853")
      library.add_author(charlotte_bronte)
      require 'pry'; binding.pry

      expect(library.authors.length).to eq(1)
      expect(library.books.length).to eq(2)
    end
  end
end

#Will need to implement array of books, array of authors, ability to add
#authors, and time frames from different authors. 