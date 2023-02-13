vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lerppana/Hypodermic
    REF 1079b9c2dfcb9b45a6cd96b21ee552cc9304f5dc
    SHA512 bb698ae55894e3ab276e0a9147fc557bdf9c44fe47fd10545965889ae175f93ead5c096a01e210e65c8758f5956200a8b69b29a410175a6a5d04196d3a289033
    HEAD_REF v2
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)

# Put the license file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/hypodermic/)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/hypodermic/LICENSE ${CURRENT_PACKAGES_DIR}/share/hypodermic/copyright)