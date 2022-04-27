TEXT = "TEXTS A AFFICHER"

for i in [*30..37]
  puts "\e[#{i}m#{TEXT}\e[0m"
end

for i in [*40..47]
  puts "\e[#{i}m#{TEXT}\e[0m"
end

for i in [*40..47]
  puts "\e[#{i}m#{TEXT}\e[0m"
end