vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO helynranta/imgui-node-editor
    REF 12becd312a7fd94f96551507ddc26153c09cd5a6
    SHA512 259a1b5c77ab96b8f940ab43ba744a717c75b1f36fcbebabeb6975edbce21270304bab01dd9f571fe0906d4210d9eacb4af38300117b59c994c019b9cec4694f
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