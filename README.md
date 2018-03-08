## [**Download** latest .exe version](https://github.com/kubar123/MagneticKelp/releases/latest)
* Drag and drop a .torrent file
* Drag and drop a magnet link
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


<img align="left" src="https://github.com/kubar123/MagneticKelp/blob/master/Img/mainWindowU.PNG" />

<img align="center" src="https://github.com/kubar123/MagneticKelp/blob/master/Img/settingsWindow1U.PNG" />

<img align="right" src="https://github.com/kubar123/MagneticKelp/blob/master/Img/SettingsWindow2u.PNG" />


1. The menu. Open settings, or get help information here.
2. Enable to have the CMD window list all files in the torrent. Useful when streaming from a 'season' torrent.
3. Stream. Closes the window, and starts streaming using the player specified in *Section 4*. Requires Peerflix and Node.js to be installed.
4. Select which player to stream the torrent with.
5. Enter custom peerflix options
6. Download with program
7. Download with selected program in *Section 6*
8. Drag and drop a magnet link here area.
9. Settings menu tabs.
10. The default application that is shown in *Section 4*
11. The default application that is shown in *Section 6*
12. Attempts to use the old cmd process if it still exists to stream. Ends old stream and starts a new one in the same CMD window.
13. The peerflix stream (CMD window) ends when the media player is closed. 
14. MagneticKelp will wait x seconds before attempting to hook into the media player. If the player has not started to stream when it times out, increase the timeout. Once timed out, magneticKelp will exit, the stream will continue.
15. Opens the application to where ever the mouse is located.
16. Opens the application to the center of screen x. The amount of monitors is calculated based on your setup.
17. Attempts to associate .torrent files with the application. May not always work, best to use the windows 'Open with' and browse to the *install directory* noted above.
18. Associates magnet links with this application. Copies the application to the *install directory* noted above.
19. Save the settings button. Some settings may require magneticKelp to restart to be applied.
20. Cancel settings, discarding any changes. Opens the main window.
21. Browse to the location of the programs .exe.
22. Restores the software tab to defaults.
