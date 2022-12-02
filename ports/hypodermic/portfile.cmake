vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ybainier/Hypodermic
    REF a9e1b5b86aa248f8e577d454227ee9fb0c570119
    SHA512 7bfc9db6bc8233a54f95f7f9abb020bdfeb4b5982f0927599ba392e6b0e09430d68778ca0a45612c5c2b3db492ac83a6542f9ebb4442fd9b5c0846f47386e1a0
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