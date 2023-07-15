--[[

	Struggling Artist Background for Merlord's Character Backgrounds.
    A MWSE-lua mod for Morrowind
    
    Note: This mod requires "Merlord's Character Backgrounds", "Skills Module", and "Joy of Painting"
           https://www.nexusmods.com/morrowind/mods/46795
           https://www.nexusmods.com/morrowind/mods/46034
           https://www.nexusmods.com/morrowind/mods/53036
  
	@version      v1.0
	@author       Lucevar
	@last-update  July 13, 2023

]]

-- get the current merBackgrounds data
local function getData()
    local data = tes3.player.data.merBackgrounds or {}
    return data
end

-- start the mod
local function onInit(e)
	local interop = require("mer.characterBackgrounds.interop")

	-- init struggling artist background
    local luceArtistBackground = {
        id = "luceArtist",
        name = "Struggling Artist",
        description = (
                      "You've always known that you have real artistic talent. But unfortunately " ..
                      "the rest of the world doesn't seem willing to acknowledge it yet. " ..
                      "New sketches and paintings come to you easily (+20 painting), but " ..
                      "selling enough of them to make a living has been a struggle " ..
                      "(-10 Mercantile, -5 Speechcraft, -5 personality)." 
    ),
        doOnce = function()
			mwscript.addItem({
				reference = tes3.player,
				item = "Misc_Inkwell",
				count = 2
			})
			mwscript.addItem({
				reference = tes3.player,
				item = "Misc_Quill",
				count = 1
			})
			mwscript.addItem({
				reference = tes3.player, 
				item = "sc_paper_plain",
				count = 10
			})
			tes3.modStatistic({
				reference = tes3.player,
				skill = tes3.skill.mercantile,
				value = -10
			})
			tes3.modStatistic({
				reference = tes3.player,
				skill = tes3.skill.speechcraft,
				value = -5
			})
			tes3.modStatistic({
				reference = tes3.player,
				attribute = tes3.attribute.personality,
				value = -5
			})
      end
    }
    interop.addBackground(luceArtistBackground)

end

event.register("initialized", onInit)