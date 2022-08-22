return {
    settings = {
        gopls = {
            analyses = {unusedparams = true, unreachable = true},
            --  In DegradeClosed mode, gopls will collect less information about packages without open files. As a result, features like Find References and Rename will miss results in such packages.
            --  enum value: "Normal", "DegradeClosed"
            memoryMode = "DegradeClosed",
            buildFlags = {
                "-remote=auto", "-logfile=auto", "-debug=:0",
                "-remote.debug=:0", "-rpc.trace"
            },
            usePlaceholders = true,
            staticcheck = true
        }
    }
}
