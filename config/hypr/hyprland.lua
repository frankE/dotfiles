-- ~/.config/hypr/hyprland.lua
-- Translated from the legacy hyprland.conf (hyprlang) format.
-- Docs: https://wiki.hypr.land/Configuring/Start/

local mainMod = "SUPER"

-- `source = local.conf` has no direct equivalent: Lua configs pull in other
-- Lua chunks with require(). Convert local.conf to local.lua, then:
require("local")

-------------------
---- AUTOSTART ----
-------------------
-- `exec-once` becomes a one-shot handler on the startup event.
-- hl.exec_cmd() spawns asynchronously, so no trailing `&` is needed.
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland.service")
    hl.exec_cmd("waybar")
    hl.exec_cmd("udiskie") -- Automounter for removable media
    hl.exec_cmd("hypridle")
    hl.exec_cmd("mako")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 13,
        border_size = 2,
        col = {
            -- gradients are now a table of colors plus an angle
            active_border = { colors = { "rgba(3333eeee)", "rgba(001199ee)" }, angle = 135 },
            inactive_border = "rgba(595959aa)",
        },
        layout = "dwindle",
        -- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before turning this on
        allow_tearing = false,
    },

    xwayland = {
        -- force_zero_scaling = true,
    },

    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
        },
        -- drop_shadow/shadow_* were folded into a shadow sub-table:
        -- shadow = {
        --     enabled = true,
        --     range = 4,
        --     render_power = 3,
        --     color = 0xee1a1a1a,
        -- },
    },

    animations = {
        enabled = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0, -- Set to 0 to disable the anime mascot wallpapers
    },

    input = {
        kb_layout = "us",
        kb_variant = "altgr-intl",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 2,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

-- Gestures are their own call now, not a config section:
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Example per-device config
-- hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

--------------------
---- ANIMATIONS ----
--------------------
-- `bezier = name, x1, y1, x2, y2` -> hl.curve() with control points as pairs.
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- `animation = leaf, enabled, speed, curve[, style]` -> hl.animation()
hl.animation({ leaf = "windows",     enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "default" })

----------------------
---- WINDOW RULES ----
----------------------
-- Your commented-out flameshot rule, in the new shape:
-- hl.window_rule({
--     name = "flameshot",
--     match = { class = "^(flameshot)$" },
--     float = true,
--     no_anim = true,
--     pin = true,
--     fullscreen = true,
--     move = "0 0",
--     -- monitor = 1,  -- set to your leftmost monitor
-- })

---------------------
---- KEYBINDINGS ----
---------------------

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))

hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("~/.config/hypr/home.sh"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/hypr/format_dev_home.sh"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("~/.config/hypr/move_workspaces.sh"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(
    'rofi -show combi -modes combi -combi-modes "drun,window,run" -show-icons'))

hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + ESCAPE", hl.dsp.exit())
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + S", hl.dsp.group.toggle())
hl.bind(mainMod .. " + N", hl.dsp.group.next())

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- workspace 10 sits on key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Resize the active window (relative = true keeps the old delta semantics)
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = 10,  y = 0,   relative = true }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x = -10, y = 0,   relative = true }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0,   y = 10,  relative = true }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0,   y = -10, relative = true }))

-- Relative workspace switching / moving
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ workspace = "r+1" }))

-- Move the window itself around the layout
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ direction = "left" }))

hl.bind("ALT + TAB", hl.dsp.window.cycle_next())

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + G", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging (old `bindm`)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
