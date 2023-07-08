vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO thedmd/imgui-node-editor
    REF 190757edab5acf419375e0798d675feeb6bc0f89
    SHA512 0722fe7f5c8f9f71651f91ef0b11fa1d54ec371311142ac0243e3ba56ee17e36f45b9b36c74d46520c9b19aff3a9415405d1ea4bb709fe4f53fb24ca269e5d8a
    HEAD_REF develop
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")
vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

# Put the license file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/imgui-node-editor/)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/imgui-node-editor/LICENSE ${CURRENT_PACKAGES_DIR}/share/imgui-node-editor/copyright)