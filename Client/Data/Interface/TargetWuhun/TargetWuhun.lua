
local TargetKfs_AttrEx_Text = {}
local TargetKfs_AttrEx_Value = {}
local TargetKfs_ATTREX_MAX_NUM = 10
local TargetKfs_Base_Original_Text = {}
local TargetKfs_Base_Original_Value = {}
local TargetKfs_Base_Text = {}
local TargetKfs_Base_Value = {}
local TargetKfs_Skills = {}
local TargetKfs_Magic

local TargetKfs_Magic_Image = {}
local TargetKfs_Skill_ID = {}
--风、地、水、火
local TargetKfs_Magic_tips = {"#{WH_090817_04}" , "#{WH_090817_05}","#{WH_090817_06}","#{WH_090817_07}","#{WH_090817_08}"}
--力量、灵气、体力、身法、平衡
local TargetKfs_Att_tips = {"#{WH_xml_XX(53)}" , "#{WH_xml_XX(52)}" , "#{WH_xml_XX(54)}"  , "#{WH_xml_XX(60)}" , "#{WH_xml_XX(01)}"}

local TargetKfs_AttrEx_Mask_L = {}
local	TargetKfs_AttrEx_Mask_R	=	{}

local g_TargetWuhun_Frame_UnifiedPosition;

function TargetWuhun_PreLoad()
	--open or close this window
	this:RegisterEvent("OPEN_OTHERPLAYER_WUHUN");
	--player quit game
	this:RegisterEvent("PLAYER_LEAVE_WORLD");
	--update equip
	this:RegisterEvent("OTHERPLAYER_UPDATE_EQUIP");
	
	this:RegisterEvent("ADJEST_UI_POS")
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
end

function TargetWuhun_OnLoad()
	--AttrEx text
	TargetKfs_AttrEx_Mask_L[1] = TargetWuhun_Property1_Text
	TargetKfs_AttrEx_Mask_L[2] = TargetWuhun_Property2_Text
	TargetKfs_AttrEx_Mask_L[3] = TargetWuhun_Property3_Text
	TargetKfs_AttrEx_Mask_L[4] = TargetWuhun_Property4_Text
	TargetKfs_AttrEx_Mask_L[5] = TargetWuhun_Property5_Text
	TargetKfs_AttrEx_Mask_L[6] = TargetWuhun_Property6_Text
	TargetKfs_AttrEx_Mask_L[7] = TargetWuhun_Property7_Text
	TargetKfs_AttrEx_Mask_L[8] = TargetWuhun_Property8_Text
	TargetKfs_AttrEx_Mask_L[9] = TargetWuhun_Property9_Text
	TargetKfs_AttrEx_Mask_L[10] = TargetWuhun_Property10_Text
	--AttrEx value
	TargetKfs_AttrEx_Mask_R[1] = TargetWuhun_Property1
	TargetKfs_AttrEx_Mask_R[2] = TargetWuhun_Property2
	TargetKfs_AttrEx_Mask_R[3] = TargetWuhun_Property3
	TargetKfs_AttrEx_Mask_R[4] = TargetWuhun_Property4
	TargetKfs_AttrEx_Mask_R[5] = TargetWuhun_Property5
	TargetKfs_AttrEx_Mask_R[6] = TargetWuhun_Property6
	TargetKfs_AttrEx_Mask_R[7] = TargetWuhun_Property7
	TargetKfs_AttrEx_Mask_R[8] = TargetWuhun_Property8
	TargetKfs_AttrEx_Mask_R[9] = TargetWuhun_Property9
	TargetKfs_AttrEx_Mask_R[10] = TargetWuhun_Property10

	TargetKfs_AttrEx_Text[1] = TargetWuhun_Property1_Text_UnVisible;
	TargetKfs_AttrEx_Text[2] = TargetWuhun_Property2_Text_UnVisible;
	TargetKfs_AttrEx_Text[3] = TargetWuhun_Property3_Text_UnVisible;
	TargetKfs_AttrEx_Text[4] = TargetWuhun_Property4_Text_UnVisible;
	TargetKfs_AttrEx_Text[5] = TargetWuhun_Property5_Text_UnVisible;
	TargetKfs_AttrEx_Text[6] = TargetWuhun_Property6_Text_UnVisible;
	TargetKfs_AttrEx_Text[7] = TargetWuhun_Property7_Text_UnVisible;
	TargetKfs_AttrEx_Text[8] = TargetWuhun_Property8_Text_UnVisible;
	TargetKfs_AttrEx_Text[9] = TargetWuhun_Property9_Text_UnVisible;
	TargetKfs_AttrEx_Text[10] = TargetWuhun_Property10_Text_UnVisible;

	TargetKfs_AttrEx_Value[1] = TargetWuhun_Property1_UnVisible;
	TargetKfs_AttrEx_Value[2] = TargetWuhun_Property2_UnVisible;
	TargetKfs_AttrEx_Value[3] = TargetWuhun_Property3_UnVisible;
	TargetKfs_AttrEx_Value[4] = TargetWuhun_Property4_UnVisible;
	TargetKfs_AttrEx_Value[5] = TargetWuhun_Property5_UnVisible;
	TargetKfs_AttrEx_Value[6] = TargetWuhun_Property6_UnVisible;
	TargetKfs_AttrEx_Value[7] = TargetWuhun_Property7_UnVisible;
	TargetKfs_AttrEx_Value[8] = TargetWuhun_Property8_UnVisible;
	TargetKfs_AttrEx_Value[9] = TargetWuhun_Property9_UnVisible;
	TargetKfs_AttrEx_Value[10] = TargetWuhun_Property10_UnVisible;
	--Original five text
	TargetKfs_Base_Original_Text[1] = TargetWuhun_OriginalStr_Text
	TargetKfs_Base_Original_Text[2] = TargetWuhun_OriginalNimbus_Text
	TargetKfs_Base_Original_Text[3] = TargetWuhun_OriginalPhysicalStrength_Text
	TargetKfs_Base_Original_Text[4] = TargetWuhun_OriginalStability_Text
	TargetKfs_Base_Original_Text[5] = TargetWuhun_OriginalFootwork_Text
	--Original five value
	TargetKfs_Base_Value[1] = TargetWuhun_OriginalStr
	TargetKfs_Base_Value[2] = TargetWuhun_OriginalNimbus
	TargetKfs_Base_Value[3] = TargetWuhun_OriginalPhysicalStrength
	TargetKfs_Base_Value[4] = TargetWuhun_OriginalStability
	TargetKfs_Base_Value[5] = TargetWuhun_OriginalDexterity
	--five text
	TargetKfs_Base_Text[1] = TargetWuhun_Str_Text
	TargetKfs_Base_Text[2] = TargetWuhun_Nimbus_Text
	TargetKfs_Base_Text[3] = TargetWuhun_PhysicalStrength_Text
	TargetKfs_Base_Text[4] = TargetWuhun_Stability_Text
	TargetKfs_Base_Text[5] = TargetWuhun_Footwork_Text
	--five value 
	TargetKfs_Base_Original_Value[1] = TargetWuhun_Str
	TargetKfs_Base_Original_Value[2] = TargetWuhun_Nimbus
	TargetKfs_Base_Original_Value[3] = TargetWuhun_PhysicalStrength
	TargetKfs_Base_Original_Value[4] = TargetWuhun_Stability
	TargetKfs_Base_Original_Value[5] = TargetWuhun_Dexterity
	--skills
	TargetKfs_Skills[1] = TargetWuhun_Skill2
	TargetKfs_Skills[2] = TargetWuhun_Skill3
	TargetKfs_Skills[3] = TargetWuhun_Skill4
	--magic
	TargetKfs_Magic = TargetWuhun_Skill1
	--magic image
	
	TargetKfs_Magic_Image[1] = "set:Wuhun4 image:Wuhun4_2"
	TargetKfs_Magic_Image[2] = "set:Wuhun4 image:Wuhun4_1"
	TargetKfs_Magic_Image[3] = "set:Wuhun4 image:Wuhun4_4"
	TargetKfs_Magic_Image[4] = "set:Wuhun4 image:Wuhun4_3"
	
	 g_TargetWuhun_Frame_UnifiedPosition=TargetWuhun_Frame:GetProperty("UnifiedPosition");

end

function TargetWuhun_OnEvent(event)
	
	if( event == "PLAYER_LEAVE_WORLD") then
		
		this:Hide();
		return;
	
	elseif( event == "OPEN_OTHERPLAYER_WUHUN") then
		
		if (not CachedTarget:IsPresent(1)) then
			return;
		end

		if (not CachedTarget:CanGetTargetEquip()) then
			PushDebugMessage ("#{JSCK_90507_1}")				-- 距离该玩家太远，无法查看资料。
			return
		end
		
		g_objCared = CachedTarget:GetData("NPCID", 1)
		if (type(g_objCared) ~="number") then
			PushDebugMessage ("#{JSCK_90507_1}")				-- 距离该玩家太远，无法查看资料。
			return
		end
		
		this:CareObject(g_objCared , 1)

		TargetWuhun_Update();

		this:Show();
	
	elseif( event == "OTHERPLAYER_UPDATE_EQUIP" and this:IsVisible() ) then
		Variable:SetVariable("SelfUnionPos", TargetWuhun_Frame:GetProperty("UnifiedPosition"), 1);
		TargetWuhun_Update()
		
	elseif (event == "ADJEST_UI_POS" ) then
		TargetWuhun_Frame_On_ResetPos()
		
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		TargetWuhun_Frame_On_ResetPos()
	end
end

--Update
function TargetWuhun_Update()
	--Tab
	TargetWuhun_TargetWuhun:SetCheck(1)
	TargetWuhun_Equip_Mask:Hide()
	--Pos
	local otherUnionPos = Variable:GetVariable("OtherUnionPos");
	if(otherUnionPos ~= nil) then
		TargetWuhun_Frame:SetProperty("UnifiedPosition", otherUnionPos);
	end
	--Title
	TargetWuhun_PageHeader:SetText("#gFF0FA0#{WH_xml_XX(95)}")
	
	local data = CachedTarget:GetKfsData("NAME")
	if data ~= nil then
		TargetWuhun_PageHeader:SetText("#gFF0FA0"..tostring(data))
	end

	--ICON
	TargetWuhun_Equip:SetActionItem(-1)
	local ActionKFS = EnumAction(18, "targetequip")
	TargetWuhun_Equip:SetActionItem(ActionKFS:GetID());
	--Model
	TargetWuhun_FakeObject:SetFakeObject("");
	CachedTarget:UpdateOtherKFSModel();
	TargetWuhun_FakeObject:SetFakeObject("Other_Wuhun");
	
	--NeedLv
	TargetWuhun_NeedLevel_Text:SetText("")	
	
	data = CachedTarget:GetKfsData("NEEDLEVEL")
	if data ~= nil then
		TargetWuhun_NeedLevel_Text:SetText(tostring(data))
	end
	
	--Lv
	TargetWuhun_Level_Text:SetText("")

	data = CachedTarget:GetKfsData("LEVEL")
	if data ~= nil then
		TargetWuhun_Level_Text:SetText(tostring(data))
	end
	
	--ExtraLevel
	TargetWuhun_ExtraLevel_Text:SetText("")	
	data = CachedTarget:GetKfsData("EXTRALEVEL")
	if data ~= nil then
		TargetWuhun_ExtraLevel_Text:SetText(tostring(data))
	end
	
	--AttactType
	TargetWuhun_Type:SetText("")

	data = CachedTarget:GetKfsData("ATTACT")
	if data ~= nil and data < 5 and data >= 0 then
		TargetWuhun_Type:SetText(TargetKfs_Att_tips[data + 1])
	end
	
	--Life
	TargetWuhun_Life_Text2:SetText("")

	data = CachedTarget:GetKfsData("LIFE")
	local maxLife = CachedTarget:GetKfsData("MAXLIFE")
	if data ~= nil then
		TargetWuhun_Life_Text2:SetText(tostring(data).."/"..tostring(maxLife))
	end
	
	--Exp
	TargetWuhun_Exp:SetText("#{WH_xml_XX(76)}")

	data = CachedTarget:GetKfsData("EXP")
	local needexp = CachedTarget:GetKfsData("NEEDEXP")
	if data ~= nil then
		TargetWuhun_Exp:SetText("#{WH_xml_XX(76)}"..tostring(data).."/"..tostring(needexp))
	end
	
	--GrowRate
	TargetWuhun_Growth1:SetText("")
	TargetWuhun_Growth1:SetToolTip("")
	TargetWuhun_Growth:SetText("")
	TargetWuhun_Growth:SetToolTip("")
	local grade = CachedTarget:GetKfsData("Grade")
	data = CachedTarget:GetKfsData("GROW")
	if data ~= nil and grade ~= nil then
		TargetWuhun_Growth1:SetText("#{WH_xml_XX(93)}")
		TargetWuhun_Growth1:SetToolTip("#{WH_090729_43}")
	  if grade == 0 then
			TargetWuhun_Growth:SetText("#G#{ZSKSSJ_PT}"..tostring(data))
	  elseif grade  == 1 then
			 TargetWuhun_Growth:SetText("#G#{ZSKSSJ_YX}"..tostring(data))
	  elseif grade == 2 then
	   		TargetWuhun_Growth:SetText("#G#{ZSKSSJ_JC}"..tostring(data))
	  elseif grade == 3 then
	  		TargetWuhun_Growth:SetText("#G#{ZSKSSJ_ZY}"..tostring(data))
	  elseif grade == 4 then
	  		TargetWuhun_Growth:SetText("#G#{ZSKSSJ_WM}"..tostring(data))
	  end
	end
	
	--AttrEx
	local slot = CachedTarget:GetKfsData("SLOT")
	for i=1,TargetKfs_ATTREX_MAX_NUM do	
		
		TargetKfs_AttrEx_Text[i]:SetText("")
		TargetKfs_AttrEx_Value[i]:SetText("")
		
		if slot ~= nil and i <= slot then
			TargetKfs_AttrEx_Text[i]:Show()
			TargetKfs_AttrEx_Value[i]:Show()
		else
			TargetKfs_AttrEx_Text[i]:Hide()
			TargetKfs_AttrEx_Value[i]:Hide()
		end
		
		local iText , iValue = CachedTarget:GetKfsFixAttrEx(i - 1)
		if iText ~= nil and iText ~= "" and iValue ~= nil and iValue > 0  then
			TargetKfs_AttrEx_Text[i]:SetText(iText)
			TargetKfs_AttrEx_Value[i]:SetText("+"..tostring(iValue))
		end
	end
	
	--BaseAttr
	for i=1,5 do	
		TargetKfs_Base_Original_Value[i]:SetText("")
		TargetKfs_Base_Value[i]:SetText("")

		data = CachedTarget:GetKfsBase(i - 1)
		if data ~= nil then
			TargetKfs_Base_Original_Value[i]:SetText("+"..tostring(data))
		end

		data = CachedTarget:GetFixKfsBase(i - 1)
		if data ~= nil then
			TargetKfs_Base_Value[i]:SetText("+"..tostring(data))
		end
	end
	
	--SKills
	TargetKfs_Skills[1]:SetActionItem(-1)
	TargetKfs_Skills[2]:SetActionItem(-1)
	TargetKfs_Skills[3]:SetActionItem(-1)

	local kfsID = -1
	if ActionKFS:GetID() ~= 0 then
		kfsID = ActionKFS:GetItemID();
	end
			
	for i=1, 3 do
		local theAction = EnumAction(kfsID * 3 + i -1 , "kfsskill");
		if theAction:GetID() ~= 0 then
			TargetKfs_Skills[i]:SetActionItem(theAction:GetID());
		end
	end

--	local nSumSkill = GetActionNum("skill");
--	TargetKfs_Skill_ID = {}
--	for i=1,3 do	
--		local skillID = DataPool:GetKfsSkill( i - 1)
--		if skillID ~= nil and skillID > 0 then
--			TargetKfs_Skill_ID[i] = skillID
--		else
--			TargetKfs_Skill_ID[i] = -1
--		end
--	end

--	for i=1, nSumSkill do
--		theAction = EnumAction(i-1, "skill");
--		if theAction:GetOwnerXinfa() == -8888 then			
--			if theAction:GetDefineID() == TargetKfs_Skill_ID[1] then
--				TargetKfs_Skills[1]:SetActionItem(theAction:GetID());
--
--			elseif theAction:GetDefineID() == TargetKfs_Skill_ID[2] then
--				TargetKfs_Skills[2]:SetActionItem(theAction:GetID());
--
--			elseif theAction:GetDefineID() == TargetKfs_Skill_ID[3] then
--				TargetKfs_Skills[3]:SetActionItem(theAction:GetID());
--			end
--		end
--	end

	--Magic
	TargetKfs_Magic:SetProperty("NormalImage" ,"" )
	TargetKfs_Magic:SetToolTip("")
	data = CachedTarget:GetKfsData("MAGIC")
	if data ~= nil and data < 5 and data >= 0 then
		TargetKfs_Magic:SetProperty("Empty", "False")
		if data > 0 then
			TargetKfs_Magic:SetProperty("NormalImage" , TargetKfs_Magic_Image[data] )
		end
		TargetKfs_Magic:SetToolTip(TargetKfs_Magic_tips[data + 1])
	end
end

--model turn left
function TargetWuhun_Model_TurnLeft(start)
	--start
	if(start == 1 and CEArg:GetValue("MouseButton")=="LeftButton") then
		TargetWuhun_FakeObject:RotateBegin(-0.3);
	--stop
	else
		TargetWuhun_FakeObject:RotateEnd();
	end
end

--model turn right
function TargetWuhun_Model_TurnRight(start)
	--start
	if(start == 1 and CEArg:GetValue("MouseButton")=="LeftButton") then
		TargetWuhun_FakeObject:RotateBegin(0.3);
	--stop
	else
		TargetWuhun_FakeObject:RotateEnd();
	end
end

--kfs hidden event
function TargetWuhun_OnHiden()
	TargetWuhun_FakeObject:SetFakeObject("");	
end



--============================================================================================================
-- 打开玩家信息界面
function TargetWuhun_OtherData_Page_Switch()
	Variable:SetVariable("OtherUnionPos", TargetWuhun_Frame:GetProperty("UnifiedPosition"), 1);
	SystemSetup:OpenPrivatePage("other")
end
-- 打开玩家装备UI
function TargetWuhun_OtherEquip_Page_Switch()
	Variable:SetVariable("OtherUnionPos", TargetWuhun_Frame:GetProperty("UnifiedPosition"), 1);
	SystemSetup:OpenEquipFrame("other");
end
-- 打开玩家宠物UI
function TargetWuhun_OtherPet_Page_Switch()
	Variable:SetVariable("OtherUnionPos", TargetWuhun_Frame:GetProperty("UnifiedPosition"), 1);
	SystemSetup:OpenPetFrame("other");
end
--打开玩家骑乘UI
function TargetWuhun_OtherRide_Page_Switch()
	Variable:SetVariable("OtherUnionPos", TargetWuhun_Frame:GetProperty("UnifiedPosition"), 1);
	SystemSetup:OpenRidePage("other");
end
-- 打开玩家博客UI
function TargetWuhun_OtherBlog_Page_Switch()
	Variable:SetVariable("OtherUnionPos", TargetWuhun_Frame:GetProperty("UnifiedPosition"), 1);
	local strCharName =  CachedTarget:GetData("NAME");
	local strAccount =  CachedTarget:GetData("ACCOUNTNAME")
	Blog:OpenBlogPage(strAccount,strCharName,false);
end

function TargetWuhun_Frame_On_ResetPos()
  TargetWuhun_Frame:SetProperty("UnifiedPosition", g_TargetWuhun_Frame_UnifiedPosition);
end