
require "./calculator"

puts ":::: TEST SUMS ::::"

print "\nSuming numbers: "
if Calculator.new.sum(2, 1) == 3
  print "OK"
else
  print "FAIL"
end

print "\nSuming number and nil: "
if Calculator.new.sum(2, nil) == 2
  print "OK"
else
  print "FAIL"
end

print "\nSuming nil and number: "
if Calculator.new.sum(nil, 2) == 2
  print "OK"
else
  print "FAIL"
end

print "\nSuming non-numeric values: "
if Calculator.new.sum(:dog, nil) == nil
  print "OK"
else
  print "FAIL"
end

puts "\n\n:::: TEST SUBSTRACTIONS ::::"

print "\nsubstracting numbers: "
if Calculator.new.substract(3, 2) == 1
  print "OK"
else
  print "FAIL"
end

print "\nsubstracting non-numeric values: "
if Calculator.new.substract(:dog, nil) == nil
  print "OK"
else
  print "FAIL"
end


puts "\n\n:::: TEST MULTIPLICATIONS ::::"

print "\nmultiplying numbers: "
if Calculator.new.multiply(3, 2) == 6
  print "OK"
else
  print "FAIL"
end

print "\nmultiplying non-numeric values: "
if Calculator.new.multiply(:dog, nil) == nil
  print "OK"
else
  print "FAIL"
end

puts "\n\n:::: TEST DIVISIONS ::::"

print "\ndividing positive numbers: "
if Calculator.new.divide(3, 2) == 1.5
  print "OK"
else
  print "FAIL"
end

print "\ndividing non-numeric values: "
if Calculator.new.divide(:dog, nil) == nil
  print "OK"
else
  print "FAIL"
end

print "\ndividing by zero: "
if Calculator.new.divide(3, 0) == nil
  print "OK"
else
  print "FAIL"
end

puts "\n\n:::: TEST MODE ::::"

print "\nproviding fair winner: "
if Calculator.new.mode([2, 3, 2, 3, 3, 2, 4, 3]) == 3
  print "OK"
else
  print "FAIL"
end

print "\nproviding an even: "
if Calculator.new.mode([2, 3, 2, 3, 3, 2, 4]) == 2
  print "OK"
else
  print "FAIL"
end

print "\nproviding non-numeric values: "
if Calculator.new.mode([2, 3, 2, :catdog, 3, 2, 4]) == nil
  print "OK"
else
  print "FAIL"
end

puts "\n\n:::: TEST AVERAGE ::::"

print "\nproviding numbers: "
if Calculator.new.average([1, 2]) == 1.5
  print "OK"
else
  print "FAIL"
end

print "\nproviding empty array: "
if Calculator.new.average([]) == nil
  print "OK"
else
  print "FAIL"
end

print "\nproviding non-numeric values: "
if Calculator.new.average([:symbol, 1, 3, "hola"]) == nil
  print "OK"
else
  print "FAIL"
end

puts "\n\n:::: TEST MEDIAN ::::"

print "\nproviding odd amount of numbers: "
if Calculator.new.median([3, 1, 2]) == 2
  print "OK"
else
  print "FAIL"
end

print "\nproviding even amount of numbers: "
if Calculator.new.median([3, 1, 2, 4]) == 2.5
  print "OK"
else
  print "FAIL"
end

print "\nproviding empty array: "
if Calculator.new.median([]) == nil
  print "OK"
else
  print "FAIL"
end

print "\nproviding non-numeric values: "
if Calculator.new.median([:symbol, 1, 3, "hola"]) == nil
  print "OK"
else
  print "FAIL"
end
