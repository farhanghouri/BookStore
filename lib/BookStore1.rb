
class BookStore
  def self.instance
    @instance
  end

  def initialize
    @books = {}
    @books_rating = {}
  end

  @instance = BookStore.new

  def add(title, data)
    if @books[title].nil?
      @books[title] = data
    else
      puts 'book already exist.'
    end
  end

  def update(title, data)
    if @books[title].nil?
      puts 'book does not exist'
    else
      @books[title] = data
      puts "book #{title} has been updated!"
    end
  end

  def delete(title)
    if @books[title].nil?
      puts 'book does not exist'
    else
      @books.delete(title)
      File.delete(title) if File.exist?(title)
      puts "book #{title} has been deleted!"
    end
  end

  def display
    @books.each do |a, b|
      puts "title: #{a} data: #{b}"
    end
    @books_rating.each do |a, b|
      puts "title: #{a} rating: #{b}"
    end
  end

  def save_to_file(title)
    if @books[title].nil?
      puts 'book does not exist'
    else
      File.open(title, 'w') do |line|
        line.puts @books[title]
      end
      puts "book #{title} has been saved!"
    end
  end

  def book_rating(title, rating)
    @books_rating[title] = rating
  end

  def search(title)
    if @books[title].nil?
      puts 'book does not exist'
    else
      puts 'book exist'
    end
  end

  private_class_method :new
end

obj = BookStore.instance

puts "ADD 1\nUPDATE 2\nDELETE 3\nDISPLAY 4\nSave 5\nSearch 6\nRating 7	"

loop do
  print 'enter: '
  n = gets.chomp.to_i
  case n
  when 1
    print 'title: '
    title = gets.chomp
    print 'data: '
    data = gets.chomp
    obj.add(title, data)
  when 2
    print 'title: '
    title = gets.chomp
    print 'data: '
    data = gets.chomp
    obj.update(title, data)

  when 3
    print 'title: '
    title = gets.chomp
    obj.delete(title)
  when 4
    obj.display

  when 5
    print 'title: '
    title = gets.chomp
    obj.save_to_file(title)
  when 6
    print 'title: '
    title = gets.chomp
    obj.search(title)
  when 7
    print 'title: '
    title = gets.chomp
    print 'rating: '
    rating = gets.chomp
    obj.book_rating(title, rating)
  else
    break
  end
end
