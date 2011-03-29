class Example
  def underbelly_crappy
    if !@the_underbelly
      @the_underbelly = Array.new
    end
    @the_underbelly
  end

  def underbelly
    @the_underbelly ||= []
  end
end

