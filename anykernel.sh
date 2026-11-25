### AnyKernel3 Ramdisk Mod Script

properties() { '
kernel.string=LineageOS kernel + KernelSU-Next for Xiaomi Mi 10 (umi)
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=umi
device.name2=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

BLOCK=boot;
IS_SLOT_DEVICE=auto;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

. tools/ak3-core.sh;

# Replace only the kernel; keep LineageOS ramdisk and dtb untouched
split_boot;
flash_boot;
