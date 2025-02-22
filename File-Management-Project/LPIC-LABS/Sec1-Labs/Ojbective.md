


# Linux Hardware and Peripheral Management Hands-On Lab

## Overview
This hands-on lab will guide you through managing hardware peripherals in Linux, identifying storage devices, and using system utilities to gather hardware information. You'll work with various tools to inspect and manipulate hardware components, understand system directories, and interact with system buses.

## Prerequisites
- A Linux system (physical or virtual)
- Root or sudo privileges
- Basic knowledge of the Linux command line

## Key Knowledge Areas Covered
- Enabling and disabling integrated peripherals
- Differentiating between mass storage devices
- Determining hardware resources for devices
- Using tools like `lsusb`, `lspci`, `modprobe`, etc.
- Understanding `sysfs`, `udev`, and `dbus`

## Tools and Utilities Used
- `/sys/`, `/proc/`, `/dev/` (System directories)
- `modprobe`
- `lsmod`
- `lspci`
- `lsusb`

## Workflow

### Step 1: Identify PCI Devices
Use the `lspci` command to list PCI devices and their associated drivers.
```bash
lspci -v
```
To filter for a specific device (e.g., network adapter):
```bash
lspci | grep -i network
```

### Step 2: Identify USB Devices
List connected USB devices:
```bash
lsusb
```
For detailed information:
```bash
lsusb -v
```

### Step 3: Inspect Loaded Kernel Modules
To check currently loaded kernel modules:
```bash
lsmod
```
To filter for a specific module:
```bash
lsmod | grep usb
```

### Step 4: Load and Unload Kernel Modules
Load a kernel module manually:
```bash
sudo modprobe <module_name>
```
Unload a kernel module:
```bash
sudo modprobe -r <module_name>
```
To check if the module is loaded:
```bash
dmesg | tail
```

### Step 5: Inspect System Files for Hardware Information
Check CPU information:
```bash
cat /proc/cpuinfo
```
Check memory details:
```bash
cat /proc/meminfo
```
List storage devices:
```bash
lsblk
```

### Step 6: Explore Sysfs for Device Information
Find device-related files in `/sys/`:
```bash
ls /sys/class/
```
Check block devices:
```bash
ls /sys/block/
```
Get details of a specific device:
```bash
cat /sys/block/sda/device/model
```

### Step 7: Monitor and Interact with udev
List current udev rules:
```bash
ls /etc/udev/rules.d/
```
Trigger udev to recognize a new device:
```bash
sudo udevadm trigger
```
Monitor hardware changes in real-time:
```bash
udevadm monitor --kernel --property
```

### Step 8: Interacting with dbus
List system services managed by dbus:
```bash
dbus-send --system --print-reply --dest=org.freedesktop.DBus /org/freedesktop/DBus org.freedesktop.DBus.ListNames
```

### Step 9: Enable and Disable Peripherals
Disable a USB device:
```bash
echo '0' | sudo tee /sys/bus/usb/devices/usbX/authorized
```
Enable the USB device again:
```bash
echo '1' | sudo tee /sys/bus/usb/devices/usbX/authorized
```

## Expected Outcome
After completing this lab, you will have practical experience in:
- Listing and inspecting hardware components.
- Managing kernel modules.
- Understanding system files that provide hardware details.
- Using `udev` and `dbus` for device management.
- Enabling and disabling peripherals.

## Next Steps
- Experiment with creating custom `udev` rules to trigger actions on device connection.
- Investigate more detailed `dbus` interactions for hardware event monitoring.
- Explore automating hardware monitoring and logging using shell scripts.

## Contributing
Feel free to contribute by adding more advanced use cases, scripts, or automation techniques.

## License
This project is open-source under the MIT License.

