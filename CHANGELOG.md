# Changelog

All notable changes to VanillaPerms are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Planned for v1.1.0
- [ ] Permission expiration system (timed permissions)
- [ ] Enhanced audit logging
- [ ] Performance optimizations
- [ ] Additional wildcard patterns
- [ ] More built-in group presets
- [ ] Improved error messages
- [ ] Configuration validation

### Planned for v2.0.0
- [ ] Database backend support (MySQL/PostgreSQL)
- [ ] Web dashboard for management
- [ ] In-game GUI menus
- [ ] Permission delegation system
- [ ] Permission scheduling
- [ ] Group priority/weight system
- [ ] Cross-world permission syncing

---

## [1.0.0] - 2026-02-28

### Added
- ✨ **Initial Release** - Fully functional permission system
- 📦 **Group Management** - Create, manage, and organize player groups
- 🔒 **Permission System** - Add and remove permissions from groups
- 👥 **Player Assignment** - Assign players to groups with inheritance
- 🎮 **Trigger Interface** - Menu-driven management via `/trigger vp`
- 📊 **Scoreboard Integration** - Permission checking via scoreboards
- 💾 **Persistent Storage** - NBT-based data storage and retrieval
- 🏷️ **Built-in Groups** - Default, operator.lvl1, operator.lvl2, operator.lvl3, operator
- 🔄 **Reload System** - Hot-reload configuration without server restart
- 🎯 **Flag System** - Toggle features (ChatRank, DebugMode, MaintenanceMode)
- ♾️ **Bulk Operations** - Add/remove multiple permissions at once
- 🌍 **Full Vanilla Support** - Works on Minecraft 1.20+ with no plugins
- 📖 **Comprehensive Documentation** - README, CONTRIBUTING, and RELEASE_NOTES
- 🛡️ **MIT License** - Open source and freely usable

### Technical Details
- 59 mcfunction files
- 33 scoreboards for state management
- NBT storage in 4 namespaces (groups, players, temp, config)
- Zero performance impact when idle
- Compatible with Paper, Spigot, Fabric, and vanilla servers

---

## [0.0.1] - 2026-02-15

### Added (Development)
- Initial project structure and setup
- Core function implementations
- Data storage structure

---

## Version Legend

- **Added** - New features
- **Changed** - Changes in existing functionality
- **Deprecated** - Soon-to-be removed features
- **Removed** - Removed features
- **Fixed** - Bug fixes
- **Security** - Vulnerability fixes

---

## Release Strategy

### Semantic Versioning

VanillaPerms follows semantic versioning: `MAJOR.MINOR.PATCH`

- **MAJOR** - Breaking changes (data structure changes, incompatibilities)
- **MINOR** - New features (backward compatible)
- **PATCH** - Bug fixes (backward compatible)

### Release Schedule

- **Patch Releases** - As needed (bug fixes)
- **Minor Releases** - Every 2-4 weeks (new features)
- **Major Releases** - Annually or when necessary (major overhauls)

---

## How to Install Versions

### Latest Version (Recommended)
```bash
git clone https://github.com/creeperdiamonds/VanillaPerms.git
```

### Specific Version
```bash
git clone https://github.com/creeperdiamonds/VanillaPerms.git
git checkout v1.0.0
```

### From Release Page
Download from: https://github.com/creeperdiamonds/VanillaPerms/releases

---

## Support

For issues, questions, or feature requests:
- 🐛 **Report Bugs** - https://github.com/creeperdiamonds/VanillaPerms/issues
- 💡 **Request Features** - https://github.com/creeperdiamonds/VanillaPerms/issues
- 💬 **Discussions** - https://github.com/creeperdiamonds/VanillaPerms/discussions

---

## License

VanillaPerms is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

*Last Updated: February 28, 2026*
