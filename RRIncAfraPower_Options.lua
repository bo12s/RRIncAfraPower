local RRIncAfraPower = LibStub("AceAddon-3.0"):NewAddon("RRIncAfraPower")
local AceGUI = LibStub("AceGUI-3.0")

local test = false

local myOptionsTable = {
  type = "group",
  args = {
    optionHealOrder = {
        name = "Heal order",
        desc = "List each player in order separated by comma, no spaces, case sensitive.\nExample:\nSecretary,Pervink,Hagnuslegend",
        order = 1,
        type = "input",
        multiline = true,
        set = function(info,val) 
            if #val >=1 then 
                rriapOptionHealOrder = val; 
            else 
                rriapOptionHealOrder = "Dummy1,Dummy2" 
            end 
            if #{strsplit(",",rriapOptionHealOrder)} >=2 then
                rriapHealOrder = {strsplit(",",rriapOptionHealOrder)} 
            else
                rriapOptionHealOrder = "Dummy1,Dummy2"
                rriapHealOrder = {strsplit(",",rriapOptionHealOrder)} 
            end            
            
            print(GetAddOnMetadata("RRIncAfraPower", "Title")..":","New heal order: "..rriapOptionHealOrder) 
        end,
        get = function(info) return rriapOptionHealOrder  end
    },
    descriptionSpacer1 = {
            name = "\n",
            order = 2,
            type = "description",
            fontSize = "medium"
    },
    optionAnnounce= {
        name = "Raid warning",
        desc = "Announce next healer with raid warning.",
        order = 3,
        type = "toggle",
        set = function(info,val) rriapOptionAnnounce = val; end,
        get = function(info) return rriapOptionAnnounce  end
    },
    descriptionSpacer2 = {
            name = "\n",
            order = 4,
            type = "description",
            fontSize = "medium"
    },
    optionSkipDeadOffline= {
        name = "Skip dead or offline",
        desc = "If the next healer is dead or offline skip them and head to next.",
        order = 5,
        type = "toggle",
        set = function(info,val) rriapOptionSkipDeadOffline = val; end,
        get = function(info) return rriapOptionSkipDeadOffline  end
    },
    descriptionSpacer3 = {
            name = "\n",
            order = 6,
            type = "description",
            fontSize = "medium"
    },
    optionPrintHeals= {
        name = "Print heals",
        desc = "Print registered heals in your chat (wont be seen by anyone else).",
        order = 7,
        type = "toggle",
        set = function(info,val) rriapOptionPrintHeals = val; end,
        get = function(info) return rriapOptionPrintHeals  end
    },
     descriptionSpacer4 = {
            name = "\n",
            order = 8,
            type = "description",
            fontSize = "medium"
    },
    optionAnnounceHealOrder= {
        name = "Announce heal order",
        desc = "Announce heal order to raid when starting.",
        order = 9,
        type = "toggle",
        set = function(info,val) rriapOptionAnnounceHealOrder = val; end,
        get = function(info) return rriapOptionAnnounceHealOrder  end
    },
     descriptionSpacer5 = {
            name = "\n",
            order = 10,
            type = "description",
            fontSize = "medium"
    },
    optionLoopHealOrder= {
        name = "Loop heal order",
        desc = "Will reset order to first position after last has healed and keep going.",
        order = 11,
        type = "toggle",
        set = function(info,val) rriapOptionLoopOrder = val; end,
        get = function(info) return rriapOptionLoopOrder  end
    },
  }
}

local AceConfig = LibStub("AceConfig-3.0")
AceConfig:RegisterOptionsTable("RRInc AfraPower", myOptionsTable, {"rrincafrapowerconfig", "rriapcfg"})

LibStub("AceConfigDialog-3.0"):AddToBlizOptions("RRInc AfraPower", "RRInc AfraPower", nil);
