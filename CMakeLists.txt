cmake_minimum_required(VERSION 3.10)

project(prg)

include(FindBISON)
find_package(BISON 3.8.2)
BISON_TARGET(parser parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.cpp
             DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser.hpp)



include(FindFLEX)
find_package(FLEX 2.6.4)
FLEX_TARGET(lexer lexer.l  ${CMAKE_CURRENT_BINARY_DIR}/lexer.cpp
			DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/lexer.hpp)
ADD_FLEX_BISON_DEPENDENCY(lexer parser)

find_package(LLVM REQUIRED CONFIG)


add_executable(prgFILE ${BISON_parser_OUTPUT_SOURCE} ${FLEX_lexer_OUTPUTS})



target_include_directories(prgFILE
	PRIVATE ${CMAKE_CURRENT_BINARY_DIR}
	${LLVM_INCLUDE_DIRS}
)
target_link_libraries(prgFILE ${FLEX_LIBRARIES} LLVM)