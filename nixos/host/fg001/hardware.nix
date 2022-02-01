{ config, lib, pkgs, modulesPath, ... }:

{
	imports = [ "${modulesPath}/installer/scan/not-detected.nix" ];

	boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-intel" ];
	boot.extraModulePackages = [ ];

	fileSystems."/" = {
		device = "/dev/disk/by-label/NIXOS_MAIN";
		fsType = "ext4";
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-label/BOOT";
		fsType = "vfat";
	};

	swapDevices = [{
		device = "/dev/disk/by-label/NIXOS_SWAP";
	}];

	powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
