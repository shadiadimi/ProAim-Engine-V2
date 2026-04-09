cmake_minimum_required(VERSION 3.10.2)

project(physics_engine VERSION 1.0.0 LANGUAGES CXX)

add_library(physics_engine SHARED
    physics_engine.cpp
)

set_target_properties(physics_engine PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/out"
)

# Future: Add OpenCV and TensorFlow Lite dependencies here
# find_package(OpenCV REQUIRED)
# include_directories(${OpenCV_INCLUDE_DIRS})
# target_link_libraries(physics_engine ${OpenCV_LIBS})
