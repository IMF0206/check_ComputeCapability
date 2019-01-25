project(check_cuda_compute_capability)

# required cmake version
cmake_minimum_required(VERSION 2.8)

#set(CMAKE_CXX_STANDARD 11)

# packages
find_package(CUDA)


    if (CMAKE_SYSTEM_NAME MATCHES "Linux")
        set(CUDA_DIR "/usr/local/cuda")
        find_package(CUDA REQUIRED)
        include_directories("${CUDA_DIR}/include")
        link_directories("${CUDA_DIR}/lib64")
    elseif (CMAKE_SYSTEM_NAME MATCHES "Windows")
        set(CUDA_DIR "$ENV{CUDA_PATH}")
        find_package(CUDA REQUIRED)
        include_directories("${CUDA_DIR}/include")
        link_directories("${CUDA_DIR}/lib/x64")
    endif()


set(CURRENT_SOURCES src/check_cc.cpp)
set(CURRENT_HEADERS src/drvapi_error_string.h)


    cuda_add_executable(app ${CURRENT_HEADERS} ${CURRENT_SOURCES})
    target_link_libraries(app
        cudart
        cudart_static
        cuda
    )

