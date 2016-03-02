
HelperNPC = {} // Do NOT edit this pls
HelperNPC.Text = {} // Do NOT edit this pls

HelperNPC.Title = "Title" // On the top of the derma
HelperNPC.TitleOverhead = "Title" // On the top of the NPC
HelperNPC.Sites = 4 // For each size you need a HelperNPC.Text[site] = [[TEXT]]


HelperNPC.Logo = "materials/core/watermark.png" // Logo for the Background. Leave it empty <""> if no logo
HelperNPC.LogoX = 400 // X size of the Logo (>400<x400)
HelperNPC.LogoY = 400 // y size of the Logo (400x>400>)
HelperNPC.Rulespage = ""
HelperNPC.Homepage = "http://core-community.de/forum/"
HelperNPC.NPCModel = "models/gman.mdl" // Don't use playermodels, these are looking weird :)


HelperNPC.Text[1] = [[Enter
the
first
text
on
size
one
]]

HelperNPC.Text[2] = [[Enter
the
second
text
on
size
two
]]
HelperNPC.Text[3] = [[..
..
..
]]
HelperNPC.Text[4] = [[..
..
..
]]



// DO NOT EDIT THIS or MAYBE?

if SERVER then
	resource.AddFile(HelperNPC.Material)
	resource.AddFile("materials/core/close.png")
	resource.AddFile("materials/core/home.png")
end
