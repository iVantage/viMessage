function! SetupChat(file)
	:execute ":30vnew N:\\chats\\" . a:file . ".chat"
	:normal G
	:execute ":s/$/\r\r+----------------------\r+ " . g:username . " joined \r+ viMessage Session\r+----------------------\r/"
	:set formatoptions=l
	:set lbr
"	:set syntax=viMessageSyntax
  :normal G
	:set autoread
	:set switchbuf=useopen
	:w
	:call FileRefresh()
	:belowright split
	:enew
	map <buffer> <cr> :call MessageEnter()<cr>
	map <leader>c :call CloseChat()<cr><cr>
	:wincmd k
	:normal kkkk
	:wincmd j
endfunction

function! MessageEnter()
	:0
	:execute ":0,0s/^/" . g:username .": /"
	:%y+
	:normal dG
	:wincmd k
	:normal G
	:normal p
	:w
	:normal G
	:wincmd j
endfunction

function! CloseChat()
	:wincmd k
	:call KillRefresh()
	:bd!
	:bd!
	"If the chat window is being closed, restart invitation checking
	"in case someone wants to talk to you again
	:call CheckInvite()
endfunction



" Check the N:\Chats directory for an invites file
" If the user is listed, trigger SetupChat  
function! CheckInvite()
	
" Begin python code

python << EOF
import vim
from threading import Thread
import time
import os
import re

checkFlag = True

def readInvite(n):
	invitePath = "N:\Chats\chatInvites"
	lastModTime = os.path.getmtime(invitePath)
	userName = vim.eval("g:username")	
	
	global checkFlag
	while checkFlag:
		if lastModTime != os.path.getmtime(invitePath):
			#Store all the lines we don't need in a list
			#We will write them back to the file later
			#omitting the lines matching the username
			#Essentially this will delete the invites 
			#from the file that we have matched. We 
			#don't need them anymore and keeping them in
			#would lead to invite thrashing
			fileLines = []
			#Open file
			with open(invitePath) as ip:
				#Iterate through each line
 				for line in ip:
					#Check for username match
					if "invite:" + userName in line:
						chatMatch = re.search('file:[A-z0-9]+', line)
						if chatMatch is not None:
							chatFile = chatMatch.group()
							chatFile = chatFile.replace("file:","")
							checkFlag = False
							setupCommand = ":call SetupChat(\"" + chatFile + "\")"
							vim.command(setupCommand)
					else:
						fileLines.extend(line)
			#Rewrite file with matched invite removed
			with open(invitePath, 'w') as ipW:
				for line in fileLines:
					ipW.write(line)
		#Update last modified time
		lastModTime = os.path.getmtime(invitePath)
		#Wait for the given interval before checking again
		time.sleep(n)
				
t = Thread(target=readInvite, args=(2.0,))
t.start()

EOF
endfunction

function! StartCheckingInvites()
"Begin python code

python << EOF
global checkFlag
checkFlag = True
EOF
endfunction

function! StopCheckingInvites()
"Begin python code

python << EOF
global checkFlag
checkFlag = False
EOF
endfunction

function! ChatInvite(user, fileName)
"Begin python code
python << EOF
import vim

def chatInvite():
	invitePath = "N:\Chats\chatInvites"
	myUsername = vim.eval("g:username")
	user = vim.eval("a:user")
	fileName = vim.eval("a:fileName")
	with open(invitePath, 'a') as ip:
		ip.write(myUsername + " " + "invite:" + user + " " + "file:" + fileName + " ")

chatInvite()
EOF
endfunction

"Setup username for viMessage
:let g:username="Dimitri"

"Setup viMessage
:command! -nargs=1 Chat call SetupChat(<f-args>) 
:command! -nargs=* Invite call ChatInvite(<f-args>) 
"Start checking chat invitations when Vim is run
:call CheckInvite()
"Stop checking chat invitations once Vim is closed
:au VimLeavePre * call StopCheckingInvites()


