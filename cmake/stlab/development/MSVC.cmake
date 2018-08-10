set( stlab_MSVC_base_flags /W4 /Wx )
set( stlab_MSVC_debug_flags )
set( stlab_MSVC_coverage_flags )
set( stlab_MSVC_release_flags )

string(CONCAT generator
  "${stlab_MSVC_base_flags}"
  "$<$<OR:$<CONFIG:DEBUG>,"
         "$<CONFIG:RELWITHDEBINFO>>:${stlab_MSVC_debug_flags}>"
  "$<$<OR:$<CONFIG:RELEASE>,"
         "$<CONFIG:RELWITHDEBINFO>,"
         "$<CONFIG:MINSIZEREL>>:${stlab_MSVC_release_flags}>"
  "$<$<AND:$<CONFIG:DEBUG>,"
          "$<BOOL:${stlab.coverage}>>:${stlab_MSVC_debug_flags}>")

target_compile_options(development INTERFACE
  $<$<CXX_COMPILER_ID:GNU>:${generator}>)

target_link_libraries(development INTERFACE
  $<$<CXX_COMPILER_ID:GNU>:${generator}>)
