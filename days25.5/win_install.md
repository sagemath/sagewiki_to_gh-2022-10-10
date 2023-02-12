
These are instructions for working with the Sage VMWare Virtual Appliance. For more about Sage, see <a href="http://www.sagemath.org">http://www.sagemath.org</a> 

Note. These instructions are tailored to version 4.5.2. 


## REQUIREMENTS

This can be used on any operating system that supports VMWare or the free VMWare player, for example Microsoft Windows. Your computer must have 2.5GB (!) free disk space and 512MB RAM. 

You need to have the free VMWare player installed; see 

         * <a href="http://www.vmware.com/products/player">http://www.vmware.com/products/player</a> 

## INSTALLATION

Installing Sage should take 15 to 20 minutes, less than 2GB hard drive space, and be painless. 

0. Make sure you have installed the free VMWare program: 

         * <a href="http://www.vmware.com/products/player/">http://www.vmware.com/products/player/</a> 
1. Download sage-vmware-4.5.2.zip. 

2. Extract it anywhere you want. (This will take about 15 minutes despite anything Windows tells you.  Do *not* stop the extract halfway through and think Sage will still work.) 


## USING SAGE

1. Double click on sage_vmware.vmx in the sage-vmware directory to run Sage. VMWare might give some warnings; ignore them. 

2. When the virtual machine finishes booting, double-click on the Sage Notebook icon. Sage will start and a web browser will connect to the Sage Notebook. You can use the browser that pops up, or your native Windows browser. For the latter, see the section USING A WINDOWS BROWSER below. 

3. Have fun! 


## USING A WINDOWS BROWSER

You can use Sage from your native Windows browser (Firefox is recommended). 

CAVEAT: There is an issue with the 4.5.2 version of the virtual machine, but it is not too difficult to resolve. Follow the instructions below. YOU ONLY NEED TO DO THIS ONCE! 

         1. Open a terminal. 
         1. Type the command: 
                     * sudo rm /etc/udev/rules.d/70-persistent-net.rules 
         1. You will be prompted for a password. It is: sage. 
         1. Restart the virtual machine (click on System -> Shutdown). 
From now on, when you launch the Sage Notebook you will be instructed to point your Windows browser to a URL address. The address looks something like this: 

         * <a href="http://192.168.220.128">http://192.168.220.128</a> 
Type this address into your Windows web browser. 
