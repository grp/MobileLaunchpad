include theos/makefiles/common.mk

export GO_EASY_ON_ME=1

APPLICATION_NAME = MobileLaunchpad
MobileLaunchpad_FILES = $(wildcard *.m) 
MobileLaunchpad_FRAMEWORKS = UIKit QuartzCore IOKit CoreGraphics Foundation CoreFoundation
MobileLaunchpad_PRIVATE_FRAMEWORKS = GraphicsServices IOSurface ImageIO
MobileLaunchpad_OBJCFLAGS = -include MobileLaunchpad-Prefix.pch -std=c99
MobileLaunchpad_INSTALL_PATH = /var/root/mobilex/

include $(THEOS_MAKE_PATH)/application.mk
