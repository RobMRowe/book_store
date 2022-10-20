require_relative './database_connection'
require_relative './book'

class BookRepository
  def all
    books = []

    sql = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      book = Book.new

      book.id = record['id']
      book.title = record['title']
      book.author_name = record['author_name']

      books << book
    end

    return books
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, title FROM books WHERE id = $1;

    # Returns a single book object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(book)
  # end

  # def update(book)
  # end

  # def delete(book)
  # end
end
