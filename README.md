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
- Minecraft Java Edition 1.20.2+ (Pack format 18)
- Vanilla server or compatible server software (Spigot, Paper, Fabric, Vanilla, etc.)
- World save enabled (required for datapack functionality)
- Command blocks enabled
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

### Quick Start with /trigger vp

The easiest way to manage VanillaPerms is through the `/trigger vp` command. Simply type the command and follow the sign prompts:

```
/trigger vp
```

Available command aliases:
```
/trigger permissions
/trigger perms
/trigger rank
```

### Trigger Command Examples

**1. Create a new group "admin":**
```
/trigger vp set 1
# Then follow the sign: type "admin"
```

**2. Join the "admin" group (as a player):**
```
/trigger vp set 2
# Then type your username
```

**3. Add a permission to a group:**
```
/trigger vp set 3
# Follow prompts to select group and add permission
```

**4. Edit group flags (like ChatRank, DebugMode):**
```
/trigger vp set 4
# Follow the menu to toggle flags for a group
```

**5. Reload configuration (refresh the system):**
```
/trigger vp set 5
# Full system reset and configuration reload
```

### Function Example Templates

**Create a new group:**
```
/function vp:create_group {group: "moderator"}
# Expected: [SUCCESS] Group 'moderator' created
```

**Join a player to a group:**
```
/function vp:join_group {player: "Steve", group: "admin"}
# Expected: [SUCCESS] Player 'Steve' added to group 'admin'
```

**Add permission to a group:**
```
/function vp:edit_group {group: "admin", action: "permission_add", permission: "command.ban"}
# Expected: [SUCCESS] Group permissions updated successfully
```

**Add multiple permissions at once:**
```
/function vp:edit_group {group: "moderator", action: "permission_add", permission: "command.ban,command.kick,command.mute"}
# Expected: [SUCCESS] Group permissions updated successfully
```

**Remove permission from a group:**
```
/function vp:edit_group {group: "admin", action: "permission_remove", permission: "command.ban"}
# Expected: [SUCCESS] Group permissions updated successfully
```

**Set group flags (enable features):**
```
/function vp:edit_group {group: "admin", action: "flag_set", permission: "ChatRank"}
# Sets the ChatRank flag for the admin group
```

**Remove player from any group:**
```
/function vp:leave_group {player: "Steve"}
# Expected: [SUCCESS] Player removed from group
```

**Reload entire configuration:**
```
/function vp:reload_config
# Expected: [SUCCESS] Configuration reloaded
```

### Built-in Groups

VanillaPerms comes with 5 pre-configured groups:

1. **default** - Used for all players without a custom group
2. **operator.lvl1** - Operator level 1 (restrictions)
3. **operator.lvl2** - Operator level 2 (moderate restrictions)
4. **operator.lvl3** - Operator level 3 (server admin) - Full permissions by default
5. **operator** - Full server operator - Unrestricted

### Permission Examples

Common permissions you might use:

- `command.ban` - Allow ban command
- `command.kick` - Allow kick command
- `command.mute` - Allow chat mute
- `command.tp` - Allow teleport commands
- `command.gamemode` - Allow gamemode changes
- `admin.*` - Allow all admin commands (wildcard)
- `*` - Allow EVERYTHING (full access)

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

**VanillaPerms** - Advanced vanilla permissions

