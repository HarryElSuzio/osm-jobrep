# OSM x QBUS | JOB REPUTATION SYSTEM | Dynamic System for JOB EMPLOYEES to Earn Reputation based on how actively they perform their JOB. 

### SETUP INSTRUCTIONS 
Please take backup of files that you change. I am not responsible for any damage you do to your files/server. 

**CORE CHANGES**
- Go to the Core -> Server Side Folder -> Player.lua
- Paste `	PlayerData.metadata["jobrep"] = PlayerData.metadata["jobrep"] ~= nil and PlayerData.metadata["jobrep"] or 0` with other META DATA LINES (Around line 60)

**SCRIPT FUNCTIONS**
- Script should be ensured/started in the resources.cfg
- **Where ever you want JOB REPUTATION to be added to player, just go in that JOB CLIENT EVENT and use these as required.**
  `TriggerServerEvent('osm:server:jobrep', repvalue)` where `repvalue` is the amount of rep you want to ADD to the EXISTING JOBREP. 


- Restart server once, and you are done. 
