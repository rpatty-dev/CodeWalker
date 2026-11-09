# CodeWalker for macOS

The simplest and most lightweight way to run [CodeWalker](https://github.com/dexyfex/CodeWalker) (GTA V 3D Map Editor & RPF Explorer) on macOS (Apple Silicon & Intel) without installing a heavyweight 30GB+ Windows virtual machine.

---

## 🚀 Quick Start (3 Steps)

### Step 1: Open Whisky
[Whisky](https://getwhisky.app) is the lightweight Wine + Apple Game Porting Toolkit translation layer:
- Open **Whisky** from your `/Applications` folder (or terminal: `open -a Whisky`).
- If prompted on first launch, allow it to complete the automatic setup.
- You will see the pre-configured **`CodeWalker`** bottle ready.

### Step 2: Pre-Compiled CodeWalker
The latest pre-compiled build (`v30_dev46`) is already extracted and ready in:
```text
CodeWalker/app/CodeWalker30_dev46/
```
*(If setting up on a new machine, download from [GTA5-Mods](https://www.gta5-mods.com/tools/codewalker-gtav-interactive-3d-map) and place inside `app/`)*.

### Step 3: Launch
Double-click:
```bash
CodeWalker (Mac).command
```
Or run from Terminal:
```bash
cd ~/CodeWalker && ./scripts/mac/launch.sh
```

---

## 🎮 Game Files Setup (Without Downloading 110 GB)

CodeWalker expects a GTA V folder structure. If you don't have GTA V installed on your Mac:

### 1. Minimal Folder Bypass
Create a lightweight dummy folder:
```bash
mkdir -p ~/GTA5_Min
touch ~/GTA5_Min/gta5.exe
```
When CodeWalker prompts for your GTA 5 folder on first launch, navigate to `Z:\Users\<your-username>\GTA5_Min`.

### 2. What files to copy from your Home PC:
- **For Mod / Archive Editing (RPF Explorer)**:
  - Copy `common.rpf` (~28 MB) from your home PC into `~/GTA5_Min`.
  - You can open, view, edit, and export any `.ymap`, `.ytyp`, `.ydr`, or `.rpf` mod files.
- **For Full 3D World Map View**:
  - Copy `common.rpf`, `update/update.rpf`, and the map archives (`x64a.rpf` through `x64w.rpf`) from your home PC.

---

## 🌐 Alternatives (Zero Disk Space on Mac)

1. **Remote Streaming via Parsec (Best Performance)**:
   - Run CodeWalker directly on your home Windows PC where GTA V is already installed.
   - Connect from your Mac using **Parsec** (`/Applications/Parsec.app`) for smooth 60 FPS, full GPU acceleration, and 0 GB copied.

2. **Browser 3D Viewers**:
   - [noclip.website](https://noclip.website) — Free WebGL 3D game map explorer in your browser.
   - [gta-5-map.com](https://gta-5-map.com) / [gtalens.com](https://gtalens.com) — Interactive maps with satellite/road views.

---

## 🛠️ App Modes

You can launch specific tools directly:
```bash
./scripts/mac/launch.sh explorer   # OpenIV-style RPF Archive Explorer
./scripts/mac/launch.sh menu       # Main menu mode
./scripts/mac/launch.sh project    # Project map editor
./scripts/mac/launch.sh vehicles   # Vehicle viewer
./scripts/mac/launch.sh peds       # Ped viewer
```
