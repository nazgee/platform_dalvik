if(NOT DX_JAR)
    message(FATAL_ERROR "DX_JAR not set. Could not find dx.jar")
endif()

function(add_dex _TARGET)
    add_jar(${_TARGET} SOURCES ${ARGN})
    add_custom_command(
        OUTPUT ${_TARGET}-dex.jar
        COMMAND ${Java_JAVA_EXECUTABLE} -jar ${DX_JAR} --dex --output=${_TARGET}-dex.jar ${_TARGET}.jar
        DEPENDS ${_TARGET}.jar ${DX_JAR}
        COMMENT "Building Java objects for ${_TARGET}-dex.jar"
    )
    add_custom_target(${_TARGET}.dex ALL DEPENDS ${_TARGET}-dex.jar)
endfunction()
