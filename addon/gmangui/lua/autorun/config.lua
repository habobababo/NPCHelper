HelperNPC = {} -- Do not edit this line
HelperNPC.Text = {} -- Do not edit this line

HelperNPC.Title = "Title" -- Title of the derma panel
HelperNPC.TitleOverhead = "Title" -- Title that floats over the NPC's head
HelperNPC.Sites = 4 -- For each site you need a HelperNPC.Text[*sitenumber*] = [[TEXT]]

HelperNPC.Logo = "materials/core/watermark.png" -- Logo for the Background. Leave it empty <""> if no logo
HelperNPC.LogoX = 400 -- X size of the Logo (X, Y). This is horizontal.
HelperNPC.LogoY = 400 -- Y size of the Logo (X, Y). This is vertical.
HelperNPC.Rulespage = "" -- URL of your rules. Leave empty for nothing.
HelperNPC.Homepage = "http://core-community.de/forum/" -- URL of your website.
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

-- Make the players download the materials. This is best left alone.

if SERVER then
	resource.AddFile(HelperNPC.Material)
	resource.AddFile("materials/core/close.png")
	resource.AddFile("materials/core/home.png")
end
