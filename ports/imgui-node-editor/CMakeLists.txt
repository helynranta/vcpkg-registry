cmake_minimum_required(VERSION 3.8)

project(imgui-node-editor CXX)

set(CMAKE_DEBUG_POSTFIX d)
include(CMakeFindDependencyMacro)
find_dependency(imgui CONFIG REQUIRED)

add_library(${PROJECT_NAME} "")
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

target_include_directories(
    ${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
)

target_sources(
    ${PROJECT_NAME}
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/crude_json.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_canvas.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_node_editor.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_node_editor_api.cpp
)

target_link_libraries(${PROJECT_NAME} PUBLIC imgui::imgui)
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_20)

install(
    TARGETS ${PROJECT_NAME}
    EXPORT ${PROJECT_NAME}_target
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)

install(
    FILES 
        ${CMAKE_CURRENT_SOURCE_DIR}/crude_json.h
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_bezier_math.h
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_bezier_math.inl
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_canvas.h
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_extra_math.h
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_extra_math.inl
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_node_editor.h
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_node_editor_internal.h
        ${CMAKE_CURRENT_SOURCE_DIR}/imgui_node_editor_internal.inl
    DESTINATION include)

install(
    EXPORT ${PROJECT_NAME}_target
    NAMESPACE ${PROJECT_NAME}::
    FILE ${PROJECT_NAME}-targets.cmake
    DESTINATION share/${PROJECT_NAME}
)