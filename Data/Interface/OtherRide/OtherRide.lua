local Current_Ride_Index = -1;
local INVALID_ID =-1;
local RIDE_TAB_TEXT = {};
local OtherRide_g_Ride;			--Æï³Ë¶ÔÏó
local OtherRide_g_EquipMask;

function OtherRide_PreLoad()
	
	-- ´ò¿ª½çÃæ
	this:RegisterEvent("TOGLE_OTHERRIDE_PAGE");
	
	--Àë¿ª³¡¾°£¬×Ô¶¯¹Ø±Õ
	this:RegisterEvent("PLAYER_LEAVE_WORLD");

	
end

function OtherRide_OnLoad()
	
	RIDE_TAB_TEXT = {
		[0] = "Ð°",
		"Nhân",
		"Blog",
		"Thú",
		"KÜ",
	};
	
	OtherRide_g_Ride = OtherRide_Equip;
	OtherRide_g_EquipMask = OtherRide_Equip_Mask;
end

-- OnEvent
function OtherRide_OnEvent(event)
	if ( event == "TOGLE_OTHERRIDE_PAGE" ) then
	
		if(this:IsVisible()) then
			
			this:Hide();
			return;
		end

		OtherRide_OnShow();
		this:Show();
	end
	
	if( event == "PLAYER_LEAVE_WORLD") then
		this:Hide();
		return;
	end	
	return;		
end
function OtherRide_SetTabColor(idx)
	if(idx == nil or idx < 0 or idx > 4) then
		return;
	end	
	
	--AxTrace(0,0,tostring(idx));
	local i = 0;
	local selColor = "#e010101#Y";
	local noselColor = "#e010101";
	local tab = {
								[0] = OtherRide_TargetEquip,
								OtherRide_TargetData,
								OtherRide_Blog,
								OtherRide_Pet,
								OtherRide_Ride,
							};
	
	while i < 5 do
		if(i == idx) then
			tab[i]:SetText(selColor..RIDE_TAB_TEXT[i]);
		else
			tab[i]:SetText(noselColor..RIDE_TAB_TEXT[i]);
		end
		i = i + 1;
	end
end
function OtherRide_OnShow()
	OtherRide_SetTabColor(4);
	OtherRide_Ride:SetCheck(1);
	local selfUnionPos = Variable:GetVariable("OtherUnionPos");
	if(selfUnionPos ~= nil) then
		OtherRide_Frame:SetProperty("UnifiedPosition", selfUnionPos);
	end

	OtherRide_List : ClearListBox();
	OtherRide_FakeObject : SetFakeObject( "" );
	local nRideIndex = LifeAbility : Get_OtherPlayerEquip_VisualID(8)
	if(INVALID_ID~=nRideIndex)then
		Target : SetHorseModel(nRideIndex);
		OtherRide_FakeObject : SetFakeObject( "Other_Horse" );
	end;
	
	OtherRide_Equip_Update();   --ÏÔÊ¾¶Ô·½Æï³Ë
	
	--nRideIndex = -1
	--while nRideIndex < 50 do
	--	nRideIndex = nRideIndex + 1;
		--StrName = Target : GetMyHorse(nRideIndex);
		
	--	if StrName ~= "-1" then
	--		OtherRide_List : AddItem(StrName, nRideIndex);
	--	end
	
	--end

end

----------------------------------------------------------------------------------
--
-- Ñ¡×°Íæ¼ÒÄ£ÐÍ£¨Ïò×ó)
--
function OtherRide_Model_TurnLeft(start)
	local mouse_button = CEArg:GetValue("MouseButton");
	if(mouse_button == "LeftButton") then
		--Ïò×óÐý×ª¿ªÊ¼
		if(start == 1) then
			OtherRide_FakeObject:RotateBegin(-0.3);
		--Ïò×óÐý×ª½áÊø
		else
			OtherRide_FakeObject:RotateEnd();
		end
	end
end

----------------------------------------------------------------------------------
--
-- Ñ¡×°Íæ¼ÒÄ£ÐÍ£¨ÏòÓÒ)
--
function OtherRide_Model_TurnRight(start)
	local mouse_button = CEArg:GetValue("MouseButton");
	if(mouse_button == "LeftButton") then
		--ÏòÓÒÐý×ª¿ªÊ¼
		if(start == 1) then
			OtherRide_FakeObject:RotateBegin(0.3);
		--ÏòÓÒÐý×ª½áÊø
		else
			OtherRide_FakeObject:RotateEnd();
		end
	end
end



--===============================================
-- ´ò¿ªÍæ¼Ò×°±¸UI
--===============================================
function OtherRide_TargetEquip_Down()
	Variable:SetVariable("OtherUnionPos", OtherRide_Frame:GetProperty("UnifiedPosition"), 1);
	SystemSetup:OpenEquipFrame("other");
end

--===============================================
-- ´ò¿ªÍæ¼Ò×ÊÁÏUI
--===============================================
function OtherRide_TargetData_Down()
	Variable:SetVariable("OtherUnionPos", OtherRide_Frame:GetProperty("UnifiedPosition"), 1);
	SystemSetup:OpenPrivatePage("other")
end
--===============================================
-- ´ò¿ªÍæ¼Ò²©¿ÍUI
--===============================================
function OtherRide_TargetBlog_Down()
	Variable:SetVariable("OtherUnionPos", OtherRide_Frame:GetProperty("UnifiedPosition"), 1);

	local strCharName =  Target:GetData("NAME");
	local strAccount =  Target:GetData("ACCOUNTNAME")
	Blog:OpenBlogPage(strAccount,strCharName,false);
end

function OtherRide_OtherPet_Down()
	Variable:SetVariable("OtherUnionPos", OtherRide_Frame:GetProperty("UnifiedPosition"), 1);
	SystemSetup:OpenPetFrame("other");
end


function OtherRide_Equip_Click( buttonIn )
	local button = tonumber( buttonIn );
	if( button == 1 ) then
		OtherRide_g_Ride:DoAction();	--Æï³Ë
	else
		OtherRide_g_Ride:DoSubAction();	--Æï³Ë
	end
end


function OtherRide_Equip_Update()
	OtherRide_g_Ride:SetActionItem(-1);
	local ActionMount = EnumAction(8, "targetequip");
	OtherRide_g_Ride:SetActionItem(ActionMount:GetID());	
	
	if( ActionMount:GetEquipDur() < 0.1 ) then
		OtherRide_g_EquipMask:Show();
	else
		OtherRide_g_EquipMask:Hide();
	end
end