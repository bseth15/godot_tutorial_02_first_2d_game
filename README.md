# Godot Project Template

## Description:
Use this repository as a starter for Godot Projects to synchronize settings amongst developers.

## Getting Started:
1. Create New Repository
    * Navigate to [godot_template](https://github.com/bseth15/godot_template)
    * Click [Use this template](https://github.com/bseth15/godot_template/generate) on the top-right of the [page](https://github.com/bseth15/godot_template)
    * Enter settings for your personal repository
    * Click **Create repository from template** on the bottom of the page
2. Clone Repository
    * One easy way to do this is with Git configured in VScode
    * Open VScode and press **Ctrl + Shift + P**
    * Type **clone** and select **Git: Clone**
    * Enter the URL of your repository, or select **Clone from GitHub**
    * Enter the repository name, or select it from the drop-down-menu options
    * Choose a suitable location in *your file system* in which to clone the repository
    * Click **Select Repository Location** to begin the clone operation
    * Click **Open** to open the repository directory in the current VScode window, or **Open in New Window** to open the repository in a new VScode window
3. Open respository as VScode Workspace
    * With the repository open in VScode, open the Workspace configration file **%REPOROOT%/.vscode/godot.code-workspace**
    * Click the **Open Workspace** button in the bottom-right of the window
    * Alternatively, when opening the repository from VScode
      * Click **File > Open Workspace from File...**
      * Navigate to **%REPOROOT%/.vscode/godot.code-workspace** and click **Open**
4. Install Extensions
    * At some point VScode will ask if you want to install extensions recommended by this Workspace, click **Yes** to install all of them
    * Alternatively in the *Recommended* section of the *Extensions* tab, install the extensions you would like to install
      * Those recommended by the Workspace will have the note *This extension is recommended by users of the current workspace*
      
## Open Project in Godot For First Time:
1. Open the **Godot Engine - Project Manager**
2. Click **Scan**
3. Navigate to the **%REPOROOT%** and click **Select Curent Folder**
4. Godot will locate the Godot Project source directory and add it to the **Local Projects** tab
5. Select the project from the **Local Projects** tab and click **Rename** to give the Godot Project a meaningful name, type in the new name and click **Rename**
6. Select the project from the **Local Projects** tab and click **Edit**, or double-click the project from the **Local Projects** tab, to open the project in the Godot editor

## Setting VScode as External Editor:
After completing these steps you will no longer need to open VScode manually, opening a script in the Godot editor will launch VScode.
1. Close VScode, if it is open
2. Open the project in Godot, if it is not already open
3. From the menu bar at the top of the window select **Editor > Editor Settings**
4. Select **Text Editor > Files**
    * Make sure **Auto Reload Scripts On External Change** is checked
    * Make sure **Restore Scripts On Load** is unchecked
5. Select **Text Editor > External**
    * Make sure **Use External Editor** is checked
    * Set **Exec Path** to the full path of the VScode executable/binary
    * Set **Exec Flags** to **"{project}/../.vscode/godot.code-workspace" --goto {file}:{line}:{col}**
