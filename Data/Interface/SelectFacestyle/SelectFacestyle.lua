local g_Facestyle_Icon = {}
local MAX_OBJ_DISTANCE = 3.0;
local g_nCurPage = 0
local g_nCurSelect = 0
local g_Style_Index = {}
local g_Style_Count = 0
local g_Original_Style = 0


--==================================
-- SelectFacestyle_PreLoad
--==================================
function SelectFacestyle_PreLoad()
	this:RegisterEvent("UI_COMMAND");	
	this:RegisterEvent("OBJECT_CARED_EVENT");
	this:RegisterEvent("SEX_CHANGED");	
end

--==================================
-- SelectFacestyle_OnLoad
--==================================
function SelectFacestyle_OnLoad()
	g_Facestyle_Icon[1]		= SelectFacestyle_Skill1_BKG
	g_Facestyle_Icon[2] 	= SelectFacestyle_Skill2_BKG
	g_Facestyle_Icon[3] 	= SelectFacestyle_Skill3_BKG
	g_Facestyle_Icon[4] 	= SelectFacestyle_Skill4_BKG
	g_Facestyle_Icon[5] 	= SelectFacestyle_Skill5_BKG
	g_Facestyle_Icon[6] 	= SelectFacestyle_Skill6_BKG
	g_Facestyle_Icon[7] 	= SelectFacestyle_Skill7_BKG
	g_Facestyle_Icon[8] 	= SelectFacestyle_Skill8_BKG
	g_Facestyle_Icon[9] 	= SelectFacestyle_Skill9_BKG
	g_Facestyle_Icon[10]	= SelectFacestyle_Skill10_BKG
	g_Facestyle_Icon[11]	= SelectFacestyle_Skill11_BKG
	g_Facestyle_Icon[12]	= SelectFacestyle_Skill12_BKG
	
	for i=1, 12  do
		g_Style_Index[i] = -1
	end	

end

--==================================
-- SelectFacestyle_OnEvent
--==================================
function SelectFacestyle_OnEvent(event)
	if ( event == "UI_COMMAND" and tonumber(arg0) == 928) then
		local xx = Get_XParam_INT(0);
		objCared = DataPool : GetNPCIDByServerID(xx);
		if objCared == -1 then
				PushDebugMessage("Dæ li®u cüa server truy«n tr· lÕi có v¤n ð«");
				return;
		end

		if(IsWindowShow("SelectHairstyle")) then
			CloseWindow("SelectHairstyle", true);
		end

		if(IsWindowShow("SelectHairColor")) then
			CloseWindow("SelectHairColor", true);
		end
		
		if(this:IsVisible() and tonumber(g_Original_Style)) then
			DataPool : Change_MyFaceStyle(g_Original_Style);
		end
		SelectFacestyle_OnShown()
		BeginCareObject_SelectFacestyle(objCared)

	elseif (event == "OBJECT_CARED_EVENT") then
		if(not this:IsVisible() ) then
			return;
		end
		if(tonumber(arg0) ~= objCared) then
			Close_Facestyle()
			return;
		end
		--Èç¹ûºÍNPCµÄ¾àÀë´óÓÚÒ»¶¨¾àÀë»òÕß±»É¾³ý£¬×Ô¶¯¹Ø±Õ
		if(arg1 == "distance" and tonumber(arg2)>MAX_OBJ_DISTANCE or arg1=="destroy") then
			
			--È¡Ïû¹ØÐÄ
			Close_Facestyle()
		end
	end
	if event == "SEX_CHANGED" and  this:IsVisible() then
			SelectFacestyle_Model : Hide();
			SelectFacestyle_Model : Show();
			SelectFacestyle_Model:SetFakeObject("Player_Head");
	end

end

--==================================
-- SelectFacestyle_OnShown
--==================================
function SelectFacestyle_OnShown()
	for i,eachstyle in g_Facestyle_Icon do
		eachstyle : SetPushed(0)
	end
	
	g_Original_Style = DataPool : Get_MyFaceStyle();

	SelectFacestyle_Update();
	this:Show();
end

--==================================
-- SelectFacestyle_Update
--==================================
function SelectFacestyle_Update()

	local i,RaceID,ItemID,ItemCount,SelectType,k,IconFile;
	k = 1;
	Current = 1
	local m = 1
	
	for i,eachstyle in g_Facestyle_Icon do
		eachstyle : SetPushed(0)
		eachstyle : SetProperty("NormalImage","")
		eachstyle : SetProperty("HoverImage","")
		eachstyle : SetToolTip("")
	end
	
	for i=0, 200 do
		ItemID,ItemCount,SelectType,IconFile,CostMoney,StyleName = DataPool : Change_MyFaceStyle_Item(i);
		
		if(ItemID ~= -1) then
			IconFile = GetIconFullName(IconFile)
			g_Facestyle_Icon[m]:SetProperty("NormalImage",IconFile)
			g_Facestyle_Icon[m]:SetProperty("HoverImage",IconFile)
			g_Facestyle_Icon[m]:SetToolTip(StyleName)
			g_Style_Index[m] = i
			m = m + 1
		end
	end
	g_Style_Count = m-1
	
	if(g_Style_Count <= 0) then
		SelectFacestyle_Require:SetText("Không có khuôn m£t có th¬ thay ð±i");
		SelectFacestyle_CurrentlyPage:SetText("1/1");
		SelectFacestyle_Model : SetFakeObject( "" );
		SelectFacestyle_Model : SetFakeObject( "Player_Head" );
		SelectFacestyle_PageUp : Disable();
		SelectFacestyle_PageDown : Disable();
		SelectFacestyle_Accept : Disable();
		return;
	end
	
	SelectFacestyle_Model : SetFakeObject( "Player_Head" )

	g_nCurSelect = 0;
	SelectFacestyle_WarningText : SetText("Xin lña ch÷n khuôn m£t tÕi giao di®n phía trên bên phäi, sau ðó ¤n \"xác nh§n\"");
end

--==================================
-- Player_Head_Modle_TurnLeft
--==================================
function SelectFacestyle_Modle_TurnLeft(start)
	local mouse_button = CEArg:GetValue("MouseButton");
	if(mouse_button == "LeftButton") then
		if(start == 1) then
			SelectFacestyle_Model:RotateBegin(-0.3);
		else
			SelectFacestyle_Model:RotateEnd();
		end
	end
end

--==================================
-- Player_Head_Modle_TurnRight
--==================================
function SelectFacestyle_Modle_TurnRight(start)
	local mouse_button = CEArg:GetValue("MouseButton");
	if(mouse_button == "LeftButton") then
		if(start == 1) then
			SelectFacestyle_Model:RotateBegin(0.3);
		else
			SelectFacestyle_Model:RotateEnd();
		end
	end
end

--==================================
-- Close_Facestyle
--==================================
function Close_Facestyle()
	g_HaveChange = 0;
	SelectFacestyle_Model : SetFakeObject( "" );
	StopCareObject_SelectFacestyle(objCared)
	this:Hide();	
end

--==================================
--¿ªÊ¼¹ØÐÄNPC£¬
--==================================
function BeginCareObject_SelectFacestyle(objCaredId)
	g_Object = objCaredId;
	this:CareObject(g_Object, 1, "SelectFacestyle");
end

--==================================
--Í£Ö¹¶ÔÄ³NPCµÄ¹ØÐÄ
--==================================
function StopCareObject_SelectFacestyle(objCaredId)
	this:CareObject(objCaredId, 0, "SelectFacestyle");
	g_Object = -1;

end

--==================================
--¹Ø±Õ
--==================================
function SelectFacestyle_Cancel_Clicked()
	DataPool : Change_MyFaceStyle(g_Original_Style);
	Close_Facestyle()
end

--==================================
--È·ÈÏ
--==================================
function SelectFacestyle_OK_Clicked()
	-- Ã»ÓÐÑ¡ÔñÁ³ÐÍ
	if(g_nCurSelect == 0 )then
		PushDebugMessage("Xin lña 1 mô hình di®n mÕo.");
		return;
	end

	local ItemID
	local ItemCount
	local SelectType
	local IconFile
	local CostMoney
	
	-- µÃµ½Ñ¡ÔñµÄÁ³ÐÍÐÅÏ¢
	ItemID,ItemCount,SelectType,IconFile,CostMoney = DataPool : Change_MyFaceStyle_Item(g_Style_Index[g_nCurSelect]);

	-- ¼ì²éµÀ¾ß
	if(ItemID ~= -1 and SelectType >= 2) then
		if( DataPool:GetPlayerMission_ItemCountNow(ItemID) < ItemCount) then
			PushDebugMessage("Thiªu Ð¸nh Nhan Châu");
			return;
		end
	end
	
	-- µÃµ½Íæ¼ÒµÄ½ð±ÒºÍ½»×ÓÊýÄ¿
	local nMoney = Player:GetData("MONEY")
	local nMoneyJZ = Player:GetData("MONEY_JZ")
	
	if (nMoney + nMoneyJZ) < CostMoney then
		PushDebugMessage("Ngân lßþng không ðü");
		return
	end
	
	-- µ÷ÊÔÐÅÏ¢£¬µ±Ç°Ñ¡ÔñµÄÁ³ÐÍID
	--PushDebugMessage ("StyleId = "..g_Style_Index[g_nCurSelect])
	-- Èç¹ûÑ¡ÔñµÄÁ³ÐÍºÍµ±Ç°Á³ÐÍ²»Í¬
	if g_Style_Index[g_nCurSelect] ~= g_Original_Style then

		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("FinishAdjust");
			Set_XSCRIPT_ScriptID(805029);
			Set_XSCRIPT_Parameter(0,g_Style_Index[g_nCurSelect]);
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
		Close_Facestyle();
		
	else

		PushDebugMessage("Xin hãy ch÷n 1 loÕi khuôn m£t khác v¾i lúc trß¾c ðó.");

	end
	
end

--==================================
--Ñ¡ÖÐÒ»¸öÍ¼±ê
--==================================
function SelectFacestyle_Clicked(nIndex)
	
	if nIndex > g_Style_Count  then
		return
	end
	if(g_nCurSelect > 0 )then
		g_Facestyle_Icon[g_nCurSelect]:SetPushed(0);
	end
	g_nCurSelect = nIndex
	g_Facestyle_Icon[g_nCurSelect]:SetPushed(1);

	local ItemID,ItemCount,SelectType,IconFile,CostMoney = DataPool : Change_MyFaceStyle_Item(g_Style_Index[nIndex]);
	local name,icon = LifeAbility : GetPrescr_Material(ItemID);

	SelectFacestyle_WarningText : SetText("C¥n ðÕo cø: #G"..name.."#r#W C¥n tiêu hao: #Y#{_EXCHG"..CostMoney.."}#W#rXin ch÷n hình khuôn m£t trên hình góc phäi phía trên, sau ðó ¤n \"Xác nh§n\".");
	DataPool : Change_MyFaceStyle(g_Style_Index[nIndex])
	g_HaveChange = 1

end

