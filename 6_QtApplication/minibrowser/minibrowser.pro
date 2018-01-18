TEMPLATE = app
TARGET = minibrowser

QT += qml quick webview \
    positioning core widgets

SOURCES += main.cpp \
    mycontext.cpp \
    utils.cpp \
    trek.cpp \
    gpspoint.cpp \
    filemanager.cpp

RESOURCES += qml.qrc

EXAMPLE_FILES += doc

macos:QMAKE_INFO_PLIST = macos/Info.plist
ios:QMAKE_INFO_PLIST = ios/Info.plist

target.path = $$[QT_INSTALL_EXAMPLES]/webview/minibrowser
INSTALLS += target

HEADERS += \
    mycontext.h \
    utils.h \
    trek.h \
    gpspoint.h \
    filemanager.h
