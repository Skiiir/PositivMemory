QT += quick
 QT += quickcontrols2
QT += widgets
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    engine.cpp \
        main.cpp \
    memory.cpp \
    memorylist.cpp

RESOURCES += qml.qrc







# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    engine.h \
    memory.h \
    memorylist.h

DISTFILES += \
    ../build-MoodLifter-Android_f_r_armeabi_v7a_Clang_Qt_5_12_2_for_Android_ARMv7-Profile/android-build/AndroidManifest.xml \
    android/AndroidManifest.xml \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew \
    android/gradlew.bat \
    android/gradlew.bat \
    android/res/values/libs.xml \
    android/res/values/libs.xml \
    Calendar/DateUtils.js \
    Calendar/Datepicker.qmlproject \
    Calendar/.hg_archival.txt \
    Calendar/.hgignore \
    Calendar/Calendar.qml \
    Calendar/CalendarHeaderModel.qml \
    Calendar/CalendarModel.qml \
    Calendar/CalendarStyle.qml \
    Calendar/Datepicker.qml \
    Calendar/DateUtils.js \
    Calendar/Datepicker.qmlproject \
    Calendar/.hg_archival.txt \
    Calendar/.hgignore \
    Calendar/Calendar.qml \
    Calendar/CalendarHeaderModel.qml \
    Calendar/CalendarModel.qml \
    Calendar/CalendarStyle.qml \
    Calendar/Datepicker.qml

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
