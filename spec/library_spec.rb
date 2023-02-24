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
end

#Will need to implement array of books, array of authors, ability to add
#authors, and time frames from different authors. 