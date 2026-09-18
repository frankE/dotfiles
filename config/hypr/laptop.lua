-- ~/.config/hypr/local.lua
-- Translated from the legacy local.conf (hyprlang) format.
-- Docs: https://wiki.hypr.land/Configuring/Basics/Monitors/

-- hyprlang $variables become plain Lua locals
local bigScreen   = "desc:BNQ BenQ EW3270U Y1K00197019"
local smallScreen = "desc:LG Electronics 24EA53"
local builtin     = "eDP-1"

-- monitor=NAME,RESOLUTION,POSITION,SCALE  ->  hl.monitor({ output, mode, position, scale })
hl.monitor({
    output   = "desc:Samsung Electric Company C49RG9x HNTR200541",
    mode     = "5120x1440",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = bigScreen,
    mode     = "preferred", -- was "prefferred" (typo) in the .conf
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = smallScreen,
    mode     = "preferred", -- was "prefferred" (typo) in the .conf
    position = "3840x540",
    scale    = 1,
})

hl.monitor({
    output   = builtin,
    mode     = "preferred", -- was "preffered" (typo) in the .conf
    position = "-1920x540",
    scale    = 1,
})

-- Catch-all for any monitor not matched above
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})
