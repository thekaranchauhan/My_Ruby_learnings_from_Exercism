
class NotMovieClubMemberError < RuntimeError; end
class Moviegoer; attr_reader :ticket_price, :age, :member

  def initialize(age, member: false)
    @age = age; @member = member
    @ticket_price = @age >= 60 ? 10 : 15
  end

  def watch_scary_movie?   = @age >= 18 ? true : false 
  def claim_free_popcorn!  = @member ? '🍿' : (raise NotMovieClubMemberError)
end