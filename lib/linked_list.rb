class LinkedList
  

  def initialize
    @head = nil
  end


  def append(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node until current.next_node.nil? # Find the last node which points to nil
      current.next_node = new_node # Append new node to end of list
    end
  end


  def prepend(value)
    new_node = Node.new(value)
    
    if @head.nil?
      @head = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end


  def size
    count = 0
    current = @head

    while current != nil
      count += 1
      current = current.next_node
    end

    count
  end


  def head
    @head
  end


  def tail
    current = @head

    while current.next_node != nil
      current = current.next_node
    end

    current
  end


  def at(index)
    current = @head
    count = 0

    until count == index do
      current = current.next_node
      count += 1
    end

    current
  end


  def pop
    current = @head

    until current.next_node.next_node == nil do
      current = current.next_node
    end

    current.next_node = nil
  end


  def contains?(value)
    current = @head

    while current 
      return true if current.value == value
      current = current.next_node
    end

    return false
  end


  def find(value)
    current = @head
    count = 0

    while current
      return count if current.value == value
      current = current.next_node
      count += 1
    end

    return nil
  end 


  def to_s
    current = @head
    string = ""

    while current
      string += "(#{current.value}) -> "
      current = current.next_node
    end

    string += "nil"
  end


  def insert_at(value, index)
    if index == 0 
      prepend(value)
    elsif @head.nil?
      puts "Error. Empty list."
      return
    elsif index >= size
      if index == size
        append(value) 
      else
        puts "Out of bounds."
        return
      end
    else
      count = 0
      current = @head

      until count == index - 1
        current = current.next_node
        count += 1
      end

      new_node = Node.new(value)
      new_node.next_node = current.next_node
      current.next_node = new_node
    end
  end


  def remove_at(index)
    if @head.nil?
      puts "Error. Empty list."
      return
    elsif index == 0
      @head = @head.next_node
    elsif index >= size
      puts "Error. Out of bounds."
      return
    else
      count = 0
      current = @head

      until count == index - 1
        current = current.next_node
        count += 1
      end

      current.next_node = current.next_node.next_node
    end
  end
end
