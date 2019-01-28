
class BookStore
  
  def self.instance
    @@instance
  end

  def initialize
    @books_rating = {}
  end

  @@instance = BookStore.new

  public def add(title, rating)
    if @books_rating[title].nil?
      @books_rating[title] = rating
    else
      -1
    end
    end

  def update(title, rating)
    if @books_rating[title].nil?
      -1
    else
      @books_rating[title] = rating
    end
  end

  def delete(title)
    @books_rating.delete(title) unless @books_rating[title].nil?
  end

  def display
    @books_rating.each do |a, b|
      puts "title: #{a} rating: #{b}"
    end
  end

  def save_to_file
    File.open('test.marshal', 'w') { |to_file| Marshal.dump(@books_rating, to_file) }
  end

  def read_from_file
    puts File.open('test.marshal', 'r') { |from_file| Marshal.load(from_file) }
  end

  def search(title)
    if @books_rating[title].nil?
      -1
    else
      1
    end
  end

  private_class_method :new
end

obj = BookStore.instance

puts "ADD 1\nUPDATE 2\nDELETE 3\nDISPLAY 4\nSave to File 5\nSearch 6\nRead From File 7	"

loop do
  print 'enter: '
  n = gets.chomp.to_i
  case n
  when 1
    print 'title: '
    title = gets.chomp
    print 'rating: '
    data = gets.chomp
    puts 'book already exist.' if obj.add(title, data) == -1
  when 2
    print 'title: '
    title = gets.chomp
    print 'rating: '
    data = gets.chomp
    puts 'book does not exist' if obj.update(title, data) == -1
  when 3
    print 'title: '
    title = gets.chomp
    obj.delete(title)
  when 4
    obj.display

  when 5
    obj.save_to_file
  when 6
    print 'title: '
    title = gets.chomp
    if obj.search(title) == -1
      puts 'book does not exist'
    else
      puts 'book exist'
    end
  when 7
    obj.read_from_file
  else
    break
  end
end
