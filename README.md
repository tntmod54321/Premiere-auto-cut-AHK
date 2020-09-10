# This is outdated and garbage
# Premiere-auto-cut-AHK

The most important thing, and the biggest issue with this script (but I'm too lazy to fix it), is that you need to change the variable numberofclips at the start of the file otherwise the script will crash or otherwise behave unexpectedly.  
This script requires TextFormat (An AHK library) it can be found [Here](https://github.com/hi5/TF), simply put tf.ahk in the same folder as this script.  
Also you need to select all video and audio tracks or the unselected ones will be deleted.  
![select all audio tracks](https://github.com/tntmod54321/Premiere-auto-cut-AHK-/blob/master/Screenshot_139.png)  
You can exit the script at any time by pressing escape (ESC)  
  
There are 3 shortcuts, Shift + F1, Shift + F2, and Shift + F3  
Shift F1 will bring up a tooltip to give the current mouse position,  
Shift F2 will automatically cut the video at the timestamps provided in the joblist  
Shift F3 will remove every other clip (AKA the blocks of video that are outside of the cuts defined in the joblist)  
# To use the script  
1. Put TF.ahk in the same folder as this script  
2. Make a joblist.txt file in the same folder, an example joblist is in the repository.  
(E.G.):
>1 (clip number)  
00:00:10:00 (the starting timestamp that will be pasted into premiere)  
00:00:20:00 (the ending timestamp that will be pasted into premiere)  
2  
00:00:40:00  
00:00:50:00  
etc...  
  
Take the number of clips you have in your joblist (in the example above, 2)  
and change "numberofclips = 0" to "numberofclips = 2"  
3. use Shift + F1 to find where your mouse has to click on the screen to click the box with the timestamp  
![Timestamp box](https://github.com/tntmod54321/Premiere-auto-cut-AHK-/blob/master/Screenshot_140.png)  
Save the coordinates, and change "mousecutx" to the x value, do the same for the y value and "mousecuty"  
4. Using the same Shift + F1 shortcut to figure out where you want the menu (tooltip) to show up with the values tooltipmouseposx and tooltipmouseposy  
5. And lastly you need to bind the functions Close Gap to "Ctrl+Shift+F10" and Add Edit to All Tracks to "Ctrl+Shift+K", you can change these binds in Premiere and in the AHK script if you want though.
Then you should just be able to use Shift + F2 then Shift + F3 in premiere pro and end up with some nicely cut clips.  
(note that this script was designed for a slightly altered default keyboard shortcut setup so if you're a poweruser your binds might conflict with the ones in the script, for example d being the default "Select All Clips at Playhead" key is used here.
