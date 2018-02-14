TEMPLATE = app
TARGET = minibrowser

<<<<<<< HEAD
<<<<<<< HEAD
QT += qml quick webview\
=======
QT += qml quick webview sql\
>>>>>>> master
=======
QT += qml quick webview sql\
>>>>>>> master
    positioning core widgets

SOURCES += cpp/main.cpp \
    cpp/mycontext.cpp \
    cpp/utils.cpp \
    cpp/trek.cpp \
    cpp/gpspoint.cpp \
<<<<<<< HEAD
<<<<<<< HEAD
    cpp/filemanager.cpp
=======
    cpp/filemanager.cpp \
    cpp/user.cpp \
    cpp/photo.cpp
>>>>>>> master
=======
    cpp/filemanager.cpp \
    cpp/user.cpp \
    cpp/photo.cpp
>>>>>>> master

RESOURCES += qml.qrc

EXAMPLE_FILES += doc

macos:QMAKE_INFO_PLIST = macos/Info.plist
ios:QMAKE_INFO_PLIST = ios/Info.plist

target.path = $$[QT_INSTALL_EXAMPLES]/webview/minibrowser
INSTALLS += target

HEADERS += \
    cpp/mycontext.h \
    cpp/utils.h \
    cpp/trek.h \
    cpp/gpspoint.h \
<<<<<<< HEAD
<<<<<<< HEAD
    cpp/filemanager.h
=======
    cpp/filemanager.h \
    cpp/user.h \
    cpp/photo.h
>>>>>>> master
=======
    cpp/filemanager.h \
    cpp/user.h \
    cpp/photo.h
>>>>>>> master
