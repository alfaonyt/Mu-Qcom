##
#
#  Copyright (c) 2011 - 2022, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2020, Intel Corporation. All rights reserved.
#  Copyright (c) 2018, Bingxing Wang. All rights reserved.
#  Copyright (c) Microsoft Corporation.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = kebab
  PLATFORM_GUID                  = B8DF34E2-F093-45ED-A3EF-F2BDC4128DAA
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/kebabPkg
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = RELEASE|DEBUG
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = kebabPkg/kebab.fdf
  USE_DISPLAYDXE                 = 0
  AB_SLOT_SUPPORT                = 1

  # 0 = SM8250
  # 1 = SM8250-AB
  # 2 = SM8250-AC
  SOC_TYPE                       = 0

[BuildOptions]
  *_*_*_CC_FLAGS = -DSOC_TYPE=$(SOC_TYPE)

[LibraryClasses]
  DeviceMemoryMapLib|kebabPkg/Library/DeviceMemoryMapLib/DeviceMemoryMapLib.inf
  DeviceConfigurationMapLib|kebabPkg/Library/DeviceConfigurationMapLib/DeviceConfigurationMapLib.inf

[PcdsFixedAtBuild]
  # DDR Start Address
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000

  # Device Maintainer
  gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVendor|L"No Maintainer"

  # CPU Vector Address
  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x9FF8C000

  # UEFI Stack Addresses
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x9FF90000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000

  # SmBios
  gQcomPkgTokenSpaceGuid.PcdSmbiosSystemVendor|"OnePlus Technology Co., Ltd."
  gQcomPkgTokenSpaceGuid.PcdSmbiosSystemModel|"8T"
  gQcomPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|"kebab"
  gQcomPkgTokenSpaceGuid.PcdSmbiosSystemRetailSku|"8T_kebab"
  gQcomPkgTokenSpaceGuid.PcdSmbiosBoardModel|"8T"

  # Simple FrameBuffer
  gQcomPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2400
  gQcomPkgTokenSpaceGuid.PcdMipiFrameBufferColorDepth|32

  # Dynamic RAM Start Address
  gQcomPkgTokenSpaceGuid.PcdRamPartitionBase|0xB4500000

  # SD Card Slot
  gQcomPkgTokenSpaceGuid.PcdSDCardSlotPresent|FALSE
  
  # USB Controller
  gQcomPkgTokenSpaceGuid.PcdStartUsbController|TRUE

[PcdsDynamicDefault]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|2400
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|2400
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|135
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|126
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutColumn|135
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutRow|126

!include SM8250Pkg/SM8250Pkg.dsc.inc
