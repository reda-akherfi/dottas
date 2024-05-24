#!/bin/bash



# read -p "hey fucker we will remove the dottas dir"
# rm -rvf ~/Dropbox/dottas/
# cp -rv ~/dottas/ ~/Dropbox/dottas/
rsync  --delete   -v   --links  --recursive ~/dottas/ ~/Dropbox/dottas
rsync  --delete   -v   --links  --recursive ~/dottas/ ~/Onedrive/dottas
rsync  --delete   -v   --links  --recursive ~/dottas/ ~/GDRIVE_AKHERFI68/dottas


# read -p "hey fucker we will remove the pass dir"
# rm -rvf ~/Dropbox/pass
# cp -rv ~/.local/share/pass/ ~/Dropbox/pass/
rsync  --delete   -v   --links  --recursive ~/.local/share/pass/ ~/Dropbox/pass
rsync  --delete   -v   --links  --recursive ~/.local/share/pass/ ~/Onedrive/pass
rsync  --delete   -v   --links  --recursive ~/.local/share/pass/ ~/GDRIVE_AKHERFI68/pass


# read -p "hey fucker we will remove the data_wiki dir"
# rm -rvf ~/Dropbox/data_wiki/
# cp -rv ~/projects/data_anal/data_wiki/ ~/Dropbox/data_wiki/
rsync  --delete   -v   --links  --recursive ~/projects/data_anal/data_wiki/ ~/Dropbox/data_wiki
rsync  --delete   -v   --links  --recursive ~/projects/data_anal/data_wiki/ ~/Onedrive/data_wiki
rsync  --delete   -v   --links  --recursive ~/projects/data_anal/data_wiki/ ~/GDRIVE_AKHERFI68/data_wiki

# read -p "hey fucker we will remove the vimwiki dir"
# rm -rvf ~/Dropbox/data_wiki/
# cp -rv ~/projects/data_anal/data_wiki/ ~/Dropbox/data_wiki/
rsync  --delete   -v   --links  --recursive ~/memalpha/vimwiki/ ~/Dropbox/vimwiki
rsync  --delete   -v   --links  --recursive ~/memalpha/vimwiki/ ~/Onedrive/vimwiki
rsync  --delete   -v   --links  --recursive ~/memalpha/vimwiki/ ~/GDRIVE_AKHERFI68/vimwiki

