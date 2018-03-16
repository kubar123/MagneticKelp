## [**Download** latest .exe version](https://github.com/kubar123/MagneticKelp/releases/latest)
__*__ Under 'assets' click the 'magneticKelp.exe' link  
__*__ Your antivirus might quarantine the application

* Drag and drop .torrent files or magnet links
* Edit -> Preferences -> Associate magnet/torrent links

## Streaming torrents

More information: https://github.com/mafintosh/peerflix
1.  Install Node.js: https://nodejs.org/en/
2.  Install Peerflix - in a command window enter:
```
npm install -g peerflix
```

## Additional Information

Install directory:
```
%appdata%\MagneticKelp
```

## Help


<table>
<colgroup>
<col>
<col>
</colgroup>
  <tr valign="top">
    <td width="55%" rowspan="3" >
      <ol>
        <li> The menu. Open settings, or get help information here.</li>
		<li> Enable to have the CMD window list all files in the torrent. Useful when streaming from a 'season' torrent. Use the arrow and enter keys to select the torrent you wish to stream. </li> 
		<li> Stream. Closes the window, and starts streaming using the player specified in <b>Section 4</b>. Requires Peerflix and Node.js to be installed. May be disabled if Peerflix is not installed. </li>
		<li>Select which player to stream the torrent with.</li>
<li>Enter custom peerflix options.</li>
<li>Select which program to download the torrent with.</li>
<li>Download with selected program in <b>Section 6</b>.</li>
<li>Drag and drop a magnet link into the area. Torrent will be loaded, select the stream/download buttons.</li>
<li>Settings menu tabs.</li>
<li> The default application that is shown in *Section 4* by default when the program opens.</li>
<li> The default application that is shown in *Section 6* by default when the program opens.</li>
<li> Attempts to use the old cmd process if it still exists to stream. Ends old stream and starts a new one in the same CMD window.</li>
<li> The peerflix stream (CMD window) ends when the media player is closed. </li>
<li> MagneticKelp will wait x seconds before attempting to hook into the media player. If the player has not started to stream when it times out, magneticKelp will exit, the stream will continue.</li>
<li> Opens the application to where ever the mouse is located.</li>
<li> Opens the application to the center of screen x. The amount of monitors is calculated based on your setup.</li>
<li> Attempts to associate .torrent files with the application. May not always work, best to use the windows 'Open with' and browse to the *install directory* noted above.</li>
<li> Associates magnet links with this application. Copies the application to the *install directory* noted above.</li>
<li> Save the settings button. Some settings may require magneticKelp to restart to be applied.</li>
<li> Cancel settings, discarding any changes. Opens the main window.</li>
<li> Browse to the location of the programs .exe.</li>
<li> Restores the software tab to defaults.</li>
	</ol>
</td>
    <td><img align="right" src="https://raw.githubusercontent.com/kubar123/MagneticKelp/master/Img/mainWindowU.PNG" /></td>
  </tr>
  <tr>
    <td ><img align="right" src="https://raw.githubusercontent.com/kubar123/MagneticKelp/master/Img/settingsWindow1U.PNG" /></td>
  </tr>
  <tr>
    <td ><img align='right' src="https://raw.githubusercontent.com/kubar123/MagneticKelp/master/Img/SettingsWindow2u.PNG" /></td>
  </tr>
</table>


## FAQ
*Q.'ERROR' is shown in the settings -> software*.  
A. Click the 'defaults' button and restart the app. If the issue persists delete the settings.ini file in the install directory noted above.

*Q. I cannot click on the stream button, it is disabled.*  
A. Peerflix was not found, see instructions above to install the streaming component.
