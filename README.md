# VanillaPerms

A vanilla-native permissions system datapack for Minecraft, inspired by LuckPerms. VanillaPerms brings advanced permission management to vanilla Minecraft servers without requiring any external plugins or mods.

## Features

- **Group-based permissions** - Organize players into groups with custom permissions and flags
- **LuckPerms-inspired** - Familiar permission structure for users of popular permission plugins
- **Vanilla native** - Works on vanilla Minecraft servers with no plugin dependencies
- **Flexible inheritance** - Set up group hierarchies with permission inheritance
- **Dynamic permissions** - Add, remove, and modify permissions in real-time
- **Rank display** - Show player ranks in chat and tab list
- **Selector enforcement** - Control which selectors players can use
- **Operator override** - Customize operator permission levels
- **Bulk operations** - Apply permissions and flags to multiple players at once

## Installation

### Requirements
- Minecraft Java Edition 1.20+ (Pack format 18)
- Vanilla server or compatible server software (Spigot, Paper, Fabric, etc.)
- World save enabled (required for datapack functionality)

### Installation Steps

#### Step 1: Download the datapack
Clone or download this repository to get the VanillaPerms datapack folder.

#### Step 2: Locate your server's datapacks folder
Navigate to your server directory:
```
your-server/world/datapacks/
```

If the `datapacks` folder doesn't exist, create it.

#### Step 3: Install the datapack
Copy the `VanillaPerms` folder into the `datapacks` directory:
```
your-server/world/datapacks/VanillaPerms/
```

Your file structure should look like:
```
your-server/
├── world/
│   └── datapacks/
│       └── VanillaPerms/
│           ├── pack.mcmeta
│           ├── data/
│           └── ...
├── server.properties
└── ...
```

#### Step 4: Reload the datapack
Start or restart your server. The datapack will automatically load and initialize.

In-game, you can verify installation by running:
```
/function vp:setup
```

#### Step 5: Configure VanillaPerms
After setup, configure the system using:
```
/trigger vp
```

Or use the command aliases:
```
/trigger permissions
/trigger perms
/trigger rank
```

## Usage

### Complete Command Reference

All VanillaPerms commands use the `/trigger vp` system with a menu-driven interface. You can also use the aliases `/trigger perms`, `/trigger permissions`, or `/trigger rank`.

#### 1️⃣ Group Creation

Create a new group:
```
/trigger vp create group MyGroupExample
```

- Creates a new group named `MyGroupExample`
- Initializes it with default flags from `config.json`
- Returns `[SUCCESS]` message on completion

#### 2️⃣ Editing Group Permissions

**Add single permission:**
```
/trigger vp edit MyGroupExample add give
```

**Add multiple permissions at once:**
```
/trigger vp edit MyGroupExample add give,teleport,fly
```

**Remove single permission:**
```
/trigger vp edit MyGroupExample remove give
```

**Remove multiple permissions:**
```
/trigger vp edit MyGroupExample remove give,fly
```

**Wildcard permissions:**
```
/trigger vp edit MyGroupExample add MyPlugin.*
```

- Wildcards (`*`) grant all permissions matching the pattern
- `admin.*` grants all `admin.X` permissions
- `*` grants full server access

#### 3️⃣ Editing Group Flags

**Set a single flag:**
```
/trigger vp edit MyGroupExample flag AllowExecute true
```

**Set multiple flags at once:**
```
/trigger vp edit MyGroupExample flag ChatRank true,TabRank false
```

**Remove flag override (use default config flag):**
```
/trigger vp edit MyGroupExample flag AllowExecute reset
```

Popular flags:
- `AllowExecute` - Can execute commands
- `ChatRank` - Display rank in chat
- `TabRank` - Display rank in tab list
- `DebugMode` - Show debug info
- `MaintenanceMode` - Temporary lock

#### 4️⃣ Editing Ranks / Display Names

**Set chat rank:**
```
/trigger vp edit MyGroupExample rank MyChatRank --CHAT
```

**Set tab rank:**
```
/trigger vp edit MyGroupExample rank MyTabRank --TAB
```

**Set both with different names:**
```
/trigger vp edit MyGroupExample rank ChatRankName --CHAT
/trigger vp edit MyGroupExample rank TabRankName --TAB
```

**Wipe all display names:**
```
/trigger vp edit MyGroupExample rank ---wipe
```

#### 5️⃣ Assigning / Removing Players from Group

**Join a player to a group:**
```
/trigger vp join MyGroupExample playerName
```

**Remove a player from their group:**
```
/trigger vp leave MyGroupExample playerName
```

#### 6️⃣ Reload / Setup / Safety Commands

**Reload VP configuration:**
```
/trigger vp reload
```

- Clears all scoreboards
- Reloads groups and players from storage
- Reapplies all permissions
- Useful after manual edits to storage files

**Setup VP (first load or fresh world):**
```
/function vp:setup
```

- Initializes the system
- Creates all required scoreboards
- Loads default configuration
- Run this after first installation

**Check operator level / safety:**
```
/trigger vp op_check
```

- Validates operator permissions
- Only OPs with level ≥ 3 can execute sensitive commands (if `RequireOperatorLevel` is enabled)
- Syncs operator status with Minecraft op list

#### 7️⃣ Using SubBase Aliases

If you configured `"SubBase": ["permissions", "perms", "rank", "permsA"]` in `config.json`, you can use these aliases:

```
/trigger perms create group MyGroupExample
/trigger permissions edit MyGroupExample add jump
/trigger rank join MyGroupExample playerName
/trigger permsA leave MyGroupExample playerName
```

All commands work identically with any alias.

#### 8️⃣ Debug / Inspection Commands

**Enable debug info for a group:**
```
/trigger vp edit MyGroupExample flag DisplayDebugInfo true
```

Shows internal recalculations and flag processing - useful for troubleshooting permission issues.

**Enable rank hover information:**
```
/trigger vp edit MyGroupExample flag RankHoverInfo true
```

Hover over player names in chat to see their group and rank information.

### Real-World Usage Examples

#### Example 1: Set Up a Moderator Group

```
# 1. Create the group
/trigger vp create group moderator

# 2. Add moderation permissions
/trigger vp edit moderator add command.ban,command.kick,command.mute

# 3. Set chat rank
/trigger vp edit moderator rank Moderator --CHAT

# 4. Assign a player
/trigger vp join moderator Steve

# 5. Verify
/trigger vp reload
```

#### Example 2: Create an Admin with Full Access

```
# Create admin group
/trigger vp create group admin

# Grant all permissions
/trigger vp edit admin add *

# Set display
/trigger vp edit admin rank [Admin] --CHAT

# Assign yourself
/trigger vp join admin [YourName]
```

#### Example 3: Restrict a Specific Group

```
# Create basic group
/trigger vp create group builder

# Add only building permissions
/trigger vp edit builder add command.worldedit,command.build

# Disable execute (prevent running arbitrary commands)
/trigger vp edit builder flag AllowExecute false

# Assign builders
/trigger vp join builder BuilderPlayer1
/trigger vp join builder BuilderPlayer2
```

### Alternative: Function-Based Commands

Most operations also work as direct function calls (advanced):

```
/function vp:create_group {group: "moderator"}
/function vp:join_group {player: "Steve", group: "moderator"}
/function vp:edit_group {group: "moderator", action: "permission_add", permission: "command.ban"}
/function vp:leave_group {player: "Steve"}
/function vp:reload_config
```

---

## Configuration

Configuration is stored in:
```
data/vp/storage/config.json
```

### Key Settings

- **DefaultFlags** - Default permissions for all groups
- **MaintenanceMode** - Disable VanillaPerms temporarily
- **DebugMode** - Enable debug output for troubleshooting
- **SafeMode** - Prevent accidental data loss

## File Structure

```
VanillaPerms/
├── pack.mcmeta           # Datapack metadata
├── README.md             # This file
├── LICENSE               # MIT License
└── data/
    ├── minecraft/
    │   └── tags/functions/
    │       └── tick.json # Tick function registration
    └── vp/
        ├── functions/    # All game functions
        ├── storage/      # JSON data storage (config, groups, players)
        └── command/      # Command parsing functions
```

## Troubleshooting

### Datapack not loading
- Check that you placed it in `world/datapacks/` (not a subfolder)
- Verify the folder name is exactly `VanillaPerms`
- Ensure `pack.mcmeta` is in the root directory
- Run `/reload` command or restart the server

### Functions not working
- Verify the datapack is loaded: `/datapack list enabled`
- Enable command blocks in `server.properties`: `enable-command-block=true`
- Check that you're using Minecraft 1.20+

### Permissions not applying
- Run `/function vp:reload_config` to refresh the system
- Check `data/vp/storage/` JSON files for corruption
- Enable DebugMode in config for detailed output

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions, bug reports, and feature requests are welcome! Feel free to open issues or submit pull requests.

## Support

For issues, questions, or suggestions, please open an issue on this repository.

---

**VanillaPerms** - Making vanilla permissions advanced since 2026
