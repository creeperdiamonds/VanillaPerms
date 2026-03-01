# VanillaPerms

A powerful and flexible permissions and groups management system for vanilla Minecraft servers, implemented entirely with datapacks.

## Features

- **Group-Based Permissions**: Create groups with specific permissions and flags.
- **Player Overrides**: Assign individual players to groups and override their permissions or flags.
- **Hierarchical Permissions**: Supports wildcard permissions (e.g., `vp.command.*`).
- **Inheritance**: Groups can inherit permissions and flags from parent groups.
- **Flags System**: Control vanilla game mechanics like flight, invulnerability, and instant breaking via boolean flags.
- **In-Game Management**: Manage groups, players, and permissions using in-game function commands.
- **JSON-Based Storage**: All group and player data is stored in human-readable `.json` files for easy backup and external editing.
- **Sign-based Command Input**: A user-friendly way to run commands by typing them on a sign.

## Installation

1.  Download the latest release of the `VanillaPerms` datapack.
2.  Place the datapack `.zip` file or folder into the `datapacks` directory of your Minecraft world.
3.  In-game, run the command `/reload` to load the datapack.
4.  The datapack should now be active. You can verify by checking for the `vp` scoreboard objectives.
5.  Run `/function vp:reload_config` to initialize all settings.

## Usage

Most commands are run using the `/function` command with JSON-style arguments. For some commands, a book-based UI is provided to help suggest the correct syntax. There is also a sign-based input system triggered by `/trigger vp set 1`.

### Group Management

| Command                                                              | Description                                                                                                                              |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `/function vp:create_group {group:"<name>"}`                         | Creates a new, empty group.                                                                                                              |
| `/function vp:delete_group {group:"<name>"}`                         | Deletes an existing group.                                                                                                               |
| `/function vp:rename_group {old_name:"<name>", new_name:"<name>"}`     | Renames a group.                                                                                                                         |
| `/function vp:list_groups`                                           | Lists all currently configured groups.                                                                                                   |
| `/function vp:info_group {group:"<name>"}`                           | Displays detailed information about a group, including its permissions, flags, and inheritance.                                        |
| `/function vp:edit_group {group:"<name>", ...}`                      | Modifies a group. See actions below.                                                                                                     |

#### Edit Group Actions

Use these key-value pairs within the `/function vp:edit_group` command's NBT argument:

-   **Add Permission**: `{action:"permission_add", action_values:"<permission.node>"}`
-   **Remove Permission**: `{action:"permission_remove", action_values:"<permission.node>"}`
-   **Set Flag**: `{action:"flag_set", action_values:{<FlagName>:true|false}}`
-   **Set Inheritance**: `{action:"set_inheritance", action_values:["<parent_group>"]}` (Use an empty list `[]` to remove inheritance).
-   **Set Rank**: `{action:"rank_set", action_values:{Chat:"<rank>", Tab:"<rank>", Player:"<rank>"}}`

### Player Management

| Command                                                              | Description                                                                                                                              |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `/function vp:join_group {player:"<name>", group:"<name>"}`           | Assigns a player to a group. If the player is not in the system, they will be added.                                                      |
| `/function vp:leave_group {player:"<name>"}`                         | Removes a player's entry from `players.json`, returning them to the default state.                                                       |
| `/function vp:info_player {player:"<name>"}`                         | Displays detailed information about a player, including their group, personal permissions, and effective permissions.                      |
| `/function vp:edit_player {player:"<name>", ...}`                    | Modifies a player's individual data. See actions below.                                                                                  |
| `/function vp:check_permissions`                                     | Shows you all of your own effective permissions.                                                                                         |

#### Edit Player Actions

-   **Add Permission**: `{action:"permission_add", action_values:"<permission.node>"}`
-   **Remove Permission**: `{action:"permission_remove", action_values:"<permission.node>"}`
-   **Clear Permissions**: `{action:"permission_clear"}`

### System Management

| Command                                                              | Description                                                                                                                              |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `/function vp:reload_config`                                         | Resets and reloads the configuration from the JSON files, re-syncs OP players, and recalculates flags for all online players.             |
| `/function vp:maintenance {mode:"on|off"}`                           | Toggles the server's maintenance mode.                                                                                                   |

## Configuration

The datapack's data is stored in the world's `storage/vp/` directory.

### `groups.json`

This file contains an array of all permission groups.

```json
{
  "groups": [
    {
      "name": "default",
      "permissions": [
        "vp.command.check_permissions"
      ],
      "flags": {},
      "rank": {
        "Chat": null,
        "Tab": null,
        "Player": null
      },
      "inherits": []
    },
    {
      "name": "admin",
      "permissions": [
        "*"
      ],
      "flags": {
        "AllowFlight": true,
        "IsInvulnerable": true
      },
      "rank": {
        "Chat": "admin",
        "Tab": "admin",
        "Player": null
      },
      "inherits": []
    }
  ]
}
```

### `players.json`

This file contains an array of all players who have been assigned to a group or have custom overrides.

```json
{
  "players": [
    {
      "uuid": [I; -12345, 67890, -54321, 98765],
      "group": "admin",
      "permissions": [],
      "flags": {},
      "rank": {
        "Chat": null,
        "Tab": null,
        "Player": null
      }
    }
  ]
}
```

### `config.json`

This file contains default settings for the datapack.

```json
{
  "config": {
    "DefaultFlags": {
      "AllowFlight": false,
      "InstantBreak": false,
      "IsInvulnerable": false
    }
  }
}
```

## Permissions

Permissions are string-based nodes that control access to commands and features.

-   **Explicit**: `vp.command.create_group` grants access to just that command.
-   **Wildcard**: `vp.command.*` grants access to all commands under the `vp.command` node.
-   **Universal Wildcard**: `*` grants access to all permissions.
-   **Negative Permissions**: A permission prefixed with a `-` (e.g., `-vp.command.stop`) explicitly denies that permission, even if a wildcard would otherwise grant it.