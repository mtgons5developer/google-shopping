require 'open-uri'
require 'nokogiri'
require "google_drive"
require "uri"

def google

#t1 = Time.now   	
#puts t1
#exit

session = GoogleDrive::Session.from_config("client_secret.json")
ws = session.spreadsheet_by_key("1PVkIjpP62BgDNXBh5SYIjiDxdvvNo5r8fFSLgdN4zSo").worksheets[1]

$ul = 0
File.open("URL_Link.txt", "r") do |f|
  f.each_line do |line|  	
	#html = Nokogiri::HTML(open("Steve-Jobs.html"))
	encoded_url = URI.encode(line)
	uurl = encoded_url.chomp('%0A') 
	html = Nokogiri::HTML(open(uurl))	
	html.css(".os-seller-name-primary").first 
  	
  	$ul = $ul + 1
  	$ull = $ul

	s = File.new('stores.txt', 'w+')
	p = File.new('prices.txt', 'w+')

	sl=0
	html.css(".os-seller-name-primary").each do |store|  
	  $ssl = "#{sl += 1}"
	  #s.write(store.text+"\n") 
	  $tt = store.text

	  if $tt == " My Choice Software "
	  	ws[$ull+1, 3] = $ssl
		$pl = 0
		html.css(".tiOgyd").each do |price|  
		#p.write(price.text+"\n")
		$ppl = "#{$pl += 1}"
		ff = price.text
			if $ppl == $ssl
	  			ws[$ull+1, 4] = ff	
	  			puts ff + "=My Choice Software"  					
	  			#ws.save
	  			break 
			end 
		end  		  	
	  elsif $tt == " Trusted Tech Team "
	  	ws[$ull+1, 5] = $ssl
		$pl = 0
		html.css(".tiOgyd").each do |price|  
		#p.write(price.text+"\n")
		$ppl = "#{$pl += 1}"
		ff = price.text
			if $ppl == $ssl
	  			ws[$ull+1, 6] = ff	
	  			puts ff + "=Trusted Tech Team"  					
	  			#ws.save
	  			break 
			end 
		end  		  	
	  elsif $tt == " SoftwarePorts "
	  	ws[$ull+1, 7] = $ssl
		$pl = 0
		html.css(".tiOgyd").each do |price|  
		#p.write(price.text+"\n")
		$ppl = "#{$pl += 1}"
		ff = price.text
			if $ppl == $ssl
	  			ws[$ull+1, 8] = ff	
	  			puts ff + "=SoftwarePorts"  					
	  			#ws.save
	  			break 
			end 
		end  		  	
	  elsif $tt == " SoftwarePug "
	  	ws[$ull+1, 9] = $ssl
		$pl = 0
		html.css(".tiOgyd").each do |price|  
		#p.write(price.text+"\n")
		$ppl = "#{$pl += 1}"
		ff = price.text
			if $ppl == $ssl
	  			ws[$ull+1, 10] = ff	
	  			puts ff + "=SoftwarePug"  					
	  			#ws.save
	  			break 
			end 
		end 
	  end	  
	end
	puts $ull 	
	ws.save
	#exit
	sleep 10
  end
end

 ws[1, 2] = Time.now  
 ws.save 
 
end



loop do 
  
  t1 = Time.now

  if t1.hour == 20
  	puts t1
  	puts "Starting Competitor Research"
  	google
  	puts "END Google Competitor Research Completed"

  	puts t1
  	puts Time.now
  end  
  t2 = Time.now
  t3 = "Waiting to Start Competitor Research"
  puts [t2,t3].join(' ')
  sleep 600
end

