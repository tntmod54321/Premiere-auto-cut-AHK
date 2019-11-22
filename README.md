# Premiere-auto-cut-AHK

# The most important thing, and the biggest issue with this script (but I'm too lazy to fix it), is that you need to change the variable numberofclips at the start of the file otherwise the script will crash or otherwise behave unexpectedly.  
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
