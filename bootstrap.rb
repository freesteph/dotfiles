#!/usr/bin/ruby

def install_dep name, exec_name
  puts "Installing #{name}..."

  found = `which #{exec_name}`.empty?

  if found
    yield
  else
    puts "#{name} is already installed."
  end
end


install_dep("Brew", "brew") { `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` }

`brew bundle`

`brew services start emacs`
