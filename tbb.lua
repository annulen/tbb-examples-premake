
local TbbDir = "/media/sda5/bin/tbb40_20120201oss"
local TbbInclude = path.join(TbbDir, "include")
local TbbLib =  path.join(TbbDir, "lib/ia32/cc4.1.0_libc2.4_kernel2.6.16.21")


local function useTBB(cfg)
    table.insert(cfg.includedirs, TbbInclude)
    table.insert(cfg.libdirs, TbbLib)
    table.insert(cfg.links, "tbb") 
end


newaction {
    trigger= "tbb",
    isinternal = true,
    onproject = function(prj)
        local cc = premake.gettool(prj)
        local platforms = premake.filterplatforms(prj.solution, cc.platforms, "Native")
        for _, platform in ipairs(platforms) do
            for cfg in premake.eachconfig(prj, platform) do
                for _, use in ipairs(cfg.uses) do
                    if use:lower() == "tbb" then
                        useTBB(cfg)
                    end
                end
            end
        end
    end
}

premake.action.adddependency("*", "tbb")
