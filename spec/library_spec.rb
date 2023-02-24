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

      expect(library.authors.length).to eq(1)
      expect(library.books.length).to eq(2)
    end
  end

  describe '#publication_time_frame_for' do 
    it 'can return time frames for specific author' do
      library = Library.new('Denver Public Library')
      charlotte_bronte = Author.new({
        first_name: "Charlotte", 
        last_name: "Bronte"
        })
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1846")
      villette = charlotte_bronte.write("Villette", "1853")
      robert_frost = Author.new({
        first_name: "Robert",
        last_name: "Frost"
      })
      fire_and_ice = robert_frost.write("Fire and Ice", "December 1920")
      nothing_gold = robert_frost.write("Nothing Gold can Stay", "October 1923")
      library.add_author(charlotte_bronte)
      library.add_author(robert_frost)
      expect(library.publication_time_frame_for(charlotte_bronte)).to be_a(Hash)
      expect(library.publication_time_frame_for(robert_frost)).to be_a(Hash)
      expect(library.publication_time_frame_for(charlotte_bronte)[:start]).to eq(1846)
      expect(library.publication_time_frame_for(charlotte_bronte)[:end]).to eq(1853)
      expect(library.publication_time_frame_for(robert_frost)[:start]).to eq(1920)
      expect(library.publication_time_frame_for(robert_frost)[:end]).to eq(1923)
    end
  end
end