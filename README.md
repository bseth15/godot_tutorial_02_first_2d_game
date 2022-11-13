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
