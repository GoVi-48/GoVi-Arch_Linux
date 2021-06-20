#!/bin/bash

# Valheim
rsync -arv --delete "/Datos/Games/PC/Valheim/Save Game/" "/Media/[SaveData]/Games/Saved Games/Valheim/"

# Satisfactory
rsync -arv --delete "/Media/Games/PC/Satisfactory/Save Game/" "/Media/[SaveData]/Games/Saved Games/Satisfactory/FactoryGame/"

# Subnautica
# rm -rf "/Media/Games/PC/Subnautica/Save Game/Subnautica/SavedGames/autosave_slot0000/CellsCache"
# rm -rf "/Media/Games/PC/Subnautica/Save Game/Subnautica/SavedGames/autosave_slot0001/CellsCache"
rsync -arv --delete "/Media/Games/PC/Subnautica/Wine/wine-pfx/drive_c/users/govi/AppData/LocalLow/Unknown Worlds/" "/Media/[SaveData]/Games/Saved Games/Subnautica/Unknown Worlds/"

# Subnautica: Below Zero
# rm -rfv "/Media/Games/PC/Subnautica - Below Zero/SNAppData/SavedGames/slot0000/CellsCache"
rsync -arv --delete "/Media/Games/PC/Subnautica - Below Zero/SNAppData/" "/Media/[SaveData]/Games/Saved Games/Subnautica - Below Zero/SNAppData/"

