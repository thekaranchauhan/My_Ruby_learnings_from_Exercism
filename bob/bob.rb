class Bob
  def self.hey(remark)
    case remark.strip
    when /\A\s*\z/
      "Fine. Be that way!"
    when /\A[^a-z]*[A-Z][^a-z]*\?\z/
      "Calm down, I know what I'm doing!"
    when /\A[^a-z]*[A-Z][^a-z]*\z/
      "Whoa, chill out!"
    when /\?\z/
      "Sure."
    else
      "Whatever."
    end
  end
end