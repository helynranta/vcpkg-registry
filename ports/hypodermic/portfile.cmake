vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lerppana/Hypodermic
    REF 0e0d85d70aa2f2391dfd84f8af4a3863d4fb1611
    SHA512 6fc3f9eca034a4de3f7086bd51e9ba11ee31c8ec000a3e0bdfc06db1f3c12a89b66793adf5d219441e680541e26acaef72d21f9dd0acf3f5fee3aa12d3fb7b4d
    HEAD_REF master
)

set(HYPODERMIC_VERSION_MAJOR "2")
set(HYPODERMIC_VERSION_MINOR "5")
set(HYPODERMIC_VERSION_PATCH "0")
set(HYPODERMIC_VERSION
    "${HYPODERMIC_VERSION_MAJOR}.${HYPODERMIC_VERSION_MINOR}.${HYPODERMIC_VERSION_PATCH}"
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)

# Put the license file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/hypodermic/)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/hypodermic/LICENSE ${CURRENT_PACKAGES_DIR}/share/hypodermic/copyright)