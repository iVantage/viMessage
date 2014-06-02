# viMessage

This Vim plugin enables users to instant message each other across a shared drive. 
![Screenshot](https://trello-attachments.s3.amazonaws.com/5314a3eb848eb79b42836894/5374c4f5c6154a6047fe69fe/841x598/706353f88ef04b341eb6127eb3012fc3/screenShot.png)

## Table of Contents

- Installation
  - [Install using Pathogen](#install-using-pathogen)
- Setup
	- [File Paths](#file-paths)
- viMessage Commands
	- [Enter a Chat file](#enter-a-chat-file)
    - [Invite to Chat](#invite-to-chat)
	

#Installation

## Install using Pathogen 

(These instructions are based on iVantage's current system, which uses Windows and gVim. For Linux change /vimfiles/ to /.vim/)

viMessage is packaged to be easily downloadable/updateable via the Pathogen plugin.

1. Install [pathogen.vim] into `~/.vim/autoload/` (see [pathogen's
   readme][install-pathogen] for more information.)

[pathogen.vim]: http://www.vim.org/scripts/script.php?script_id=2332
[install-pathogen]: https://github.com/tpope/vim-pathogen#installation

2. Enable pathogen in your vimrc:

   ```vim
   call pathogen#infect()
   ```

3. Create the directory `~/vimfiles/bundle/`:

        mkdir ~/vimfiles/bundle

4. Clone the `viMessage` repo into `~/vimfiles/bundle/`:

        git clone https://github.com/iVantage/viMessage.git ~/vimfiles/bundle/viMessage/

To Update:

Run git pull from within ~/vimfiles/bundle/viMessage/

#Setup

## File Paths

The current code assumes a shared drive (N:\) however it should be trivial to alter this code to match the path of any shared drive. The shared drive should contain a directory called chats so that all chat files can be writter to (N:\chats\fileName.chat). Note that all chats are stored with a .chat extension. Vim uses this extension to provide IM-style syntax highlighting. See viMessage.vim and viMessageSyntax.vim for more information.

## Usernames

After installing viMessage, change g:username to whatever name you prefer. This will serve as your screen name for chats.

## FileRefresh

viMessage is powered by the FileRefresh plugin. FileRefresh must therefore be installed in order for viMessage to work. FileRefresh can be found at (https://github.com/iVantage/FileRefresh)

#viMessage Commands

##Enter a Chat file

Once the plugin is installed, to set up a chat on a file just type:

```vim
:Chat fileName
```

Note that Vim will append the N:\chats\ drive prefix and the .chat extension to the filename. Thus the true path of your chat file will be (N:\chats\fileName.chat)

##Invite to Chat

To invite another user to chat on the same file as you just type:

```vim
:Invite userName fileName
```

Please be sure to replace userName with the username specified as g:username in the user's viMessage.vim file. Otherwise you phail.

Happy Social Vimming!

## License 

(The MIT License)

Copyright (c) 2011

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
