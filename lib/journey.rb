class Journey

  attr_reader :start, :finish, :fare, :complete

  def initialize(start, finish, fare, complete)
    @start = start
    @finish = finish
    @fare = fare
    @complete = complete
  end


end
