# tsvim
A 'vim-as-an-ide' solution for osx.

# installation

If you don't have neovim installed yet, do so now:

`brew install neovim`

Then, copy this repository to ~/.config/tsvim:

`git clone https://github.com/angles-n-daemons/tsvim ~/.config/tsvim`

Lastly, you can create an alias for initializing tsvim:

`echo alias tsvim=\'NVIM_APPNAME=tsvim nvim\' \>\> ~/.bashrc`

if you use bash, or if you use zsh:

`echo alias tsvim=\'NVIM_APPNAME=tsvim nvim\' \>\> ~/.zshrc`

or if you use fsh,

`chsh -s bash`

Finally, restart your terminal and verify you can start tsvim.

`tsvim`

# keybindings

If you're unfamiliar with vim, I recommend starting with the vim tutorial. To do this, start vim, press `:` followed by `Tutor` and hit enter. TSVim is based on Vim, and therefore requires a minimum amount of Vim working knowledge.

Below are keybindings unique to tsvim.

### editing
| Keys    | Action       |
| ------- | --------------- |
| \<C-s\>   | Save file    |
| \<space\>xx | Show warnings |
| ]d      | Next warning |
| [d      | Prev Warning |
| K      | Show Documentation |
| \<Tab\>     | Select autocompletion |

### navigation
| Keys    | Action       |
| ------- | ------------------ |
| \<C-[h,j,k,l]\> | Move to window left, down, up or right |
| \<Space\>e | Open project navigator |
| \<C-p\>   | Search for file    |
| \<C-f\>   | Search for text |
| \<C-c\>   | Close window |
| \<C-q\>   | Close buffer |

### testing
| Keys    | Action       |
| ------- | ------------------ |
| \<Space\>tt | Run test closest to cursor |
| \<Space\>tO | Show test output |
| \<Space\>ts | Show test summary |
| \<Space\>tf | Run tests in file |
| \<Space\>tp | Run tests in project |

### debugging

* Note: tsvim will look for a `.vscode/launch.json` file if one exists to use as a debug configuration

| Keys    | Action       |
| ------- | ------------------ |
| \<Space\>db | Set breakpoint |
| \<Space\>dd | Start debugging |
| F7 | Open debug view |

**While debugging**
| Keys    | Action       |
| ------- | ------------------ |
| c | Continue |
| b | Set Breakpoint |
| n | Step Over |
| s | Step Into |
| o | Step Out |
| u | Step Up |
| d | Step Down |
| t | Terminate Debugger |
