require 'book_repository'

RSpec.describe BookRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test', user: 'postgres' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_books_table
  end

  it 'returns the number of books' do
    repo = BookRepository.new
    books = repo.all
    expect(books.length).to eq(5)
  end
  it 'returns the details of the first 2 books' do
    repo = BookRepository.new
    books = repo.all
    expect(books[0].id).to eq('1')
    expect(books[0].title).to eq('Nineteen Eighty-Four')
    expect(books[1].id).to eq('2')
    expect(books[1].title).to eq('Mrs Dalloway')
  end
  # it 'returns the details of a specific book' do
  #   repo = BookRepository.new
  #   book = repo.find('4')
  #   expect(book.id).to eq('4')
  #   expect(book.title).to eq('Dracula')
  # end
end
