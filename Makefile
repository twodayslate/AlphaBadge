THEOS_DEVICE_IP ?= 192.168.1.24
THEOS_DEVICE_PORT ?= 22

THEOS_PACKAGE_DIR_NAME = debs
TARGET := iphone:clang
ARCHS := armv7 arm64

include theos/makefiles/common.mk

TWEAK_NAME = AlphaBadge
AlphaBadge_FILES = Tweak.xm
AlphaBadge_ARCHS = armv7 arm64

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += badgepref

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
