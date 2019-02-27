folder = ARGV[0]
files = Dir["./#{folder}/input/*.txt"]

correct = files.all? do |file|
  test_number = file.match(/\d+/)
  output_file = "./#{folder}/output/output#{test_number}.txt"
  get_result = "cat #{file} | ruby #{folder}/program.rb"
  get_expected = "cat #{output_file}"
  result = %x( #{get_result} ).gsub(/\n/, '')
  expected = %x( #{get_expected} ).gsub(/\n/, '')
  expected == result
end

if correct
  puts "All test pass!"
else
  puts "Some test didn't pass"
  puts "expected output from: #{output_file}"
  puts expected
  puts ""
  puts "recieved output"
  puts result
end