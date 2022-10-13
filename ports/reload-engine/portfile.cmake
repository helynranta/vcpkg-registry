vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

if (NOT DEFINED ENV{GITHUB_AUTHORIZATION_TOKEN})
    message(FATAL_ERROR "environment variable GITHUB_AUTHORIZATION_TOKEN must be defined")
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lerppana/reload-engine
    REF v0.0.145
    SHA512 2051def1e7a534495afd0cb58d81234d00a089e79fe14310f85bf9a35278508758646e6277e7abcd130ebde5aa865c5ca7c714e7709b7137180a244c7270eb8b
    HEAD_REF master
    AUTHORIZATION_TOKEN $ENV{GITHUB_AUTHORIZATION_TOKEN}
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES "editor"    ENGINE_ENABLE_EDITOR)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        ${FEATURE_OPTIONS}
        -DENGINE_ENABLE_SAMPLES=OFF
        -DENGINE_ENABLE_TESTS=OFF
        -DENGINE_ENABLE_TOOLS=ON
)

file(INSTALL
        "${SOURCE_PATH}/.cmake/date_to_version.cmake"
        "${SOURCE_PATH}/.cmake/engine_create.cmake"
        "${SOURCE_PATH}/.cmake/engine_create_launcher.cmake"
        "${SOURCE_PATH}/.cmake/engine_create_plugin.cmake"
        "${SOURCE_PATH}/.cmake/FindVulkan.cmake"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/engine")

vcpkg_cmake_install(ADD_BIN_TO_PATH)

vcpkg_cmake_config_fixup(
        PACKAGE_NAME engine
        CONFIG_PATH "share/cmake/engine"
        TOOLS_PATH ${CURRENT_PACKAGES_DIR}/tools/engine)

vcpkg_copy_tools(TOOL_NAMES
        launcher reflection resource_compiler resource_compressor asset0.data gltf2_export.py
        DESTINATION ${CURRENT_PACKAGES_DIR}/tools/engine
        AUTO_CLEAN)

vcpkg_add_to_path("${CURRENT_PACKAGES_DIR}/share/engine")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")