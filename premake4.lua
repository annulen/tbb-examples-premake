
    require "tbb"
_ACTION = _ACTION or "gmake"

newoption {
    trigger = "to",
    value = "path",
    description = "Set the output location for the generated files"
}

solution "TBBExamples"
    configurations { "Debug", "Release" }
    language "C++"
    location ( _OPTIONS["to"] )
    targetdir ( _OPTIONS["to"] )
    configuration "Debug"
       flags "Symbols"
    configuration "Release"
       defines "NDEBUG"
       flags "Optimize"
    
    include "parallel_for"
