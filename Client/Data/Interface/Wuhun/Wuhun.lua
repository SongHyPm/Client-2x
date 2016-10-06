local Kfs_AttrEx_Text = {}
local Kfs_AttrEx_Value = {}
local KFS_ATTREX_MAX_NUM = 10
local Kfs_Base_Original_Text = {}
local Kfs_Base_Original_Value = {}
local Kfs_Base_Text = {}
local Kfs_Base_Value = {}
local Kfs_Skills = {}
local Kfs_Magic_Image = {}
local Kfs_Skill_ID = {}
local szAuthor = "#ccccccc00000001500100000000000000000"
local ItemIDCompare = 10141040
local Kfs_Magic_tips = {"#{WH_090817_04}" , "#{WH_090817_05}","#{WH_090817_06}","#{WH_090817_07}","#{WH_090817_08}"}
local Kfs_Att_tips = {"#{WH_xml_XX(53)}" , "#{WH_xml_XX(52)}" , "#{WH_xml_XX(54)}"  , "#{WH_xml_XX(60)}" , "#{WH_xml_XX(01)}"}
local Kfs_AttrEx_Mask_L = {}
local Kfs_AttrEx_Mask_R	= {}
local g_Wuhun_Frame_UnifiedXPosition;
local g_Wuhun_Frame_UnifiedYPosition;

function Wuhun_PreLoad()
	--open or close this window
	this:RegisterEvent("TOGGLE_WUHUN_PAGE");
	this:RegisterEvent("UI_COMMAND");
	--player quit game
	this:RegisterEvent("PLAYER_LEAVE_WORLD");
	--update equip
	this:RegisterEvent("REFRESH_EQUIP");

	-- ÓÎÏ·´°¿Ú³ß´ç·¢ÉúÁË±ä»¯
	this:RegisterEvent("ADJEST_UI_POS")

	-- ÓÎÏ··Ö±æÂÊ·¢ÉúÁË±ä»¯
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
end

function Wuhun_OnLoad()
	--AttrEx text
	Kfs_AttrEx_Mask_L[1] = Wuhun_Property1_Text
	Kfs_AttrEx_Mask_L[2] = Wuhun_Property2_Text
	Kfs_AttrEx_Mask_L[3] = Wuhun_Property3_Text
	Kfs_AttrEx_Mask_L[4] = Wuhun_Property4_Text
	Kfs_AttrEx_Mask_L[5] = Wuhun_Property5_Text
	Kfs_AttrEx_Mask_L[6] = Wuhun_Property6_Text
	Kfs_AttrEx_Mask_L[7] = Wuhun_Property7_Text
	Kfs_AttrEx_Mask_L[8] = Wuhun_Property8_Text
	Kfs_AttrEx_Mask_L[9] = Wuhun_Property9_Text
	Kfs_AttrEx_Mask_L[10] = Wuhun_Property10_Text
	--AttrEx value
	Kfs_AttrEx_Mask_R[1] = Wuhun_Property1
	Kfs_AttrEx_Mask_R[2] = Wuhun_Property2
	Kfs_AttrEx_Mask_R[3] = Wuhun_Property3
	Kfs_AttrEx_Mask_R[4] = Wuhun_Property4
	Kfs_AttrEx_Mask_R[5] = Wuhun_Property5
	Kfs_AttrEx_Mask_R[6] = Wuhun_Property6
	Kfs_AttrEx_Mask_R[7] = Wuhun_Property7
	Kfs_AttrEx_Mask_R[8] = Wuhun_Property8
	Kfs_AttrEx_Mask_R[9] = Wuhun_Property9
	Kfs_AttrEx_Mask_R[10] = Wuhun_Property10

	Kfs_AttrEx_Text[1] = Wuhun_Property1_Text_UnVisible;
	Kfs_AttrEx_Text[2] = Wuhun_Property2_Text_UnVisible;
	Kfs_AttrEx_Text[3] = Wuhun_Property3_Text_UnVisible;
	Kfs_AttrEx_Text[4] = Wuhun_Property4_Text_UnVisible;
	Kfs_AttrEx_Text[5] = Wuhun_Property5_Text_UnVisible;
	Kfs_AttrEx_Text[6] = Wuhun_Property6_Text_UnVisible;
	Kfs_AttrEx_Text[7] = Wuhun_Property7_Text_UnVisible;
	Kfs_AttrEx_Text[8] = Wuhun_Property8_Text_UnVisible;
	Kfs_AttrEx_Text[9] = Wuhun_Property9_Text_UnVisible;
	Kfs_AttrEx_Text[10] = Wuhun_Property10_Text_UnVisible;

	Kfs_AttrEx_Value[1] = Wuhun_Property1_UnVisible;
	Kfs_AttrEx_Value[2] = Wuhun_Property2_UnVisible;
	Kfs_AttrEx_Value[3] = Wuhun_Property3_UnVisible;
	Kfs_AttrEx_Value[4] = Wuhun_Property4_UnVisible;
	Kfs_AttrEx_Value[5] = Wuhun_Property5_UnVisible;
	Kfs_AttrEx_Value[6] = Wuhun_Property6_UnVisible;
	Kfs_AttrEx_Value[7] = Wuhun_Property7_UnVisible;
	Kfs_AttrEx_Value[8] = Wuhun_Property8_UnVisible;
	Kfs_AttrEx_Value[9] = Wuhun_Property9_UnVisible;
	Kfs_AttrEx_Value[10] = Wuhun_Property10_UnVisible;
	--Original five text
	Kfs_Base_Original_Text[1] = Wuhun_OriginalStr_Text
	Kfs_Base_Original_Text[2] = Wuhun_OriginalNimbus_Text
	Kfs_Base_Original_Text[3] = Wuhun_OriginalPhysicalStrength_Text
	Kfs_Base_Original_Text[4] = Wuhun_OriginalStability_Text
	Kfs_Base_Original_Text[5] = Wuhun_OriginalFootwork_Text
	--Original five value
	Kfs_Base_Value[1] = Wuhun_OriginalStr
	Kfs_Base_Value[2] = Wuhun_OriginalNimbus
	Kfs_Base_Value[3] = Wuhun_OriginalPhysicalStrength
	Kfs_Base_Value[4] = Wuhun_OriginalStability
	Kfs_Base_Value[5] = Wuhun_OriginalDexterity
	--five text
	Kfs_Base_Text[1] = Wuhun_Str_Text
	Kfs_Base_Text[2] = Wuhun_Nimbus_Text
	Kfs_Base_Text[3] = Wuhun_PhysicalStrength_Text
	Kfs_Base_Text[4] = Wuhun_Stability_Text
	Kfs_Base_Text[5] = Wuhun_Footwork_Text
	--five value
	Kfs_Base_Original_Value[1] = Wuhun_Str
	Kfs_Base_Original_Value[2] = Wuhun_Nimbus
	Kfs_Base_Original_Value[3] = Wuhun_PhysicalStrength
	Kfs_Base_Original_Value[4] = Wuhun_Stability
	Kfs_Base_Original_Value[5] = Wuhun_Dexterity
	--skills
	Kfs_Skills[1] = Wuhun_Skill2
	Kfs_Skills[2] = Wuhun_Skill3
	Kfs_Skills[3] = Wuhun_Skill4
	--magic
	Kfs_Magic = Wuhun_Skill1
	--magic image

	Kfs_Magic_Image[1] = "set:Wuhun4 image:Wuhun4_2"
	Kfs_Magic_Image[2] = "set:Wuhun4 image:Wuhun4_1"
	Kfs_Magic_Image[3] = "set:Wuhun4 image:Wuhun4_4"
	Kfs_Magic_Image[4] = "set:Wuhun4 image:Wuhun4_3"
	
	-- ±£´æ½çÃæµÄÄ¬ÈÏÏà¶ÔÎ»ÖÃ
	g_Wuhun_Frame_UnifiedXPosition = Wuhun_Frame:GetProperty("UnifiedXPosition");
	g_Wuhun_Frame_UnifiedYPosition = Wuhun_Frame:GetProperty("UnifiedYPosition");	

end

function Wuhun_OnEvent(event)
	if (event == "UI_COMMAND" and tonumber(arg0) == 20111211) then
		Wuhun_SetTabState()
		if(this:IsVisible()) then
			this:Hide();
			return;
		end
		Wuhun_Update()
		this:Show();
	end
	if( event == "PLAYER_LEAVE_WORLD") then
		this:Hide();
		return;
	end
	if( event == "REFRESH_EQUIP" and this:IsVisible() ) then
		Variable:SetVariable("SelfUnionPos", Wuhun_Frame:GetProperty("UnifiedPosition"), 1);
		Wuhun_Update()
	end
	if (event == "ADJEST_UI_POS" ) then
		Wuhun_Frame_On_ResetPos()

	end
	if (event == "VIEW_RESOLUTION_CHANGED") then
		Wuhun_Frame_On_ResetPos()
	end
end
--Update
function Wuhun_Update()
	--Title
	Wuhun_PageHeader:SetText("#gFF0FA0#{WH_xml_XX(95)}")
	--Pos
	local selfUnionPos = Variable:GetVariable("SelfUnionPos");
	if(selfUnionPos ~= nil) then
		Wuhun_Frame:SetProperty("UnifiedPosition", selfUnionPos);
	end

	--ICON
	Wuhun_Equip_Mask:Hide()
	Wuhun_Equip:SetActionItem(-1)
	
	local ActionKFS = EnumAction(18,"equip")
	Wuhun_Equip:SetActionItem(ActionKFS:GetID());
	--Model	
	--DataPool:KFS_UpdateKFSModel()
	Wuhun_FakeObject:SetFakeObject( "" );
	Wuhun_FakeObject:SetFakeObject("My_Wuhun");

	local ItemID = ActionKFS:GetDefineID()
	local modellevel = 0

	if ItemID > ItemIDCompare then
		modellevel = tonumber(string.sub(tostring(szAuthor),20,20));
	end

	isFabao_4 = string.find(ActionKFS:GetName(), 'L�u Ly Di�m');
	isFabao_5 = string.find(ActionKFS:GetName(), 'Ng� Dao B�n');

	if ActionKFS:GetID() ~= 0 then
        local KFSModel = 0
		if (isFabao_4 ~= nil) then
			KFSModel = 699
		elseif (isFabao_5 ~= nil) then
			KFSModel = 704
		end
		if (KFSModel > 0) then
			modellevel = modellevel + 2;
			KFSModel = KFSModel + modellevel;
			CachedTarget:SetHorseModel(KFSModel);
			Wuhun_FakeObject:SetFakeObject("Other_Horse");
		end
	else
		Wuhun_FakeObject:SetFakeObject("");
	end


	--data = DataPool:GetKfsData("NEEDLEVEL")
	local needlevel = 0
	if ItemID > ItemIDCompare then
		needlevel = 65
		--Wuhun_NeedLevel_Text:SetText("#G"..tostring(needlevel))
	else
		--Wuhun_NeedLevel_Text:SetText("0")
	end

	--data = DataPool:GetKfsData("LEVEL")
	local level = 0
	if ItemID > ItemIDCompare then
		level = tonumber(string.sub(tostring(szAuthor),14,16));
		Wuhun_Level_Text:SetText("#G"..tostring(level))
	else
		Wuhun_Level_Text:SetText(tostring(level))
	end	

	--data = DataPool:GetKfsData("EXTRALEVEL")
	local extralevel = 0
	if ItemID > ItemIDCompare then
		extralevel = tonumber(string.sub(tostring(szAuthor),20,20));
		Wuhun_ExtraLevel_Text:SetText("#G"..tostring(extralevel))
	else
		Wuhun_ExtraLevel_Text:SetText(tostring(extralevel))
	end

	--data = DataPool:GetKfsData("ATTACT")
	local attact = ""
	if (isFabao_4 ~= nil) then
		attact = "Lo�i c߶ng l�c"
	elseif (isFabao_5 ~= nil) then
		attact = "Lo�i n�i l�c"
	end
	Wuhun_Type:SetText(attact)

	--data = DataPool:GetKfsData("LIFE")
	--local maxLife = DataPool:GetKfsData("MAXLIFE")
	local nWuhunIndex = LifeAbility:Open_Compose_Gem_Page( 0, 18 )
		--nWuhunIndex = LifeAbility

	local life = 299
	local maxLife = 300
	if ItemID > ItemIDCompare then
		--List Function Item
		--ActionKFS:GetName()
		--local nWuhunIndex = LifeAbility:Get_Equip_Point(18)
		--local nWuhunIndex = LifeAbility:Get_UserEquip_VisualID(18)

		--Wuhun_Life_Text2:SetText(array_result[2])
		Wuhun_Life_Text2:SetText(tostring(life).."/"..tostring(maxLife))
	else
		Wuhun_Life_Text2:SetText("0/0")
	end

	--data = DataPool:GetKfsData("EXP")
	local WHExp = tonumber(string.sub(tostring(szAuthor),9,13));
	--Wuhun_Equip_Mask:Show()
	Wuhun_Growth:SetText("#G#{ZSKSSJ_PT}")
	--#{ZS_CZL}
	--#{INTERFACE_XML_432}
	--grade == 0 then
	--Wuhun_Growth:SetText("#G#{ZSKSSJ_PT}")
	-- grade == 1 then
	--Wuhun_Growth:SetText("#G#{ZSKSSJ_YX}")
	-- grade == 2 then
	--Wuhun_Growth:SetText("#G#{ZSKSSJ_JC}")
	-- grade == 3 then
	--Wuhun_Growth:SetText("#G#{ZSKSSJ_ZY}")
	-- grade == 4 then
	--Wuhun_Growth:SetText("#G#{ZSKSSJ_WM}")
end

--kfs equippoint clicked event
function Wuhun_Equip_Clicked( buttonIn )
	local button = tonumber( buttonIn );
	if( button == 1 ) then
		Wuhun_Equip:DoAction();	
	else
		Wuhun_Equip:DoSubAction();
	end

end

--model turn left
function Wuhun_Model_TurnLeft(start)
	--start
	if(start == 1 and CEArg:GetValue("MouseButton")=="LeftButton") then
		Wuhun_FakeObject:RotateBegin(-0.3);
	--stop
	else
		Wuhun_FakeObject:RotateEnd();
	end
end

--model turn right
function Wuhun_Model_TurnRight(start)
	--start
	if(start == 1 and CEArg:GetValue("MouseButton")=="LeftButton") then
		Wuhun_FakeObject:RotateBegin(0.3);
	--stop
	else
		Wuhun_FakeObject:RotateEnd();
	end
end

--kfs hidden event
function Wuhun_OnHiden()
	Wuhun_FakeObject:SetFakeObject("");	
end

--player's other info
function Wuhun_OtherInfo_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Wuhun_Frame:GetProperty("UnifiedPosition"), 1);
	OtherInfoPage();
end

--player's ride
function Wuhun_Ride_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Wuhun_Frame:GetProperty("UnifiedPosition"), 1);
	OpenRidePage();
end

--player's pet
function Wuhun_Pet_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Wuhun_Frame:GetProperty("UnifiedPosition"), 1);
	TogglePetPage();
end

--player's blog
function Wuhun_Blog_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Wuhun_Frame:GetProperty("UnifiedPosition"), 1);
	local strCharName =  Player:GetName();
	local strAccount =  Player:GetData("ACCOUNTNAME")
	Blog:OpenBlogPage(strAccount,strCharName,true);
end

--player's info
function Wuhun_SelfData_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Wuhun_Frame:GetProperty("UnifiedPosition"), 1);
	SystemSetup:OpenPrivatePage("self");
end

--player's equip
function Wuhun_SelfEquip_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Wuhun_Frame:GetProperty("UnifiedPosition"), 1);
	OpenEquip(1);
end

function Wuhun_SetTabState()
	Wuhun_SelfEquip:SetCheck(0)
	Wuhun_Wuhun:SetCheck(1)
	Wuhun_SelfData:SetCheck(0)
	Wuhun_Blog:SetCheck(0)
	Wuhun_Pet:SetCheck(0)
	Wuhun_Xiulian:SetCheck(0)
	Wuhun_Ride:SetCheck(0)
	Wuhun_OtherInfo:SetCheck(0)
end
--xiu lian
function Wuhun_Xiulian_Page_Switch()
	local nLevel = Player:GetData("LEVEL")
	if(nLevel >= 70) then
		Variable:SetVariable("SelfUnionPos", Wuhun_Frame:GetProperty("UnifiedPosition"), 1);
		PushEvent("UI_COMMAND",20111212)
	else
		Wuhun_Xiulian : SetCheck(0)
		PushDebugMessage("#{XL_090707_62}")
	end
end

--================================================
-- »Ö¸´½çÃæµÄÄ¬ÈÏÏà¶ÔÎ»ÖÃ
--================================================
function Wuhun_Frame_On_ResetPos()
	Wuhun_Frame : SetProperty("UnifiedXPosition", g_Wuhun_Frame_UnifiedXPosition);
	Wuhun_Frame : SetProperty("UnifiedYPosition", g_Wuhun_Frame_UnifiedYPosition);

end