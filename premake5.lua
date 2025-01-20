project "yaml-cpp"
kind("StaticLib")
language("C++")

targetDir("bin/" .. outputdir .. "/%(prj.name)")
objDir("bin-int/" .. outputdir .. "/%(prj.name)")

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
