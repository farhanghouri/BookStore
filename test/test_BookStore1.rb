require 'minitest/autorun'
require 'BookStore1'

class BookStoreTest < Minitest::Test
  def test_english_hello
    assert_equal "book does not exist",
    BookStore.instance.delete("english")
  end

   
end