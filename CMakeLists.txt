cmake_minimum_required(VERSION 2.8)

project(check_cuda_compute_capability)

set(CUDA_TOOLKIT_ROOT_DIR "/usr/local/cuda-10.0")
find_package(CUDA)

if(0) #You may need this dirty stuffs if CUDA<10.0
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
endif()

cuda_add_executable(report_sm
  src/check_cc.cpp
  src/drvapi_error_string.h
)
target_link_libraries(report_sm
  #cudart cudart_static #You may require these libs if CUDA<10.0
  cuda
)

