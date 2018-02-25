# MagneticKelp

<img align="right" src="https://github.com/kubar123/MagneticKelp/blob/master/Img/three.PNG"/>

MagneticKelp is a torrent client manager for windows. It helps with streaming, or downloading a file when you have multiple torrenting clients installed.

![Main Window](https://github.com/kubar123/MagneticKelp/blob/master/Img/Two.PNG) 

Install directory:
```
%appdata%\MagneticKelp
```
<hr>


## Install
### Downloading MagneticKelp
1. Click the releases tab above 
<img align="center" src="https://github.com/kubar123/MagneticKelp/blob/master/Img/install-releases.png" />
2. Click the 'MagneticKelp.exe' link under 'Assets'
<img align="center" src="https://gihub.com/kubar123/MagneticKelp/blobl/master/Img/install-exe.png" />

### Use MagneticKelp for magnet links
1. Open settings (top right cog wheel)
2. Under the 'file association' section, click the 'associate magnet links' button
* The .exe file will be copied to the install directory noted above
3. Click on a magnet link

### Use MagneticKelp for .torrent files
1. Run the application as administrator
2. Under the 'file association' section, click the 'associate .torrent files' button

*OR*

1. Right click on a .torrent file
2. Select 'Open With', and selece MagneticKelp. If necessary, browse for the file located in the install directory noted above.

### Using MagneticKelp to stream - [Peerflix] - Optional
More information: https://github.com/mafintosh/peerflix

1.  Install Node.js: https://nodejs.org/en/
2.  Install Peerflix - in a command window enter:
```
npm install -g peerflix
```

<hr>

## Features
* Drag and drop a .torrent file into the main window and select to stream/download the file
* Drag and drop a magnet link into the designated area, and start straming/downloading
* Choose out of many programs to downlad or stream the content with.

<hr>

## Help
<table>
  <tr><td>List Files</td><td> Enable if the torrent has multiple files, select the file you wish to stream in the command window with the arrow keys and enter</td></tr>
  <tr><td>Reuse Command Prompt when possible</td><td>Attempts to reuse the old command prompt window if still open, otherwise opens a new window.</td></tr>
  <tr><td>Open on monitor</td><td>Opens the application to the center of the monitor.</td></tr>
</table>
  
 ### Troubleshooting
  * Open magneticKelp, open the settings (top right) and click the 'associate magnet links'. Click on any magnet link and magneticKelp should open
  * Try deleing the install directory noted above, and running the application again.