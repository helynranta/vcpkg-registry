vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO helynranta/imgui-node-editor
    REF af7fa51bb9d68c9b44477c341f13a7dadee3e359
    SHA512 5ee9f39df550c8b9cac2cfb5ec048732f68ed3f13f0f93feeee655b531d0127d5c255081600971fe3dc1d6df3f00bdb46ecc8cd6fbe2078c802cd8537139a737
    HEAD_REF master
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS_DEBUG
        -DIMGUI_NODE_EDITOR_SKIP_HEADERS=ON
)

vcpkg_cmake_install()

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(PACKAGE_NAME unofficial-${PORT} CONFIG_PATH share/unofficial-${PORT})

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
