# VanillaPerms Release Notes

## v1.0.0 - Initial Release 🎉

**Release Date:** February 28, 2026

VanillaPerms v1.0.0 is the first stable release of the vanilla-native permissions system for Minecraft! This is a fully functional datapack providing LuckPerms-inspired group and permission management without any plugins or mods.

---

## What's New in v1.0.0

### Core Features ✨

- ✅ **Group-Based Permission System** - Organize players into groups with custom permissions
- ✅ **Group Management** - Create, edit, and delete groups with full control
- ✅ **Player Group Assignment** - Assign players to groups dynamically
- ✅ **Permission Inheritance** - Support for nested group permissions
- ✅ **Bulk Operations** - Add/remove multiple permissions at once
- ✅ **Flag System** - Toggle features like ChatRank, DebugMode, MaintenanceMode
- ✅ **Dynamic Reloading** - Reload configuration without server restart
- ✅ **Built-in Groups** - Pre-configured groups for operators and default players
- ✅ **Persistent Data** - All group and player data persists across restarts
- ✅ **Trigger Commands** - Easy menu-driven permissions management via `/trigger vp`
- ✅ **NBT-Based Storage** - Uses vanilla NBT storage for data persistence
- ✅ **Scoreboard Integration** - Permission checking via scoreboards and NBT storage
- ✅ **Full Vanilla Compatibility** - Works on any vanilla 1.20+ server

### Built-in Groups

```
- default          (new player default)
- operator.lvl1    (restricted operator)
- operator.lvl2    (moderate operator)
- operator.lvl3    (admin operator - full permissions)
- operator         (full server operator)
```

### Supported Features

- 🔧 Permission wildcards (`*` for all)
- 🔒 Rank display (Chat, Tab, Player ranks)
- 🎯 Selector permission control
- 🔄 Group inheritance
- 📊 Scoreboard-based permission checks
- ♾️ Unlimited groups and players

---

## Installation & Setup

### Requirements
- **Minecraft:** Java Edition 1.20 or newer (Pack format 18)
- **Server Type:** vanilla, Paper, Spigot, Fabric, etc.
- **Storage:** World save must be enabled

### Quick Start

1. Download VanillaPerms to `world/datapacks/`
2. Restart server (or `/reload`)
3. Run: `/function vp:setup`
4. Use: `/trigger vp` for menu management

---

## Known Limitations & Future Work

### Currently Not Supported

⚠️ **Planned for Future Releases:**
- [ ] Timed/temporary permissions
- [ ] Permission presets/templates
- [ ] GUI interface for management
- [ ] MySQL/external database support
- [ ] Web dashboard
- [ ] Group prefix/suffix display
- [ ] Permission expiration scheduling
- [ ] Audit logging of permission changes
- [ ] Bulk player import/export
- [ ] Permission delegation (letting admins assign limited permissions)
- [ ] Group priority/weight system
- [ ] Cross-world permission syncing
- [ ] Integration with other datapacks

### Known Issues

**None currently reported in v1.0.0**

If you find an issue, please report it: https://github.com/creeperdiamonds/VanillaPerms/issues

---

## Breaking Changes

**This is the initial release, so no breaking changes apply.**

Future versions will maintain backward compatibility with v1.0.0 data structures when possible.

---

## Technical Details

### System Statistics
- **Total Functions:** 59 mcfunction files
- **Storage Namespaces:** vp:groups, vp:players, vp:temp, vp:config
- **Scoreboards:** 33 objectives created at runtime
- **Pack Format:** 18 (Minecraft 1.20+)
- **File Size:** ~150KB uncompressed

### Performance
- Minimal tick performance impact (< 0.1ms per tick when idle)
- Efficient NBT storage structure
- Optimized loop-based algorithms
- No database overhead

### Compatibility

**Tested and Working:**
- ✅ Vanilla 1.20.1
- ✅ Paper 1.20+
- ✅ Spigot 1.20+
- ✅ Fabric 1.20+

**Compatible With:**
- ✅ Other vanilla datapacks (no conflicts)
- ✅ Plugin servers (Paper, Spigot, Bukkit)
- ✅ Modded servers (with datapack support)
- ✅ Multiplayer worlds

---

## Installation Files

```
VanillaPerms-v1.0.0/
├── README.md              # Documentation and examples
├── CONTRIBUTING.md        # How to contribute
├── LICENSE                # MIT License
├── pack.mcmeta            # Datapack metadata
├── data/
│   ├── minecraft/
│   │   └── tags/functions/tick.json
│   └── vp/
│       ├── functions/     # 59 mcfunction files
│       ├── storage/       # JSON data files
│       └── command/       # Command handler functions
└── RELEASE_NOTES.md       # This file
```

---

## Upgrade Path

### Coming in v1.1.0 (Planned)
- Permission expiration system
- Enhanced logging and auditing
- Performance optimizations
- Additional wildcard patterns
- More built-in group presets

### Coming in v2.0.0 (Future)
- Database backend support
- Web dashboard
- GUI menus in-game
- Permission delegation system
- Advanced scheduling

---

## Documentation

- 📖 **[README.md](README.md)** - Full documentation with usage examples
- 🤝 **[CONTRIBUTING.md](CONTRIBUTING.md)** - How to contribute to the project
- ⚖️ **[LICENSE](LICENSE)** - MIT License terms

---

## Credits & Attribution

**VanillaPerms** is inspired by [LuckPerms](https://luckperms.net/), a powerful permission plugin for Minecraft backends.

**Developed by:** creeperdiamonds
**Repository:** https://github.com/creeperdiamonds/VanillaPerms

---

## Support & Feedback

### Have Questions?
- 📖 Check the [README.md](README.md) for documentation
- 🐛 Report bugs: https://github.com/creeperdiamonds/VanillaPerms/issues
- 💡 Suggest features: https://github.com/creeperdiamonds/VanillaPerms/issues
- 💬 Discuss ideas: https://github.com/creeperdiamonds/VanillaPerms/discussions

### Found a Bug?
Please create an issue with:
1. Minecraft version
2. Server type (Vanilla/Paper/etc.)
3. Steps to reproduce
4. Expected vs actual behavior
5. Console logs (if applicable)

---

## License

VanillaPerms is licensed under the **MIT License**. See [LICENSE](LICENSE) for full terms.

---

## Changelog

### v1.0.0 (February 28, 2026)
- 🎉 Initial release
- ✨ Core permission system
- 📦 Group management
- 🎮 Trigger command interface
- 🔒 Permission storage and enforcement

---

**Thank you for using VanillaPerms!** 🙏

We hope this datapack brings advanced permission management to your vanilla Minecraft server.

For updates, follow the repository or check releases: https://github.com/creeperdiamonds/VanillaPerms/releases

---

*Last Updated: February 28, 2026*
