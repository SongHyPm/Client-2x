local objCared = -1;
local MAX_OBJ_DISTANCE = 3.0;
local g_uicmd = 0;

function NewbieCardActivation_PreLoad()
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("OBJECT_CARED_EVENT");
	this:RegisterEvent("NewUserCard_Check_Result");
end

function NewbieCardActivation_OnLoad()
end

function NewbieCardActivation_OnEvent(event)
	if(event == "UI_COMMAND" and not this:IsVisible()) then
		if(tonumber(arg0) == 2004 
		  or tonumber(arg0) == 20080819 
--		  or tonumber(arg0) == 2005 or tonumber(arg0) == 2006 or
--		   tonumber(arg0) == 2007 or tonumber(arg0) == 2007950
		  or tonumber(arg0) == 2008 ) then
			objCared = Get_XParam_INT(0);
			objCared = Target:GetServerId2ClientId(objCared);
			NewUserCard_SetText(tonumber(arg0));
			this:CareObject(objCared, 1, "NewUserCard");
			NewbieCardActivation_Input:SetProperty("DefaultEditBox", "True");
			this:Show();
			g_uicmd = tonumber(arg0);
		end
	elseif(event == "OBJECT_CARED_EVENT") then
		--AxTrace(0, 0, "arg0:"..arg0.." arg1:"..arg1.." arg2:"..arg2.." objCared:"..objCared);
		if(tonumber(arg0) ~= objCared) then
			return;
		end
		--Èç¹ûºÍNPCµÄ¾àÀë´óÓÚÒ»¶¨¾àÀë»òÕß±»É¾³ı£¬×Ô¶¯¹Ø±Õ
		if(arg1 == "distance" and tonumber(arg2)>MAX_OBJ_DISTANCE or arg1=="destroy") then
			Guild_Create_Close();
		end
	
	elseif(event == "NewUserCard_Check_Result")then
		local result = tonumber(arg0)
		if(tonumber(arg0)== 0) then
			NewUserCard_Close();
			return;
		end
		if(tonumber(arg0)== 1 or tonumber(arg0)== 2) then
			NewbieCardActivation_Input:SetProperty("DefaultEditBox", "True");
			NewbieCardActivation_Input:SetSelected( 0, -1 );
			return;
		end
	end

end

function NewUserCard_Open_Click()
	local cardNum = NewbieCardActivation_Input:GetText();
	if(0 == string.len(cardNum)) then return; end

	
	local firstbyte = string.byte(cardNum)
	--588¿¨
	if (g_uicmd == 2004 and (firstbyte ==83 or firstbyte == 84)) then --´óĞ´ S T
		PushDebugMessage("#{CFK_081027_1}");
		return;
	end 
	if(g_uicmd == 2004 and firstbyte ~= 116 and firstbyte ~= 115 ) then     --588²Æ¸»¿¨'t','s''T','S'
		PushDebugMessage("#{CFK_081027_2}");
		return;
	end
	
	--666¿¨ c
	if (g_uicmd == 20080819 and firstbyte == 67) then
		PushDebugMessage("#{CFK_081027_1}");
		return;
	end
	if (g_uicmd == 20080819 and firstbyte ~= 99) then
		PushDebugMessage("#{CFK_081027_2}");
		return;
	end
	
	--¹¨²ÊÔÆ´¦ÅÅ³ı²Æ¸»¿¨
	if (firstbyte==83 or firstbyte==84 or firstbyte==115 or firstbyte==116) and g_uicmd~=2004 then
	  PushDebugMessage("#{CFK_081027_2}");
		return;
	end
	if ( firstbyte==67 or firstbyte==99) and g_uicmd~=20080819 then
	  PushDebugMessage("#{CFK_081027_2}");
		return;
	end
		
	NewUserCard(cardNum);
end

function NewUserCard_Close()
	this:Hide();
	this:CareObject(objCared, 0, "NewUserCard");
	g_uicmd = 0;
end

function NewUserCard_SetText(uicmd)
	if uicmd == 2004 then
		NewbieCardActivation_DragTitle:SetText("#{INTERFACE_XML_73}");
		NewbieCardActivation_Text:SetText("#{INTERFACE_XML_536}");
	elseif uicmd == 20080819 then--666²Æ¸»¿¨
		NewbieCardActivation_DragTitle:SetText("#{INTERFACE_XML_73}");
		NewbieCardActivation_Text:SetText("#{INTERFACE_XML_536}");
--	elseif uicmd == 2005 then
--		NewbieCardActivation_DragTitle:SetText("¼¤»î");
--		NewbieCardActivation_Text:SetText("ÇëÔÚÏÂÃæµÄÊäÈë¿òÄÚÊäÈëÄú»ñµÃµÄCD-Key");
--	elseif uicmd == 2006 then
--		NewbieCardActivation_DragTitle:SetText("#{CJ_20080321_01}");
--		NewbieCardActivation_Text:SetText("#{CJ_20080321_02}");
--	elseif uicmd == 2007 then
--		NewbieCardActivation_DragTitle:SetText("¼¤»î");
--		NewbieCardActivation_Text:SetText("ÇëÔÚÏÂÃæµÄÊäÈë¿òÄÚÊäÈëÄú»ñµÃµÄCD-Key");
	elseif uicmd == 2008 then
		NewbieCardActivation_DragTitle:SetText("Kích hoÕt");
		NewbieCardActivation_Text:SetText("Xin hãy nh§p CD-Key mà các hÕ nh§n ğßşc vào ô dß¾i ğây");
--	elseif uicmd == 2007950 then
--		NewbieCardActivation_DragTitle:SetText("#{CB_XUBAO_LINGQU_2}");
--		NewbieCardActivation_Text:SetText("#{CB_XUBAO_LINGQU_3}");
	end
	NewbieCardActivation_Input:SetText("");
end