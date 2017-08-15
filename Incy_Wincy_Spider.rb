#!/usr/bin/ruby
#C0d3d By Th3 M3nT4L H05p1T4L C0d3r5
#Coded By Th3 M4d Sc13nT15t & Th3 M4d Ch3m15t
require 'spidr' #The Module used to spider
require 'colorize'#The Module used to add colour

puts"""


                         
            .#+                           ,@;`           
        `@@`                                  +@+        
     .@@.         `:'':`          .;'',`         '@#     
   #@#      ,@@@;                        +@@+.     `@@.  
  `@     @@@#                               `@@@,    +@  
   @     ,@                                    @     .@  
   @     `@                                    @     :@  
   @     `@                                    @     +;   
    @:     @@'@@@@@@@               #@@@@@@@;@:     @,   
    .@      @'      .@             #@      `#@      @    
     @.               @`          #@         `     @#    
     :@           '    @`  '  `  @#    `          `@     
      @+        ,@@@:   @.#, `: @#   #@@@`        @'     
      `@`    .@@'   #@@;:@@@@@@@@,+@@;  `#@#     @@      
       #@  @@@         @@@@@@@@@@@+        .@@; '@       
        @@@+       .  `.@@@@@@@@@,``  `       @@@,       
         @#       @@@@@@@@@@@@@@@@@@@@@.       @;        
                 @@     @@@@@@@@@#     @@      @         
               #@    ,@@@ @@@@@@`@@@    :@.              
             ,@,   .@@,  @@@@@@@`  +@@    @@             
            @@     @;    @@@@@@@@    @@     @#           
          @@'     @@     @@@@@@@@    .@+     @@`         
          @@      @@     @@@@@@@@     @@     ;@.         
          @@      @#     @@@@@@@@     @@     `@,         
          @@      @#     @@@@@@@'     @@      @.         
          @@      @#     @@@@@@@`     @@     `@`         
           @@     @@      @@@@@       @`     @           
           `@     @@       @@@@       @     #@           
            @#    +@       @@@,       @     @'           
            +@    ,@       `@@        @     @            
             @    `@        :.       :@    #@            
               @+  `@               :@   @               
                @   @               #@  `@               
                @`  @'              @,  @                
                 '   '              '  '
                   `  @            @  @                  
                   #  @           :  '                 
                     ' `          @  +                   
                       @          ;                      
                       :         .  .                    
                        `        @                       
                        '                                
                                :                  
""".yellow

puts"""
Incy_Wincy_Spider
C0d3d By: </> M3nT4l Ho5p1T4l CoD3r5 </>
""".red

print "Input Target: ".blue

#Telling The Program To Spider Given Site
Spidr.site(gets.chomp) do |spider| 

#With These Parameters
  spider.every_html_page do |page| 

#This Is Where I Define The Page Info To Crawl 
    if page.doc
      page.doc.xpath('/html/head/title').each do |title|
        puts title.text
      end
    end

#This is where I Define The Meta Data To Crawl
    if page.doc
      page.doc.xpath("// meta[@name='description']/@content").each do |meta|
        puts meta.text
      end
    end
  end
end
  