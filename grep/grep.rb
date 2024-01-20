Grep = Class.new

def Grep.grep(pattern, flags, files)
  `grep #{flags.join(' ')} '#{pattern}' #{files.join(' ')}`.strip
end