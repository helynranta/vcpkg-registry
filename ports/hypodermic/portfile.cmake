vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lerppana/Hypodermic
    REF a70c084b915be5af6ca0867a4fe04749e09ac136
    SHA512 eef45472b305c3623b84c0264b2c3a59de52cab6dd0081eebaabfcfaabb5a7a2528dbf20d4b97ef97ed67b8b89614d0cd567cb777536797dee9df6a5dd6b4507
    HEAD_REF master
)

set(HYPODERMIC_VERSION_MAJOR "2")
set(HYPODERMIC_VERSION_MINOR "5")
set(HYPODERMIC_VERSION_PATCH "2")
set(HYPODERMIC_VERSION
    "${HYPODERMIC_VERSION_MAJOR}.${HYPODERMIC_VERSION_MINOR}.${HYPODERMIC_VERSION_PATCH}"
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)

# Put the license file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/hypodermic/)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/hypodermic/LICENSE ${CURRENT_PACKAGES_DIR}/share/hypodermic/copyright)