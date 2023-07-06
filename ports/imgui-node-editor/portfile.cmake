vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO thedmd/imgui-node-editor
    REF 99ec923a39062f556ec7676fb9ba6d302d109f76
    SHA512 aa978e47f058837be118851dd80264354047d7c34d463a4dbae62bf3660a78cd7a2216aa2a8e1d1a6597885473387bb9b21ea75cdd27805f782390d8deceb709
    HEAD_REF develop
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")
vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)

# Put the license file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/imgui-node-editor/)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/imgui-node-editor/LICENSE ${CURRENT_PACKAGES_DIR}/share/imgui-node-editor/copyright)