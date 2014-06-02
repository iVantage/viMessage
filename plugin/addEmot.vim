function! AddEmot(emot)
	
if a:emot == "smile"
	
	:normal i   
	:normal i   _________ 
	:normal i  /         \  
	:normal i |  0     0  |  
	:normal i |           |  
	:normal i |   \___/   |  
	:normal i  \_________/  
	:normal i   
	
endif

if a:emot == "sad"
	
	:normal i   
	:normal i   _________ 
	:normal i  /         \  
	:normal i |  0     0  |  
	:normal i |    ___    |  
	:normal i |   |   |   |  
	:normal i  \_________/  
	:normal i   
	
endif

if a:emot == "shock"
	
	:normal i   
	:normal i   _________ 
	:normal i  /         \  
	:normal i |  0     0  |  
	:normal i |    ___    |  
	:normal i |   |___|   |  
	:normal i  \_________/  
	:normal i   
	
endif

if a:emot == "cry"
	
	:normal i   
	:normal i   _________ 
	:normal i  /         \  
	:normal i |  0     0  |  
	:normal i |  ' ___ '  |  
	:normal i |  '|   |'  |  
	:normal i  \_________/  
	:normal i   
	
endif

if a:emot == "peace"
	
	:normal i   
	:normal i      ."".    ."",
	:normal i      |  |   /  /
	:normal i      |  |  /  /
	:normal i      |  | /  /
	:normal i      |  |/ .--._ 
	:normal i      |    _|  | `|
	:normal i      |  /` )  |  |
	:normal i      | /  /'--|__/
	:normal i      |/  /       |
	:normal i      (  ' \      |
	:normal i       \    `.   /
	:normal i        |       |
	:normal i        |       |
	:normal i  
endif

endfunction

:command! -nargs=1 AddEmot call AddEmot(<f-args>)
