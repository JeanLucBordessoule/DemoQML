cmake_minimum_required(VERSION 3.16)

project(DemoQML VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
# required when using a .qrc. (New File > Qt > Qt resource File). Must be before "qt_add_qml_module"
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appDemoQML
    main.cpp
)

qt_add_qml_module(appDemoQML
    URI DemoQML
    VERSION 1.0
    QML_FILES Main.qml
    RESOURCES resource.qrc
    QML_FILES MainPage1.qml
    QML_FILES MainPage2.qml
    QML_FILES MainPage3.qml
    QML_FILES Chap02_01.qml
    QML_FILES Chap09_01.qml
    RESOURCES README.md
    RESOURCES test.md
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appDemoQML PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appDemoQML
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appDemoQML
    PRIVATE Qt6::Quick Qt6::QuickControls2
)


include(GNUInstallDirs)
install(TARGETS appDemoQML
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
