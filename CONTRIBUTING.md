# Contributing to VanillaPerms

Thank you for your interest in contributing to VanillaPerms! This document provides guidelines and instructions for contributing to the project.

## How to Contribute

### 1. Report Bugs

Found a bug? Please report it by opening an issue with:

- **Clear title** - Describe the issue concisely
- **Steps to reproduce** - Exact steps that trigger the bug
- **Expected outcome** - What should happen
- **Actual outcome** - What actually happened
- **Minecraft version** - Which version you're using (1.20+?)
- **Server type** - Vanilla, Paper, Spigot, Fabric, etc.
- **Logs/screenshots** - Include relevant output or images

**Example:**
```
Title: "Groups not displaying in tab list"

Steps:
1. Create group "admin"
2. Join group "admin"
3. Login to server
4. Open player tab list

Expected: Admin group shows in player name prefix
Actual: Tab list shows default group, admin prefix missing
Version: 1.20.1
Server: Paper

Logs: [paste relevant console output]
```

### 2. Suggest Features

Have an idea for a new feature? Open an issue with:

- **Feature description** - What should it do?
- **Use case** - Why is this needed?
- **Implementation ideas** - How might it work? (optional)
- **Examples** - Show how it would be used

**Example:**
```
Title: "Add permission wildcards for hierarchy"

Description:
Currently, wildcards only work with * for everything. 
We need hierarchical wildcards like:
- admin.command.*
- admin.flag.display.*
- moderation.warn.*

Use case: 
Groups with partial admin permissions without full server access.

Example:
/trigger vp set 3
> admin.command.* (grants all admin.command.X permissions)
> moderation.* (grants all moderation.X permissions)
```

### 3. Submit Code Changes

#### Prerequisites

- Git installed and configured
- Minecraft datapack knowledge (mcfunction files)
- Understanding of NBT data manipulation
- Familiarity with the VanillaPerms codebase

#### Development Workflow

**Step 1: Fork and Clone**
```bash
git clone https://github.com/creeperdiamonds/VanillaPerms.git
cd VanillaPerms
git checkout development
```

**Step 2: Create a Feature Branch**
```bash
git checkout -b feature/your-feature-name
```

Use descriptive branch names:
- `feature/permission-wildcards`
- `fix/scoreboard-reset-bug`
- `docs/update-examples`
- `refactor/player-lookup`

**Step 3: Make Your Changes**

See "Code Style Guidelines" below.

**Step 4: Test Thoroughly**

- Test in a vanilla 1.20+ server
- Verify existing functionality still works
- Test edge cases (empty groups, special characters, etc.)
- Check the `/reload` command still works
- Verify all scoreboards are created properly

**Step 5: Commit with Clear Messages**

```bash
git add .
git commit -m "Add permission wildcards for hierarchical permissions

- Implement wildcard matching for dot-notation permissions
- Add tests for wildcard matching logic
- Update README with wildcard examples
- Closes #42"
```

Format: `Imperative mood, brief description. Longer explanation if needed.`

**Step 6: Push and Create Pull Request**

```bash
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub with:
- Clear description of changes
- Link to related issues
- Screenshots/examples if applicable
- Testing notes

---

## Code Style Guidelines

### MCFunction Files

#### Naming Conventions

- Filenames: `snake_case` (e.g., `find_player_loop.mcfunction`)
- Internal variables: `vp_variable_name` (prefixed with `vp_`)
- Scoreboards: `vp_ObjectiveName` (prefixed with `vp_`)
- Storage paths: `vp:namespace` (prefixed with `vp:`)

#### Comments

```mcfunction
# Section Header for logical blocks
# This explains what the function does

# Brief explanation for complex logic
execute if score @s vp_found matches 0 run ...

# Comment the "why" not the "what"
# Bad: "Set score to 1"
# Good: "Mark as processed to avoid duplicate entries"
```

#### Formatting

```mcfunction
# Keep lines readable (aim for < 100 characters)
# Bad: execute if score @s vp_rebuild_loop = @s vp_found_index run execute if data storage vp:temp {action:"permission_remove"} run function vp:very_long_function_name
# Good: execute if score @s vp_rebuild_loop = @s vp_found_index run \
#   execute if data storage vp:temp {action:"permission_remove"} run \
#   function vp:some_function

# Spacing around logical sections
# [blank line between sections]
```

#### Best Practices

1. **Use early returns** to avoid deep nesting:
```mcfunction
# Good: Early return for error conditions
execute unless data storage vp:temp arg run return run tellraw @s "Error: No argument"

# Bad: Deep nesting
execute if data storage vp:temp arg run \
  execute if data storage vp:groups groups run ...
```

2. **Avoid "run block" syntax** - Not valid in mcfunction:
```mcfunction
# Invalid:
execute if condition run block { 
  data modify ...
  scoreboard ...
end

# Valid: Use separate execute commands
execute if condition run data modify ...
execute if condition run scoreboard ...
```

3. **Clear NBT comparisons**:
```mcfunction
# Good: Use proper NBT path syntax
execute if data storage vp:temp workingFlags{AllowExecute:true} run ...

# Bad: Invalid dot notation with bytes
execute if data storage vp:temp workingFlags.AllowExecute 1b run ...
```

4. **Scoreboard declarations**: Always ensure scoreboards are created in `reload_config.mcfunction`:
```mcfunction
scoreboard objectives add vp_my_new_scoreboard dummy
```

5. **Documentation**: Add comments to new functions explaining:
   - What the function does
   - What data it expects
   - What it modifies
   - Return behavior

```mcfunction
# find_player.mcfunction
# Searches for a player in vp:players storage by UUID
# Expects: vp:temp player_uuid (UUID array or string to find)
# Sets: vp:temp find_player_temp (temporary search data)
# Modifies: vp_found (1 if found, 0 if not), vp_found_index (array index if found)

# Begin search...
```

---

## Testing Checklist

Before submitting a PR, verify:

- [ ] Datapack loads without errors (`/datapack list enabled`)
- [ ] No compile errors in all `.mcfunction` files
- [ ] `/reload` command works
- [ ] `/function vp:setup` completes successfully
- [ ] `/function vp:reload_config` resets state properly
- [ ] Created groups persist after reload
- [ ] Player group assignments persist after reload
- [ ] Permissions are enforced correctly
- [ ] No scoreboard conflicts with other datapacks
- [ ] Performance is acceptable (no lag spikes)
- [ ] Tested on vanilla 1.20+

---

## Pull Request Process

1. **Fork the repository** on GitHub
2. **Create feature branch** from `development`
3. **Make changes** following code style guidelines
4. **Test thoroughly** using the checklist above
5. **Push to your fork**
6. **Create Pull Request** with:
   - Clear description
   - Link to related issues
   - Test results
   - Screenshots (if applicable)
7. **Address review comments** - We'll provide feedback
8. **Merge** after approval by maintainers

---

## Development Setup

### Quick Start

```bash
# Clone the repo
git clone https://github.com/creeperdiamonds/VanillaPerms.git

# Navigate to project
cd VanillaPerms
cd ...

# Test in your server:
# 1. Copy to your server's datapacks folder
# 2. Start server
# 3. Run: /function vp:setup
```

### Project Structure

```
VanillaPerms/
├── data/vp/functions/
│   ├── command/          # Trigger and command handling
│   ├── util/             # Utility functions
│   ├── zz_*.mcfunction   # Internal functions (zz_ prefix = internal)
│   └── [main functions]  # Public-facing functions
├── data/vp/storage/
│   ├── config.json       # System configuration
│   ├── groups.json       # Stored group data
│   ├── players.json      # Player group memberships
│   └── temp.json         # Temporary data during execution
└── data/minecraft/tags/functions/
    └── tick.json         # Tick loop registration
```

---

## Community

- **Report Issues** - Use GitHub Issues for bugs and feature requests
- **Discussions** - Use GitHub Discussions for general questions
- **Contact** - Open an issue for feature discussion

---

## License

By contributing to VanillaPerms, you agree that your contributions will be licensed under the MIT License.

---

## Appreciation

Thank you for making VanillaPerms better! Every contribution, no matter how small, is appreciated.

🙏 ***Happy coding!***