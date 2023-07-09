vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO helynranta/imgui-node-editor
    REF 466436793d7ec69533790d18ae5334c336cf6b25
    SHA512 ea0e2bdbcc4caf17549628c7d5c49e865e11f77d6672086b3fcace1b7f29a52c3209daefc81e93357477d2bf6f1823733da60b57e47ec39e6a8a8b8887c129ee
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