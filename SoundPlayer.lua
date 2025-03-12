local soundType = {
    SOUND = 1,
    GAME_MUSIC = 2,
    CUSTOM = 3
}

local sounds = {
    ["murloc"] = {
        ["sound"] = 416,
        ["description"] = "Mglrlrlrlrlrlr!",
        ["type"] = soundType.SOUND
    },
    ["ding"] = {
        ["sound"] = 888,
        ["description"] = "Grats!",
        ["type"] = soundType.SOUND
    },
    ["main theme"] = {
        ["sound"] = "Sound\\Music\\GlueScreenMusic\\wow_main_theme.mp3",
        ["description"] = "Main theme song!",
        ["type"] = soundType.GAME_MUSIC
    },
    ["main theme"] = {
        ["sound"] = "Interface\\AddOns\\SoundPlayer\\Sounds\\custom.mp3",
        ["description"] = "Main theme song!",
        ["type"] = soundType.CUSTOM
    }
}


SLASH_SOUND1 = "/playsound"
SLASH_STOPSOUND1 = "/stopsound"

local function displaySoundList()
    print("-----------------------")
    for command in pairs(sounds) do
        local description = sounds[command].description
        print("Command: /playsounds " .. command .. " - Descritpion " .. description)
    end
    print("-----------------------")

end

local function playTrack(track)
    print(track.description)

    if (track.type == soundType.GAME_MUSIC) then
        PlayMusic(track.sound)

        print("To stop the music, type /stopsound")
    elseif(track.type == soundType.SOUND) then
        PlaySound(track.sound)
    elseif(track.type == soundType.CUSTOM)
        --play custom sound
    end

end

local function playSoundHandler(trackId)
    if (string.len(trackId) > 0) then
        local matchesKnownTrack = sounds[trackId] ~= nil -- true or false
        if (matchesKnownTrack) then
            local track = sounds[trackId]

            playTrack(track)
        end
    else
        displaySoundList()
    end
end

local function stopSoundHandler()
     
end

SlashCmdList["SOUND"] = playSoundHandler
SlashCmdList["STOPSOUND"] = playSoundHandler