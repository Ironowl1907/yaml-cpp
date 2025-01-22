project "yaml-cpp"
kind("StaticLib")
language("C++")

targetdir("bin/%{cfg.buildcfg}")
objdir("bin-int/%{cfg.buildcfg}/zirconium")

staticruntime("on")

-- libdirs { "bin/%{cfg.buildcfg}" }

-- defines {
--     "YAML_CPP_STATIC_DEFINE" }

files
{
    "src/**.h",
    "src/**.cpp",
    "include/**.h",
}

includedirs
{
    "include"
}

filter("system:linux")
pic("On")
systemversion("latest")

filter("system:macosx")
pic("On")

filter("system:windows")
systemversion("latest")

filter("configurations:Debug")
runtime("Debug")
symbols("on")

filter("configurations:Release")
runtime("Release")
optimize("speed")

filter("configurations:Dist")
runtime("Release")
optimize("speed")
symbols("off")
