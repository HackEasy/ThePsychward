#!/usr/bin/ruby
#Framework
#</> Coded By Th3 M3nT4L H05p1T4L C0d3r5 <\>
#</> Th3 M4d Sc13nT15t & M4d Ch3m15t <\>
require 'colorize'
print "Th3 M4d Sc13nT15t & M4d Ch3m15t".green
puts"""

 Take That Dick Out                  ,//J                 L J  :J
   of Your Ear..                   _,-////L                J /  ::T
                             __,-///////J                 L/  :::L
  And Fuck What           _,////////////L                JJ   ::J
   You Heard!        _,-////////,'////J                / L  .::L
                   ,-,/,'/,'///,'//////L               /,' .:::/
                 ,/,','/,'///,'////////             _,-'  ::::'
               ,/,','/,'///,'////////'          _,-'    .:::/:L
              ///,'////////,'//////'         ,-'      .::::/:J
          ,  ////////////,'/,'///'         ,'      ..:::::/::L
      ,   / //////////////,'///'         ,'     ..:::::::/::J
,,._   `;,/J/////////////////'          /    .::::::::::.:::L
  ''////,;;L////////////////           J    ::::::::::'.:::/
      ,,///////////////////            L  .::::::::''.::::/ 
  ,,//////////.----.'////J            J _::::'''  ):::::/ 
 '     ,'//.'---///////L              L-.____,..   L::::'
       ,--|/--///////||//J------._  __)  .::::::L J:::'
      /|--|///'''_'//|::       ./L     ::::*::J L''
     J---||||  ,'o',l|::       ://J:..:::::::::-'
     Lll--||l_`' `-'  L::    ,-:////L::::::::'
     Jllll||  o L ,   |::   / |/////L::::::'
      l|ll`:-'  /_l /|::.  L l/////::''
       ''''''`...---':L::: J.'-;::J'
            ll    J::J:::' L::.__.'
             LL    `'|::: J:::L    
             JJ.     |::' L:::J         Wouldn't You Like To See
              Lll._  L:*)J l:::L        What Other Tricks I can do?
  Lets Play    '`==-:T; T  l::J
 A Little Game     J::; L   J::`l.
                   T::' J     L:  L    Im Not Just A One Trick Pony..
                   L::  T     J:' J   Ill Do Things Your Girlfriend Wont...
                  J::: |       L:' L
                  T:::J         |:'J
                  T:::L          |: L                               
                  L::J            :'J

""".yellow


puts "[1] HeaderExtractor              [2] StatusChecker".red
puts "[3] PortScanner                  [4] AdminPageExtractor".green
puts "[5] BruteForcer                  [6] SiteCrawler".red      
puts "[7] Nuke".green


print " What Module Would You Like? ".blue
tool = gets.chomp
if tool == '1'
require '/root/Desktop/Framework/Modules/Headers.rb'
elsif tool == '2'
require '/root/Desktop/Framework/Modules/Response.rb'
elsif tool == '3'
require '/root/Desktop/Framework/Modules/PortScanner.rb'
elsif tool == '4'
require '/root/Desktop/Framework/Modules/Admin.rb'
elsif tool == '5'
require '/root/Desktop/Framework/Modules/SurgeryBrute.rb'
elsif tool == '6'
require '/root/Desktop/Framework/Modules/Incy_Wincy_Spider.rb'
elsif tool == '7'
require '/root/Desktop/Framework/Modules/Nuke.rb'
else 
puts "Error"
end
