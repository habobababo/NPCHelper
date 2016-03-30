HelperNPC = {} -- Do not edit this line
HelperNPC.Text = {} -- Do not edit this line
HelperNPC.ButtonMat = {}
HelperNPC.Link = {}
HelperNPC.Title = "Title" -- Title of the derma panel
HelperNPC.TitleOverhead = "Title" -- Title that floats over the NPC's head
HelperNPC.Sites = 4 -- For each site you need a HelperNPC.Text[*sitenumber*] = [[TEXT]]

HelperNPC.Buttons = 2

HelperNPC.ButtonMat[1] = "materials/core/home.png" -- 32x32 png to your Homepage Icon
HelperNPC.ButtonMat[2] = "materials/core/dl.png" --	32x32 png to your download Icon


HelperNPC.Logo = "materials/core/watermark.png" -- Logo for the Background. Leave it empty <""> if no logo
HelperNPC.LogoX = 400 -- X size of the Logo (X, Y). This is horizontal.
HelperNPC.LogoY = 400 -- Y size of the Logo (X, Y). This is vertical.
HelperNPC.Rulespage = "" -- URL of your rules. Leave empty for nothing.

HelperNPC.NPCModel = "models/gman.mdl" -- Model of the NPC.

--[[--------
The following are like different pages of your derma panel. Change to your liking, add another for each site.

Each site, by default, are multi-line string values. You could change the brackets to quotes. But if you do this, it is only a single-line string value.
]]----------
HelperNPC.Text[1] = [[Text
(site 1)]]
HelperNPC.Text[2] = [[Text
(site 2)]]
HelperNPC.Text[3] = [[Text
(site 3)]]
HelperNPC.Text[4] = [[Text
(site 4)]]

HelperNPC.Link[1] = "http://core-community.de/forum/" -- URL of your website.
HelperNPC.Link[2] = "http://steamcommunity.com/sharedfiles/filedetails/?id=651738867" -- URL of your Workshop Content

-- Make the players download the materials. This is best left alone.

if SERVER then
	resource.AddFile("materials/core/close.png")
	for i = 1, HelperNPC.Buttons do
		resource.AddFile(HelperNPC.ButtonMat[i])
	end
end
