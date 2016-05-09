#ScottyLeaks
require 'csv'
puts "Getting postcodes"

postcodes = CSV.read("postcodes.csv")
scotdata = []
for postcode in postcodes
  if postcode[7].eql?("SCT")
    scotdata << postcode 
  end
end
scotcodes = []
scotdata.each { |s| scotcodes << s[0]; scotcodes << s[5] unless s[5].nil? }
scotcodes << "SCOTLAND"

puts "Finding Scottish addresses"

addresses = CSV.read("Addresses.csv")
#countries = addresses.collect {|a| a[3] } all the country codes
total = addresses.size
scot_addresses = []
addresses.each_with_index do |address, i|
  inSco = false
  scotcodes.each do |s|
    inSco = true if (address[0].include?(" #{s}") and ["GBR", "POL"].include?(address[3]))
  end

  scot_addresses << (address+["https://offshoreleaks.icij.org/nodes/#{address[5]}"]) if inSco
  puts "Scanned #{i+1} of #{total} entries" if (i%1000).eql?(0)
end

puts "Done, found #{scot_addresses.size} entries"

puts "Writing to file output.csv"
CSV.open("output.csv", "wb") do |csv|
  arr = addresses[0]
  csv << arr.push("link")
  scot_addresses.each do |s|
    csv << s
  end
end