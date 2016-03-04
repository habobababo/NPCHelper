include('shared.lua') 

for i = 10, 100 do
	surface.CreateFont("CoreFont" .. i, {font = "Open Sans", size = i, weight = 100, antialias = true}) -- Create custom Font
end

local blur = Material("pp/blurscreen")
local function drawpb(panel, layers, density, alpha)
	local x, y = panel:LocalToScreen(0, 0)

	surface.SetDrawColor(255, 255, 255, alpha)
	surface.SetMaterial(blur)

	for i = 1, 3 do
		blur:SetFloat("$blur", (i / layers) * density)
		blur:Recompute()

		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(-x, -y, ScrW(), ScrH())
	end
end

hook.Add("PostDrawOpaqueRenderables", "gmodhelper", function()
	for _, ent in pairs (ents.FindByClass("gman")) do
		if ent:GetPos():Distance(LocalPlayer():GetPos()) < 1000 then
			local Ang = ent:GetAngles()

			Ang:RotateAroundAxis(Ang:Forward(), 90)
			Ang:RotateAroundAxis(Ang:Right(), -90)
		
			cam.Start3D2D(ent:GetPos() + ent:GetUp() * 80, Ang, 0.35)
				draw.SimpleTextOutlined(HelperNPC.TitleOverhead, "CoreFont30", 0, 0, Color(230, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 255))			
			cam.End3D2D()
		end
	end
end)

local function HelperMenu()
	local h = 130
	local r = 540
	local site = 1
	local LabelQ
	
	local MainDerma = vgui.Create('DFrame')
	MainDerma:SetSize(600, 600)
	MainDerma:SetPos(ScrW() * 0.5 - 300, ScrH() * 0.5 - 300)
	MainDerma:SetTitle("")
	MainDerma:ShowCloseButton(false)
	MainDerma:SetDraggable(false)
	MainDerma:MakePopup()
	MainDerma.Paint = function(self)
		drawpb(self, 12, 20, 200)
		draw.RoundedBox(4, 0, 0, 600, 600, Color(0, 0, 0, 140))
		draw.RoundedBox(4, 50, 50, 500, 500, Color(0, 0, 0, 140))
		
		if HelperNPC.Material != "" then
			surface.SetMaterial(Material(HelperNPC.Logo))
			surface.SetDrawColor(255, 255, 255, 3)
			surface.DrawTexturedRect(MainDerma:GetWide() / 2 - HelperNPC.LogoX / 2, MainDerma:GetTall() / 2 - HelperNPC.LogoY / 2, 400, 400)
		end
	end
	
	local Closebutton = vgui.Create("DImageButton", MainDerma)
	Closebutton:SetSize(MainDerma:GetWide(), 64)
	Closebutton:SetPos(MainDerma:GetWide() - 18, 2)
	Closebutton:SetMaterial("materials/core/close.png")
	Closebutton:SizeToContents()
	Closebutton.DoClick = function()
		MainDerma:Remove()
	end
	
	surface.SetFont("CoreFont40")
	local TitleSize = surface.GetTextSize(HelperNPC.Title)
	
	
	Title = vgui.Create("DLabel", MainDerma)
	Title:SetSize(TitleSize, 30)
	Title:SetPos(MainDerma:GetWide() / 2 - Title:GetWide() / 2, 10)
	Title:SetFont("CoreFont40")
	Title:SetTextColor(Color(255, 255, 255))
	Title:SetText(HelperNPC.Title)
	
	LabelQ = vgui.Create("DLabel", MainDerma)
	LabelQ:SetSize(600, 600)
	LabelQ:SetPos(60, 0)
	LabelQ:SetFont("CoreFont30")
	LabelQ:SetText(HelperNPC.Text[1])

	for i = 1, HelperNPC.Sites do
		local sites = vgui.Create("DButton", MainDerma)
		sites:SetPos(40 + i * 25, MainDerma:GetTall() - 35)
		sites:SetText("")
		sites:SetSize(20, 20)
		sites.DoClick = function(self)
			site = i
			surface.PlaySound("ui/buttonclickrelease.wav") 
			
			if LabelQ then LabelQ:Remove() end
			
			for k, v in pairs(HelperNPC.Text) do
				if k == site then
					LabelQ = vgui.Create("DLabel", MainDerma)
					LabelQ:SetSize(600, 600)
					LabelQ:SetPos(60, 0)
					LabelQ:SetFont("CoreFont30")
					LabelQ:SetText(HelperNPC.Text[site])
				end
			end
		end
		sites.Paint = function(self)
			draw.SimpleText(i, "CoreFont30", 10, 9, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			if self.hover then
				draw.RoundedBox(4, 0, 0, 20, 20, Color(0, 0, 0, 140))
			else
				draw.RoundedBox(4, 0, 0, 20, 20, Color(0, 0, 0, 100))
			end
		
		end
		sites.OnCursorEntered = function( self )
			self.hover = true
		end
		sites.OnCursorExited = function( self )
			self.hover = false
		end		
	end
		
	local SiteButton = vgui.Create("DButton", MainDerma)
	SiteButton:SetPos(MainDerma:GetWide() - 45, MainDerma:GetTall() - 45)
	SiteButton:SetText("")
	SiteButton:SetSize(35, 35)
	SiteButton:SetText("")
	SiteButton:SetFont("CoreFont20")
	SiteButton.DoClick = function()
		surface.PlaySound("ui/buttonclickrelease.wav") 
		gui.OpenURL(HelperNPC.Homepage)
	end
	SiteButton.Paint = function(self)
		surface.SetMaterial(Material("materials/core/home.png"))
		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawTexturedRect(2, 2, 32, 32)
		if self.hover then
			draw.RoundedBox(4, 0, 0, SiteButton:GetWide(), SiteButton:GetTall(), Color(0, 0, 0, 40))
		else
			draw.RoundedBox(4, 0, 0, SiteButton:GetWide(), SiteButton:GetTall(), Color(40, 40, 40, 100))
		end
	end
	SiteButton.OnCursorEntered = function(self)
		self.hover = true
	end
	SiteButton.OnCursorExited = function(self)
		self.hover = false
	end
	
	
end
usermessage.Hook("OpenHowto", HelperMenu)
