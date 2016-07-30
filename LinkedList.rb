class LinkedList
	attr_reader :head, :tail

	def initialize()
		@head = nil
		@tail = nil
	end

	def prepend(item)
		@head = Node.new(item, @head)
		if @head.next_node == nil
			@tail = @head
		end
	end

	def append(item)
		if @head == nil
			@head = Node.new(item, nil) 
		else
			tmp = @head
			while tmp.next_node != nil
				tmp = tmp.next_node
			end
			tmp.next_node = Node.new(item, nil)
			@tail = tmp.next_node
		end
	end

	def size
		counter = 0
		if @head == nil
			return counter
		else
			tmp = @head
			while tmp != nil
				counter += 1
				tmp = tmp.next_node
			end
		end
	end

	def at(index)
		return nil if @head == nil
		counter = 0
		tmp = @head
		while counter < index && tmp != nil
			tmp = tmp.next_node
			counter += 1
		end
		if tmp == nil
			return StandardError
		else
			tmp
		end
	end

	def pop
		if @head == nil
			return @head
		elsif @head.next_node == nil
			return_value = head
			@head = nil
			@tail = nil
			return_value 
		else
			tmp = @head
			while tmp.next_node.next_node != nil
				tmp = tmp.next_node
			end
			return_value = @tail
			tmp.next_node = nil
			@tail = tmp
			return_value
		end
	end

	def contains?(item)
		if @head == nil
			return false
		else
			tmp = @head
			while tmp.next_node != nil
				if tmp.item == item
					return true
				else
					tmp = tmp.next_node
				end
			end
			return false
		end
	end

	def find(item)
		if @head == nil
			return nil
		else
			tmp = @head
			counter = 0
			while tmp.next_node != nil
				if tmp.item == item
					return counter
				else
					counter += 1
					tmp = tmp.next_node
				end
			end
			return nil
		end
	end

	def to_s
		if @head == nil
			return "nil"
		else
			tmp = @head
			return_string = ""
			while tmp.next_node != nil
				return_string += "( #{tmp.item} ) -> "
				tmp = tmp.next_node
			end
			return_string += "( #{tmp.item} ) -> nil"
			return_string
		end
	end

	def insert_at(index, item)
		if @head == nil
			return StandardError
		else
			counter = 0
			tmp = head
			while counter < index && tmp != nil
				tmp = tmp.next_node
				counter += 1
			end
			if tmp == nil
				return StandardError
			else
				tmp.next_node = Node.new(item, tmp.next_node)
			end
		end
	end

	def remove_at(index)
		if @head == nil
			return StandardError
		else
			counter = 0
			current = @head
			pevious = nil
			while counter < index && current != nil
				previous = current
				current = current.next_node
				counter += 1
			end
			if current == nil
				return StandardError
			else
				previous.next_node = current.next_node
			end
		end
	end


	class Node
		attr_accessor :item, :next_node

		def initialize(item = nil, next_node = nil)
			@item = item
			@next_node = next_node
		end
	end
end	


a = LinkedList.new
a.prepend(1)
a.append(2)
a.append(3)
a.append(4)
puts a
a.remove_at(1)
puts a
