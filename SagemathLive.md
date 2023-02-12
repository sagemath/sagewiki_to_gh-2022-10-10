

# SagemathLive

This way of using sagemath is much faster than the virtualbox version and is therefor quite useful for windows user. We use here ubuntu. The use of debian is the same, but we do not make debian sagemath images. If you are using another debian (Knoppix...) and you have a debian sagemath version, it is very similiar. 


## What you need

* bootable CD or USB-stick with ubuntu  
* usb-stick,sd card... to put the sagemath image file on it 
* internet connection (or the deb-files you need for sagemath gfortran...) 

## After starting the ubuntu live system

1. Connect to the internet, top right is a button near the speaker symbol (for problems ask your local ubuntu community)  
1. Open a terminal: 
      * press **Alt+F2** 
      * type: **gnome-terminal** 
1. get root rights: 
      * type: **sudo bash** and press Return 
1. install the packages you need 
      * type: **apt-get install gfortran** and press Return 
1. find the path to the sagemath image file  
      * open natilus (file manager)  
      * in the menu top left press the second from left, it depends on the language you are using (Places,Orte...) 
      * look for the medium where you copied the sagemath image file 
      * if you found the place of the sagemath image file click on on the pencil button on the top left side directly under the back icon 
      * now the path view line changed from button view to text line view 
      * now you know the path to the image file 
      * go back to the terminal 
      * our path is **/media/8cki5t** for example:  **cd /me** press TAB-key **8ck** TAB-key again until there is written **cd /media/8cki5t** 
1. mount the image file (more information <a href="/UsingSquashFS">UsingSquashFS</a>) 
      * type: **makedir /usr/local/sage-X.Y.Z** where X.Y.Z ist the version number written in the sagemath image file name 
      * type: **mount -o loop -t squashfs sage-X.Y.Z.sqfs /usr/local/sage-X.Y.Z** Tip: You can use the TAB key while typing the mount command as well 
1. start sagemath 
      * type: **ctrl+shift+T** to open a new tab in the terminal windows 
      * type: **/usr/local/sage-X.Y.Z/sage --notebook** Tip: You can use the TAB key here as well 
      * type an admin password if you want 
      * the firefox with the sagemath should open now 