# Running CodeWalker on macOS (Apple Silicon / Intel)

This fork adds automated GitHub Actions CI builds and lightweight macOS support via Apple's Game Porting Toolkit / Wine (**Whisky**).

---

## Why This Setup?

CodeWalker is a Windows .NET Framework 4.8 application built on **WinForms**, **WPF**, and **SharpDX (Direct3D 11)**. Rather than running a heavyweight 30GB+ Windows virtual machine (like Parallels or VMware), this setup runs CodeWalker through **Whisky**:
- **Lightweight**: Uses Wine + DXVK / Apple Game Porting Toolkit to translate DirectX 11 into Apple Metal natively.
- **Zero VM Overhead**: Runs directly as macOS processes without virtualizing an entire operating system.
- **Automated**: One-click launcher script handles bottle creation and execution.

---

## Quick Start (3 Steps)

### 1. Pre-installed Environment
Whisky is already installed in `/Applications/Whisky.app` and configured with a `CodeWalker` bottle.

### 2. Download Pre-Compiled CodeWalker
Since CodeWalker requires Windows MSBuild to compile, pre-compiled binaries are generated automatically via GitHub Actions:
- **Download the latest build**: Check the [Releases](https://github.com/rpatty-dev/CodeWalker/releases) page on this fork, or download the official release from [GTA5-Mods](https://www.gta5-mods.com/tools/codewalker-gtav-interactive-3d-map).
- Extract `CodeWalker.exe` and its `Shaders/` folder into this repository root or into your `~/Downloads` folder.

### 3. Launch
Double-click:
```bash
CodeWalker (Mac).command
```
Or run from terminal:
```bash
./scripts/mac/launch.sh
```

---

## Pointing CodeWalker to GTA V on Mac

When CodeWalker launches for the first time, it prompts for the GTA V game folder:
- In Wine/Whisky, your Mac's filesystem is mapped to drive `Z:\`.
- Navigate to:
  ```text
  Z:\Users\<your-username>\...
  ```
  or your external drive under:
  ```text
  Z:\Volumes\<DriveName>\...
  ```
- Select the directory containing `gta5.exe`.

---

## Command Line Modes

All standard CodeWalker command line switches work through the launcher:
- Explorer mode (OpenIV alternative):
  ```bash
  ./scripts/mac/launch.sh explorer
  ```
- Menu mode:
  ```bash
  ./scripts/mac/launch.sh menu
  ```
- Project mode:
  ```bash
  ./scripts/mac/launch.sh project
  ```
- Vehicles mode:
  ```bash
  ./scripts/mac/launch.sh vehicles
  ```
- Peds mode:
  ```bash
  ./scripts/mac/launch.sh peds
  ```
