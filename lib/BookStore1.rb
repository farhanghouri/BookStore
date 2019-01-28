
class BookStore

	def self.ready()
		puts 'ready!'
	end

	def initialize()
	@books = {}
	end
	
	def add(title,data)
		if @books[title].nil?
			@books[title] = data 
		else
			puts 'book already exist.'
		end	
	end
	
	def update(title,data)
		unless @books[title].nil?
			@books[title] = data
			puts "book #{title} has been updated!"
		else
			puts "book does not exist"
		end

	end
	
	def delete(title)
		unless @books[title].nil?
			@books.delete(title)
			File.delete(title) if File.exist?(title)
			puts "book #{title} has been deleted!"
		else
			puts "book does not exist"
		end
	end
	
	def display()
		@books.each{
			|a,b| puts "title: #{a} data: #{b}"
		}
	end
	
	def saveToFile(title)
		unless @books[title].nil?
			File.open(title,"w"){
				|line| line.puts @books[title]
			} 
			puts "book #{title} has been saved!"
		else
			puts "book does not exist"
		end
	end
	
	def search(title)
		unless @books[title].nil?
			puts "book exist" 
	    else
			puts "book does not exist"
		end
	end
end

obj = BookStore.new()

puts "ADD 1\nUPDATE 2\nDELETE 3\nDISPLAY 4\nSave 5\nSearch 6	"

loop do 
	print "enter: "
	n = gets.chomp.to_i
	case n
	when 1
		print "title: "
		title = gets.chomp
		print "data: "
	 	data = gets.chomp
	 	obj.add(title,data)
	when 2
		print "title: "
		title = gets.chomp
		print "data: "
	 	data = gets.chomp
	 	obj.update(title,data)
	 
	when 3
		print "title: "
		title = gets.chomp 
	 	obj.delete(title)
	when 4
		obj.display()
	
	when 5
		print "title: "
		title = gets.chomp
		obj.saveToFile(title)
	when 6
		print "title: "
		title = gets.chomp					
		obj.search(title)

	else
	break	
	end

end
	
  