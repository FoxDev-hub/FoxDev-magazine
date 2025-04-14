# QB-Magazine

An interactive magazine system for FiveM servers using the QB-Core framework. Create, edit, and read digital magazines in-game with a modern and intuitive interface. Support for multiple editions and player-specific magazine ownership.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Version](https://img.shields.io/badge/version-1.1.0-green.svg)
![QB-Core](https://img.shields.io/badge/qb--core-latest-red)
![QBox](https://img.shields.io/badge/QBox-March%202025-purple)

## 🌟 Features

- **Interactive Reading Experience**
  - Smooth page-turning animations
  - Zoom functionality for detailed viewing
  - Keyboard and mouse navigation
  - Fade-in animations

- **Magazine Editor**
  - Multiple edition support
  - Add/remove pages per edition
  - Reorder pages via drag-and-drop
  - Image URL support
  - Real-time preview
  - Edition publishing system

- **Player Magazine System**
  - Player-specific magazine ownership
  - Edition tracking
  - Purchase history
  - OX Inventory integration

- **Database Integration**
  - Multiple edition support
  - Automatic page ordering
  - Player ownership tracking
  - Edition status management

## 📋 Requirements

- QB-Core Framework
- oxmysql
- ox_inventory
- FiveM Server
- QBox (March 2025 or newer)

## ⚙️ Installation

1. **Download & Place Files**
   ```bash
   cd resources
   git clone https://github.com/yourusername/qb-magazine
   ```

2. **Database Setup**
   The resource uses three main tables:
   - `magazine_editions`: Stores different magazine editions
   - `magazine_pages`: Stores pages for each edition

   Import the SQL file from `sql/magazine.sql` which will create all necessary tables and indexes.

3. **Add to Server.cfg**
   ```lua
   ensure ox_inventory  # Make sure this loads first
   ensure fd-magazine
   ```

4. **OX Inventory Setup**
   Add to your `ox_inventory/data/items.lua`:
   ```lua
   ['magazine'] = {
       label = 'Magazine',
       weight = 500,
       stack = false,
       close = false,
       description = 'A readable magazine',
       consume = 0,
       client = {
           export = 'fd-magazine.useMagazine'
       }
   }
   ```

## 🔧 Configuration

Edit `config.lua` to customize:

```lua
Config = {}

-- Jobs that can access the editor
Config.AuthorizedJobs = {
    ['news'] = true,
    ['admin'] = true
}

-- Item name in QB-Core shared items
Config.MagazineItem = 'magazine'


-- Image Settings
Config.MaxImageSize = 5 * 1024 * 1024  -- 5MB
Config.AllowedImageTypes = {
    'jpg',
    'jpeg',
    'png',
    'gif'
}
```

## 📱 Commands

- `/magazine` - Open owned magazine editions
- `/magazineeditor` - Open editor (authorized jobs only)
- `/createedition [title]` - Create new edition
- `/publishedition [number]` - Publish an edition

## 🎮 Usage

### Reading a Magazine
1. Purchase or receive a magazine edition
2. Use the magazine item from inventory
3. Navigate using:
   - Arrow keys (← →)
   - Mouse clicks on page corners
   - Navigation buttons
4. Press ESC to close

### Editing a Magazine
1. Use `/magazineeditor` command
2. Select or create an edition
3. Add pages via URL input
4. Drag & drop to reorder
5. Save changes
6. Publish when ready

### Managing Editions
1. Create new editions with `/createedition`
2. Add pages to specific editions
3. Set active status
4. Publish when ready
5. Track player ownership

## 🖼️ Image Guidelines

- **Recommended Format**: JPG/PNG
- **Optimal Resolution**: 1920x1080
- **Maximum File Size**: 5MB
- **Aspect Ratio**: 16:9 (recommended)

## 🔍 Troubleshooting

1. **Images Not Loading**
   - Verify URL is accessible
   - Check image format
   - Ensure URL is HTTPS

2. **Editor Not Opening**
   - Verify job permissions
   - Check server console for errors

3. **Database Issues**
   - Verify oxmysql is running
   - Check table relationships
   - Verify edition exists before adding pages

4. **Edition Access Issues**
   - Check if edition is published
   - Verify player ownership
   - Check edition status (active/inactive)

## 🛠️ Development

### Database Structure
```sql
magazine_editions
- id (AUTO_INCREMENT)
- edition_number (UNIQUE)
- title
- is_active
- is_published
- created_at

magazine_pages
- id (AUTO_INCREMENT)
- page_number
- image_url
- edition_number (FK)
- created_at

```

### File Structure
```
qb-magazine/
├── client/
│   └── main.lua
├── server/
│   └── main.lua
├── html/
│   ├── index.html
│   ├── style.css
│   └── script.js
├── sql/
│   └── magazine.sql
├── config.lua
└── fxmanifest.lua
```

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Support

- Discord: [Your Discord Server]
- GitHub Issues: [Repository Issues]
- Documentation: [Wiki Link]

## 🙏 Credits

- QB-Core Framework Team
- Turn.js Library
- FiveM Community

## 🔄 Updates

Check [CHANGELOG.md](CHANGELOG.md) for version history and updates.

---

Made with ❤️ for the FiveM Community 