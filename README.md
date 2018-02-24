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
### MagneticKelp
*Download* the latest .exe file from the '*Releases*' Tab above, or download the *source* code and *compile* using AutoHotKey. 

### Use MagneticKelp for magnet links
1. Open settings
2. Under the 'file association' section, click the 'associate magnet links' button
* The .exe file will be copied to the install directory noted above

### Use MagneticKelp for .torrent files
1. Run the application as administrator
2. Under the 'file association' section, click the 'associate .torrent files' button

*OR*

1. Right click on a .torrent file
2. Select 'Open With', and selece MagneticKelp. If necessary, browse for the file located in the install directory noted above.

### Streaming - Peerflix [Optional]
More information: https://github.com/mafintosh/peerflix

1.  Install Node.js: https://nodejs.org/en/
2.  Install Peerflix:
```
npm install -g peerflix
```

<hr>

## Features
* Drag and drop a .torrent file into the main window to start streaming
* Easily select which program to download/stream content with

<hr>

## Help
<Table>
  <tr><td>List Files</td><td> Enable if the torrent has multiple files, select the file you wish to stream in the command window with the arrow keys and enter</td></tr>
  <tr><td>Reuse Command Prompt when possible</td><td>Attempts to reuse the old command prompt window if still open, otherwise opens a new window.</td></tr>
  <tr><td>Open on monitor</td><td>Opens the application to the center of the monitor.</td></tr>
  </table>
  
 ### Troubleshooting
  * Open magneticKelp, open the settings (top right) and click the 'associate magnet links'. Click on any magnet link and magneticKelp should open
