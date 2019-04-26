My Path of Vim
==============

My path to Vim and learning it once I wanted to wasn't anything flashy or awe inducing, nor was it fast. It was my own pace, and I found it enjoyable. I feel like my experience is general "meh" - that is, not super exciting, probably how many people would and do get into vim. However, when I have read various "how to/I get into Vim", I don't typically read my story. 

I usually read about someone who couldn't get it until they dove in with both feet on bare bones vi/m and even disapbled arrow keys. Or someone who used it because they manager servers remotely. Or even the old guys who used it because it was an upgrade to pico or even ed. Essentially all of these are saying "start with a little, and add stuff you know".

I tried that path and it didn't work - at least not right away. This is where my story feels like it sounds like anyone and everyone getting started. I started with atom. Atom did a lot of stuff well, it was fairly intuitive and user friendly, and it looked nice. But it got slow. I wasn't even working with very large files and it would get slow. So I tried sublime. Not quite so obvious or nice feeling, but blazing fast.

Sometime in that, I I tried vim (maybe neovim). I think I had read about it when playing around with linux, tried it once or twice, and quickly went to nano. But this time I tried to learn it. I worked through some of vimtutor, etc, and I could get the hang of some of it, but getting the files I wanted was tedius - who wants to do :e ~/Nested/But/Actually/Logical/And/Organized/File/Structure.code every time? definitely not me. so I bailed.

Eventually I took another look and found fzf and that it could integrate pretty easily into vim. Now I could get some work done. So step one for me was really fzf - get that working and now I can do something. That also meant I had to use a package manager. I tried pathogen at first, but Plug just takes care of everything in a minimalist way while still giving lots of declaritive options, so I used that.

Next I think I had to get a theme, and maybe airline up. I know, I know, that doesn't actually matter, but to me it does. I often was going back to atom because I just liked how it looked lots more than sublime and vscode. It took a bit to find themes and get airline setup to do what I wanted, but then I had something I felt like I WANTED to code in.

Mouse support was next (pretty easy), followed closely by linting, and then autocompletion (ale and deoplete). With all that setup, I could basically go to town. At this point I was largely coding in java, which meant I needed to stay in intellij for my dayjob, but I was itching for neovim.

I started finding and trying out all kinds of plugins, mostly just because it was fun - it scratched the constant tweaking and improving itch. At some point (after I had multiple lsp client plugins setup) I realized it was getting to be too much, and I need to pare down.

At that point, did i finally go back and try to build up a (secondary) vimrc from "scratch" (basically from my current vimrc). So that's where I am now. Trying to slowly reorganize and figure out what I need and what I can ditch.I still use a mouse, and I didn't disable the arrow keys, but I'm trying to learn to do things a more "vanilla vim" way, and then judge if I want to stick with that or do something more intuitive/simple/modern/whatever. The typical advice is to start there, build up and learn everything from scratch as you go.

I get that sentiment, but I think it is flawed. That is where you should aim to get. But really, just getting started is what matters - getting what you need in place to make you want to use vim. Don't try to turn vim into sublime or atom or vscode or (God forbid) intellij. Do make it something you are excited about and can work with. It's fine if Vim just isn't something exciting. But find out. Slowly learn more parts of vim, and slowly try and replace the things you're used to with vanilla vim ways of doing the same thing. Slowly organize and pare down your rc file.
