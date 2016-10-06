local SELFEQUIP_TAB_TEXT = {}
local XIULIAN_BOOKS = {}
local XIULIAN_MIJI = {}
local XIULIAN_MIJI_TEXT = {}

local XIULIAN_BOOK_SELECT = 1;
local XIULIAN_MIJI_SELECT = -1;

local MIJI_CAN_SELECT = false;

local XinfaID = 1
local Xiulian_CongLuc = 0;
local Xiulian_CuongLuc = 0;
local Xiulian_NoiLuc = 0;
local Xiulian_TheLuc = 0;
local Xiulian_TriLuc = 0;
local Xiulian_ThanPhap = 0;
-- �����Ĭ�����λ��
local g_Xiulian_Frame_UnifiedXPosition;
local g_Xiulian_Frame_UnifiedYPosition;

function Xiulian_PreLoad()
	
	-- �򿪽���
	this:RegisterEvent("OPEN_XIULIAN_PAGE");
	
	--�뿪�������Զ��ر�
	this:RegisterEvent("PLAYER_LEAVE_WORLD");
	this:RegisterEvent("UNIT_XIULIAN");
	this:RegisterEvent("UINT_POWER");
	this:RegisterEvent("UI_COMMAND");
	-- ��Ϸ���ڳߴ緢���˱仯
	this:RegisterEvent("ADJEST_UI_POS")

	-- ��Ϸ�ֱ��ʷ����˱仯
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")

end

function Xiulian_OnLoad()

	XIULIAN_BOOKS[1] = Xiulian_XinfaSkill_1
	XIULIAN_BOOKS[2] = Xiulian_XinfaSkill_2
	XIULIAN_BOOKS[3] = Xiulian_XinfaSkill_3
	XIULIAN_BOOKS[4] = Xiulian_XinfaSkill_4

	XIULIAN_MIJI[1] = Xiulian_ZhaoshiSkill_1
	XIULIAN_MIJI[2] = Xiulian_ZhaoshiSkill_2
	XIULIAN_MIJI[3] = Xiulian_ZhaoshiSkill_3
	XIULIAN_MIJI[4] = Xiulian_ZhaoshiSkill_4
	XIULIAN_MIJI[5] = Xiulian_ZhaoshiSkill_5
	XIULIAN_MIJI[6] = Xiulian_ZhaoshiSkill_6
	
	XIULIAN_MIJI_TEXT[1] = Xiulian_ZhaoshiSkill_level1
	XIULIAN_MIJI_TEXT[2] = Xiulian_ZhaoshiSkill_level2
	XIULIAN_MIJI_TEXT[3] = Xiulian_ZhaoshiSkill_level3
	XIULIAN_MIJI_TEXT[4] = Xiulian_ZhaoshiSkill_level4
	XIULIAN_MIJI_TEXT[5] = Xiulian_ZhaoshiSkill_level5
	XIULIAN_MIJI_TEXT[6] = Xiulian_ZhaoshiSkill_level6

	-- ��������Ĭ�����λ��
	g_Xiulian_Frame_UnifiedXPosition	= Xiulian_Frame : GetProperty("UnifiedXPosition");
	g_Xiulian_Frame_UnifiedYPosition	= Xiulian_Frame : GetProperty("UnifiedYPosition");

end

-- OnEvent
function Xiulian_OnEvent(event)
	if (event == "UI_COMMAND" and tonumber(arg0) == 20111212) then
		Xiulian_SetTabState()
		Xiulian_CongLuc = Get_XParam_INT(0);
		Xiulian_CuongLuc = Get_XParam_INT(1);
		Xiulian_NoiLuc = Get_XParam_INT(2);
		Xiulian_TheLuc = Get_XParam_INT(3);
		Xiulian_TriLuc = Get_XParam_INT(4);
		Xiulian_ThanPhap = Get_XParam_INT(5);
		
		if Xiulian_CuongLuc == -1 then
			Xiulian_CuongLuc = 0
		end
		if Xiulian_NoiLuc == -1 then
			Xiulian_NoiLuc = 0
		end
		if Xiulian_TheLuc == -1 then
			Xiulian_TheLuc = 0
		end
		if Xiulian_TriLuc == -1 then
			Xiulian_TriLuc = 0
		end
		if Xiulian_ThanPhap == -1 then
			Xiulian_ThanPhap = 0
		end

		if(this:IsVisible()) then
			this:Hide();
			return;
		end
		local selfUnionPos = Variable:GetVariable("SelfUnionPos");
	    if(selfUnionPos ~= nil) then
		    Xiulian_Frame:SetProperty("UnifiedPosition", selfUnionPos);
    	end
		XIULIAN_BOOK_SELECT = 1;
		XIULIAN_MIJI_SELECT = -1;
		this:Show();
		Xiulian_Update()
	end
	if( event == "PLAYER_LEAVE_WORLD") then
		this:Hide();
		return;
	end
	
	-- if( event == "UNIT_XIULIAN" ) then
	--     for i = 1, 4 do
	-- 		local theAction = EnumAction(i - 1, "xiulianbook")
	-- 		if(theAction:GetID() ~= 0) then
	-- 			XIULIAN_BOOKS[i] : SetActionItem(theAction:GetID())
	-- 		end
	-- 	end
	-- 	Xiulian_JingJie_Selected_Update()
	-- 	Xiulian_Skill_Clicked_Update()
	-- 	Xiulian_SetSelectState()
	-- end
	
	-- if(event == "UINT_POWER" ) then
 --             --���ù���
 --            Xiulian_Gongli_Text:SetText("#{XL_XML_87}") 
 --            local nPower =  Player:GetData("POWER")
	--     Xiulian_Vigor:SetText(nPower.."/100") 	
	-- end

	local Xinfa1 = GemCarve:UpdateProductAction( 32002001 )
	local Xinfa2 = GemCarve:UpdateProductAction( 32002002 )
	local Xinfa3 = GemCarve:UpdateProductAction( 32002003 )
	local Skill1 = GemCarve:UpdateProductAction( 32002004 )
	local Skill2 = GemCarve:UpdateProductAction( 32002005 )
	local Skill3 = GemCarve:UpdateProductAction( 32002006 )
	local Skill4 = GemCarve:UpdateProductAction( 32002007 )
	local Skill5 = GemCarve:UpdateProductAction( 32002008 )
	
	Xiulian_XinfaSkill_1:SetActionItem(Xinfa1 : GetID());
	Xiulian_XinfaSkill_2:SetActionItem(Xinfa2 : GetID());
	Xiulian_XinfaSkill_3:SetActionItem(Xinfa3 : GetID());
	Xiulian_XinfaSkill_4:SetActionItem(-1);
	
	Xiulian_ZhaoshiSkill_1:SetActionItem(Skill1 : GetID());
	Xiulian_ZhaoshiSkill_2:SetActionItem(Skill2 : GetID());
	Xiulian_ZhaoshiSkill_3:SetActionItem(Skill3 : GetID());
	Xiulian_ZhaoshiSkill_4:SetActionItem(Skill4 : GetID());
	Xiulian_ZhaoshiSkill_5:SetActionItem(Skill5 : GetID());
	Xiulian_ZhaoshiSkill_6:SetActionItem(-1);


	Xiulian_SkillIcon:SetActionItem(Xinfa1 : GetID());
	Xiulian_SkillName:SetText("#HNg� H�nh B�o �i�n")
	Xiulian_SkillJingjie:SetText("Ю nh�t B�o �i�n")
	Xiulian_SkillLevel:SetText("S� l��ng b� t�ch: #G5")
	Xiulian_SkillInfo:SetText("#{XL_XML_03}#r#W#{XL_XML_04}")
	
    Xiulian_Gongli_Text:SetText("#{XL_XML_87}")
	Xiulian_Vigor:SetText(Xiulian_CongLuc.."/100")

	-- ��Ϸ���ڳߴ緢���˱仯
	if (event == "ADJEST_UI_POS" ) then
		-- ���±�������λ��
		Xiulian_Frame_On_ResetPos()

	-- ��Ϸ�ֱ��ʷ����˱仯
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		-- ���±�������λ��	
		Xiulian_Frame_On_ResetPos()
	end

end

function Xiulian_SelfEquip_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Xiulian_Frame:GetProperty("UnifiedPosition"), 1);
	OpenEquip(1);
end

function Xiulian_Pet_Switch()
	Variable:SetVariable("SelfUnionPos", Xiulian_Frame:GetProperty("UnifiedPosition"), 1);
	TogglePetPage();
end

function Xiulian_Ride_Switch()
	Variable:SetVariable("SelfUnionPos", Xiulian_Frame:GetProperty("UnifiedPosition"), 1);
	OpenRidePage();
end

function Xiulian_SelfData_Switch()
	Variable:SetVariable("SelfUnionPos", Xiulian_Frame:GetProperty("UnifiedPosition"), 1);
	SystemSetup:OpenPrivatePage("self");
end

function Xiulian_Blog_Switch()
	local strCharName =  Player:GetName();
	local strAccount =  Player:GetData("ACCOUNTNAME")
	Blog:OpenBlogPage(strAccount,strCharName,true);

end

function Xiulian_Xiulian_Switch()
    Xiulian_Xiulian:SetCheck(1)
end

function Xiulian_Other_Info_Page_Switch()
	Variable:SetVariable("SelfUnionPos", Xiulian_Frame:GetProperty("UnifiedPosition"), 1);
	OtherInfoPage();
end

function Xiulian_Wuhun_Switch()
	Variable:SetVariable("SelfUnionPos", Xiulian_Frame:GetProperty("UnifiedPosition"), 1);
	PushEvent("UI_COMMAND",20111211)
end

function Xiulian_SetTabState()
	Xiulian_SelfEquip:SetCheck(0)
	Xiulian_Wuhun:SetCheck(0)
	Xiulian_SelfData:SetCheck(0)
	Xiulian_Blog:SetCheck(0)
	Xiulian_Pet:SetCheck(0)
	Xiulian_Xiulian:SetCheck(1)
	Xiulian_Ride:SetCheck(0)
	Xiulian_OtherInfo:SetCheck(0)
end

function Xiulian_Xinfa_Clicked(nIndex)
	-- if(nIndex < 3) then
	-- 	XIULIAN_BOOK_SELECT = nIndex
	-- 	XIULIAN_MIJI_SELECT = -1
	-- 	Xiulian_JingJie_Selected_Update()
	-- else
	--     PushDebugMessage("#{XL_090707_50}")
	-- end
	if(nIndex < 4 and nIndex > 0) then
		XinfaID = nIndex
		Xiulian_JingJie_Selected_Update(nIndex)
	else
	    PushDebugMessage("#{XL_090707_50}")
	end
end
--===============================================
-- ���� 
--===============================================
function Xiulian_Update()
	-- for i = 1, 4 do
	-- 	local theAction = EnumAction(i - 1, "xiulianbook")
	-- 	if(theAction:GetID() ~= 0) then
	-- 		XIULIAN_BOOKS[i] : SetActionItem(theAction:GetID())
	-- 	end
	-- end
 --    Xiulian_JingJie_Selected_Update()
 --    --���ù���
 --    Xiulian_Gongli_Text:SetText("#{XL_XML_87}") 
 --    local nPower =  Player:GetData("POWER")
	-- Xiulian_Vigor:SetText(nPower.."/100") 	

	for i = 1, 3 do
		local theAction = EnumAction(i - 1, "xiulianbook")
		if(theAction:GetID() ~= 0) then
			if i == 3 then
				--��3����Ҫ��ɽ�������
				if Player:GetXiuLianBookInfo(2,"HasActived") == 1 then
					XIULIAN_BOOKS[i] : SetActionItem(theAction:GetID())
				end
			else
				XIULIAN_BOOKS[i] : SetActionItem(theAction:GetID())
			end
		end
	end
    Xiulian_JingJie_Selected_Update()
    --���ù���
    Xiulian_Gongli_Text:SetText("#{XL_XML_87}")
    local nPower =  Player:GetData("POWER")
	Xiulian_Vigor:SetText(nPower.."/100")
end

--===============================================
-- �ر� 
--===============================================
function Xiulian_Close_Cilcked()
		this:Hide()
end

function Xiulian_Skill_Clicked(nIndex)
	-- if MIJI_CAN_SELECT == false then
	-- 	return
	-- end
	-- if(XIULIAN_BOOK_SELECT == 1) then
	--    if (nIndex ~= 6)  then
 --         XIULIAN_MIJI_SELECT  = nIndex
	--    else
	--      XIULIAN_MIJI_SELECT  = -1
	--    end
	-- elseif(XIULIAN_BOOK_SELECT == 2)  then
	--      XIULIAN_MIJI_SELECT  = nIndex + 5
	-- else
 --         XIULIAN_MIJI_SELECT = -1
	-- end
	-- Xiulian_Skill_Clicked_Update()

	if XinfaID == 1 then
		if nIndex == 1 then
			local Skill1 = GemCarve:UpdateProductAction( 32002004 )
			Xiulian_SkillIcon:SetActionItem(Skill1 : GetID());
			Xiulian_SkillName:SetText("#GL�c B�t S�n H� Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_CuongLuc/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GC߶ng l�c +"..Xiulian_CuongLuc)
			Xiulian_SkillInfo:SetText("#{XL_XML_05}#r#W#{XL_XML_06}")
		end
		if nIndex == 2 then
			local Skill2 = GemCarve:UpdateProductAction( 32002005 )
			Xiulian_SkillIcon:SetActionItem(Skill2 : GetID());
			Xiulian_SkillName:SetText("#GKh� Qu�n Tr߶ng H�ng Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_NoiLuc/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GN�i l�c +"..Xiulian_NoiLuc)
			Xiulian_SkillInfo:SetText("#{XL_XML_07}#r#W#{XL_XML_08}")
		end
		if nIndex == 3 then
			local Skill3 = GemCarve:UpdateProductAction( 32002006 )
			Xiulian_SkillIcon:SetActionItem(Skill3 : GetID());
			Xiulian_SkillName:SetText("#GKim Cang B�t B�i Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_TheLuc/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GTh� l�c +"..Xiulian_TheLuc)
			Xiulian_SkillInfo:SetText("#{XL_XML_09}#r#W#{XL_XML_10}")
		end
		if nIndex == 4 then
			local Skill4 = GemCarve:UpdateProductAction( 32002007 )
			Xiulian_SkillIcon:SetActionItem(Skill4 : GetID());
			Xiulian_SkillName:SetText("#GH�i N�p B�ch Xuy�n Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_TriLuc/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GTr� l�c +"..Xiulian_TriLuc)
			Xiulian_SkillInfo:SetText("#{XL_XML_11}#r#W#{XL_XML_12}")
		end
		if nIndex == 5 then
			local Skill5 = GemCarve:UpdateProductAction( 32002008 )
			Xiulian_SkillIcon:SetActionItem(Skill5 : GetID());
			Xiulian_SkillName:SetText("#GT�t Phong Ho� �nh Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_ThanPhap/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GTh�n ph�p +"..Xiulian_ThanPhap)
			Xiulian_SkillInfo:SetText("#{XL_XML_13}#r#W#{XL_XML_14}")
		end
		if nIndex == 6 then
			Xiulian_SkillIcon:SetActionItem(-1);
			Xiulian_SkillName:SetText("")
			Xiulian_SkillJingjie:SetText("")
			Xiulian_SkillLevel:SetText("")
			Xiulian_SkillInfo:SetText("")
		end
	end
	
	if XinfaID == 2 then
		if nIndex == 1 then
			local Skill1 = GemCarve:UpdateProductAction( 32002009 )
			Xiulian_SkillIcon:SetActionItem(Skill1 : GetID());
			Xiulian_SkillName:SetText("#G��o H�i Phi�n Giang Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_CuongLuc/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GNgo�i c�ng +"..Xiulian_CuongLuc*8)
			Xiulian_SkillInfo:SetText("#{XL_XML_17}#r#W#{XL_XML_18}")
		end
		if nIndex == 2 then
			local Skill2 = GemCarve:UpdateProductAction( 32002010 )
			Xiulian_SkillIcon:SetActionItem(Skill2 : GetID());
			Xiulian_SkillName:SetText("#GT�ch Th�y Xuy�n Th�ch Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: ")
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GN�i c�ng +"..Xiulian_NoiLuc*8)
			Xiulian_SkillInfo:SetText("#{XL_XML_19}#r#W#{XL_XML_20}")
		end
		if nIndex == 3 then
			local Skill3 = GemCarve:UpdateProductAction( 32002011 )
			Xiulian_SkillIcon:SetActionItem(Skill3 : GetID());
			Xiulian_SkillName:SetText("#Gаng T߶ng Thi�t B�ch Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_TheLuc/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GNgo�i th� +"..Xiulian_TheLuc*8)
			Xiulian_SkillInfo:SetText("#{XL_XML_21}#r#W#{XL_XML_22}")
		end
		if nIndex == 4 then
			local Skill4 = GemCarve:UpdateProductAction( 32002012 )
			Xiulian_SkillIcon:SetActionItem(Skill4 : GetID());
			Xiulian_SkillName:SetText("#GKh� иnh S�n H� Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_TriLuc/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GN�i Th� +"..Xiulian_TriLuc*8)
			Xiulian_SkillInfo:SetText("#{XL_XML_23}#r#W#{XL_XML_24}")
		end
		if nIndex == 5 then
			local Skill5 = GemCarve:UpdateProductAction( 32002013 )
			Xiulian_SkillIcon:SetActionItem(Skill5 : GetID());
			Xiulian_SkillName:SetText("B�ch B�t Th�t Nh�t Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_ThanPhap/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GCh�nh x�c +"..Xiulian_ThanPhap*8)
			Xiulian_SkillInfo:SetText("#{XL_XML_25}#r#W#{XL_XML_26}")
		end
		if nIndex == 6 then
			local Skill6 = GemCarve:UpdateProductAction( 32002014 )
			Xiulian_SkillIcon:SetActionItem(Skill6 : GetID());
			Xiulian_SkillName:SetText("#GCao Phi Vi�n T�p Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_ThanPhap/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GN� tr�nh +"..Xiulian_ThanPhap*4)
			Xiulian_SkillInfo:SetText("#{XL_XML_27}#r#W#{XL_XML_28}")
		end
	end
	
	if XinfaID == 3 then
		if nIndex == 1 then
			local Skill1 = GemCarve:UpdateProductAction( 32002015 )
			Xiulian_SkillIcon:SetActionItem(Skill1 : GetID());
			Xiulian_SkillName:SetText("#GTh� Thi�u D߽ng Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_TheLuc/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GSinh l�c +"..Xiulian_TheLuc*100)
			Xiulian_SkillInfo:SetText("�nh h߷ng hi�u qu� c�a #GTh� Thi�u D߽ng M�ch B� Ph�p#W. C�p c�ng cao, hi�u qu� c�ng t�t.#rKhi tu luy�n �n c�p cao nh�t, c�n �n ch� #G��i L� (242,31) #RT�o иa Th�n T�ng#W � #Yt�ng c�nh gi�i tu luy�n#W m�i c� th� ti�p t�c tu luy�n.#r#GCh� �: Hi�u qu� b� ph�p ch�u �nh h߷ng b�i c�p tu luy�n, ��nh gi� v� c�p ti�n c�p c�a b�o th�ch. ��nh gi� quy�t �nh b�i c�p ph�n quy�n H�o Thi�n Ch�n Kinh, c�p ti�n c�p c�a b�o th�ch quy�t �nh b�i ��nh gi� b�o th�ch ���c t�ng l�n khi m�c trang b� kh�m b�o th�ch.")
		end
		if nIndex == 2 then
			local Skill2 = GemCarve:UpdateProductAction( 32002016 )
			Xiulian_SkillIcon:SetActionItem(Skill2 : GetID());
			Xiulian_SkillName:SetText("#GT�c Th�i �m Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_TriLuc/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GKh� +"..Xiulian_TriLuc*20)
			Xiulian_SkillInfo:SetText("�nh h߷ng hi�u qu� c�a #GT�c Th�i �m M�ch B� Ph�p#W. C�p c�ng cao, hi�u qu� c�ng t�t.#rKhi tu luy�n �n c�p cao nh�t, c�n �n #G��i L� (242,31) #RT�o иa Th�n T�ng#W � #Yt�ng c�nh gi�i tu luy�n#W m�i c� th� ti�p t�c tu luy�n.#r#GCh� �: Hi�u qu� b� ph�p ch�u �nh h߷ng b�i c�p tu luy�n, ��nh gi� v� c�p ti�n c�p c�a b�o th�ch. ��nh gi� quy�t �nh b�i c�p ph�n quy�n H�o Thi�n Ch�n Kinh, c�p ti�n c�p c�a b�o th�ch quy�t �nh b�i ��nh gi� b�o th�ch ���c t�ng l�n khi m�c trang b� kh�m b�o th�ch.")
		end
		if nIndex == 3 then
			local Skill3 = GemCarve:UpdateProductAction( 32002017 )
			Xiulian_SkillIcon:SetActionItem(Skill3 : GetID());
			Xiulian_SkillName:SetText("#Gаng T߶ng Thi�t B�ch Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_ThanPhap/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GCh� m�ng +"..math.floor(Xiulian_ThanPhap/16))
			Xiulian_SkillInfo:SetText("�nh h߷ng hi�u qu� c�a #GNh�m M�ch B� Ph�p#W. C�p c�ng cao, hi�u qu� c�ng t�t.#rKhi tu luy�n �n c�p cao nh�t, c�n �n ch� #G��i L� (242,31) #RT�o иa Th�n T�ng#W � #Yt�ng c�nh gi�i tu luy�n#W m�i c� th� ti�p t�c tu luy�n.#r#GCh� �: Hi�u qu� b� ph�p ch�u �nh h߷ng b�i c�p tu luy�n, ��nh gi� v� c�p ti�n c�p c�a b�o th�ch. ��nh gi� quy�t �nh b�i c�p ph�n quy�n H�o Thi�n Ch�n Kinh, c�p ti�n c�p c�a b�o th�ch quy�t �nh b�i ��nh gi� b�o th�ch ���c t�ng l�n khi m�c trang b� kh�m b�o th�ch.")
		end
		if nIndex == 4 then
			local Skill4 = GemCarve:UpdateProductAction( 32002018 )
			Xiulian_SkillIcon:SetActionItem(Skill4 : GetID());
			Xiulian_SkillName:SetText("#GЯc M�ch Quy�n")
			Xiulian_SkillJingjie:SetText("T�ng tu luy�n: #G"..math.floor(Xiulian_ThanPhap/10))
			Xiulian_SkillLevel:SetText("Hi�u qu�: #GKh�ng ch� m�ng +"..math.floor(Xiulian_ThanPhap/16))
			Xiulian_SkillInfo:SetText("�nh h߷ng hi�u qu� c�a #GЯc M�ch B� Ph�p#W. C�p c�ng cao, hi�u qu� c�ng t�t.#rKhi tu luy�n �n c�p cao nh�t, c�n �n ch� #G��i L� (242,31) #RT�o иa Th�n T�ng#W � #Yt�ng c�nh gi�i tu luy�n#W m�i c� th� ti�p t�c tu luy�n.#r#GCh� �: Hi�u qu� b� ph�p ch�u �nh h߷ng b�i c�p tu luy�n, ��nh gi� v� c�p ti�n c�p c�a b�o th�ch. ��nh gi� quy�t �nh b�i c�p ph�n quy�n H�o Thi�n Ch�n Kinh, c�p ti�n c�p c�a b�o th�ch quy�t �nh b�i ��nh gi� b�o th�ch ���c t�ng l�n khi m�c trang b� kh�m b�o th�ch.")
		end
		if nIndex == 5 then
			Xiulian_SkillIcon:SetActionItem(-1);
			Xiulian_SkillName:SetText("")
			Xiulian_SkillJingjie:SetText("")
			Xiulian_SkillLevel:SetText("")
			Xiulian_SkillInfo:SetText("")
		end
		if nIndex == 6 then
			Xiulian_SkillIcon:SetActionItem(-1);
			Xiulian_SkillName:SetText("")
			Xiulian_SkillJingjie:SetText("")
			Xiulian_SkillLevel:SetText("")
			Xiulian_SkillInfo:SetText("")
		end
	end
end

function  Xiulian_Skill_Clicked_Update()
	-- Xiulian_SetSelectState()
 --    	--ˢ���м�ͼ��
	-- if (XIULIAN_MIJI_SELECT ~= -1)   then
 --        --PushDebugMessage("Refresh XiuLian MiJi--"..XIULIAN_MIJI_SELECT)
	-- 	local	theAction = EnumAction(XIULIAN_MIJI_SELECT-1, "xiulianmiji")
	-- 	Xiulian_SkillIcon : SetActionItem(theAction:GetID())
	-- 	local XiuLianMiJiName = Player:GetXiuLianMiJiInfo(XIULIAN_MIJI_SELECT-1,"Name");
	-- 	local XiuLianMiJiJingJie = Player:GetXiuLianMiJiInfo(XIULIAN_MIJI_SELECT-1,"JingJie")
	-- 	local XiuLianMiJiLevel = Player:GetXiuLianMiJiInfo(XIULIAN_MIJI_SELECT-1,"Level")
	-- 	local CurMaxLevel = Player:GetXiuLianMiJiInfo(XIULIAN_MIJI_SELECT-1,"MaxLevel")
	-- 	local XiuLianMiJiExplain = Player:GetXiuLianMiJiInfo(XIULIAN_MIJI_SELECT-1,"Explain")
		
	-- 	local StrJingJie = "#{XL_XML_32}".."#{XL_XML_85}"..XiuLianMiJiJingJie.."#{XL_XML_86}"
	-- 	local StrDengJi = "#{XL_XML_33}"..XiuLianMiJiLevel.."/"..CurMaxLevel
		
	-- 	Xiulian_SkillName:SetText(XiuLianMiJiName);
	-- 	Xiulian_SkillJingjie:SetText(StrJingJie);
	-- 	Xiulian_SkillLevel:SetText(StrDengJi);
	-- 	local strCondition
	-- 	if(XIULIAN_BOOK_SELECT == 1) then
	-- 		if(Player:GetData("LEVEL") >= 70) then
	-- 			strCondition = "\n#G#{XL_XML_30}" 
	-- 		else
	-- 			strCondition = "\n#cff0000#{XL_XML_30}" 
	-- 		end
	-- 	else
	-- 		local XiuLianBook1Level = Player:GetXiuLianBookInfo(0,"Level")
	-- 		if (XiuLianBook1Level >= 3) then
	-- 			strCondition = "\n#G#{XL_XML_34}" 
	-- 		else
	-- 			strCondition = "\n#cff0000#{XL_XML_34}"
	-- 		end
	-- 	end 
	-- 	Xiulian_SkillInfo:SetText(XiuLianMiJiExplain.."\n#{XL_XML_31}"..strCondition);
		
	-- else
	-- 	if(XIULIAN_BOOK_SELECT == -1)	then
	-- 		Xiulian_SkillIcon : SetActionItem(-1)
	-- 	end
	-- end
	

end

--===============================================
-- ѡ�����������ˢ�� 
--===============================================
function  Xiulian_JingJie_Selected_Update()

 --    if XIULIAN_BOOK_SELECT == 1  then
	-- 	for i = 1, 5 do
	-- 		local theAction = EnumAction(i - 1, "xiulianmiji")
	-- 		if theAction ~= 0 then
	-- 			XIULIAN_MIJI[i] : SetActionItem(theAction:GetID())
	-- 			local CurMaxLevel  = Player:GetXiuLianMiJiInfo(i - 1,"MaxLevel")
	-- 			local XiuLianMiJiLevel = Player:GetXiuLianMiJiInfo(i - 1,"Level")
	-- 			if (CurMaxLevel == nil) or (XiuLianMiJiLevel == nil) then
	-- 				MIJI_CAN_SELECT =false
	-- 				return
	-- 			else
	-- 				MIJI_CAN_SELECT =true
	-- 			end
	-- 			XIULIAN_MIJI_TEXT[i]:SetText(XiuLianMiJiLevel.."/"..CurMaxLevel);
	-- 		end
	-- 	end
	-- 	XIULIAN_MIJI[6] : SetActionItem(-1)
	-- 	XIULIAN_MIJI_TEXT[6]:SetText("");
	-- elseif XIULIAN_BOOK_SELECT == 2  then
	--     for i = 1, 6 do
	-- 		local theAction = EnumAction(i + 5 - 1, "xiulianmiji")
	-- 		if theAction ~= 0 then
	-- 	        XIULIAN_MIJI[i] : SetActionItem(theAction:GetID())
	-- 	        local CurMaxLevel = Player:GetXiuLianMiJiInfo(i + 5 - 1,"MaxLevel")
	-- 	        local XiuLianMiJiLevel = Player:GetXiuLianMiJiInfo(i + 5 - 1,"Level")
	-- 	        if (CurMaxLevel == nil) or (XiuLianMiJiLevel == nil) then
	-- 	        	MIJI_CAN_SELECT =false
	-- 				return
	-- 	        else
	-- 	        	MIJI_CAN_SELECT =true
	-- 			end
	-- 	        XIULIAN_MIJI_TEXT[i]:SetText(XiuLianMiJiLevel.."/"..CurMaxLevel);
	-- 		end
	-- 	end
	-- else
	-- 	for i=1, 6 do
	--         XIULIAN_MIJI[i] : SetActionItem(-1)
	--         XIULIAN_MIJI_TEXT[i]:SetText("")
	-- 	end
	-- end
	-- Xiulian_SetSelectState() 
 --    	--ˢ���м�ͼ��
	-- if (XIULIAN_BOOK_SELECT ~= -1)   then
	-- 	local theAction = EnumAction(XIULIAN_BOOK_SELECT-1, "xiulianbook")
	-- 	Xiulian_SkillIcon : SetActionItem(theAction:GetID())
	-- 	--PushDebugMessage("BOOK ID is --"..theAction:GetID())
	-- 	local XiuLianBookName = Player:GetXiuLianBookInfo(XIULIAN_BOOK_SELECT-1,"Name");
	-- 	local XiuLianBookLevel = Player:GetXiuLianBookInfo(XIULIAN_BOOK_SELECT-1,"Level")
	-- 	local XiuLianBookExplain = Player:GetXiuLianBookInfo(XIULIAN_BOOK_SELECT-1,"Explain")
		
	
	-- 	local StrJingJie = "#{XL_XML_29}".."#{XL_XML_85}"..XiuLianBookLevel.."#{XL_XML_86}"
	
	-- 	Xiulian_SkillName:SetText(XiuLianBookName);
	-- 	Xiulian_SkillJingjie:SetText(StrJingJie);
	-- 	Xiulian_SkillLevel:SetText("");
	-- 	local strCondition
	-- 	if(XIULIAN_BOOK_SELECT == 1) then
	-- 		if(Player:GetData("LEVEL") >= 70) then
	-- 			strCondition = "\n#G#{XL_XML_30}" 
	-- 		else
	-- 			strCondition = "\n#cff0000#{XL_XML_30}" 
	-- 		end
	-- 	else
	-- 		local XiuLianBook1Level = Player:GetXiuLianBookInfo(0,"Level")
	-- 		if (XiuLianBook1Level >= 3) then
	-- 			strCondition = "\n#G#{XL_XML_34}" 
	-- 		else
	-- 			strCondition = "\n#cff0000#{XL_XML_34}"
	-- 		end
	-- 	end 
	-- 	Xiulian_SkillInfo:SetText(XiuLianBookExplain.."\n#{XL_XML_31}"..strCondition);
	-- else
	--     Xiulian_SkillIcon : SetActionItem(-1)
	-- end

	if nIndex == 1 then
		local Xinfa1 = GemCarve:UpdateProductAction( 32002001 )
		local Skill1 = GemCarve:UpdateProductAction( 32002004 )
		local Skill2 = GemCarve:UpdateProductAction( 32002005 )
		local Skill3 = GemCarve:UpdateProductAction( 32002006 )
		local Skill4 = GemCarve:UpdateProductAction( 32002007 )
		local Skill5 = GemCarve:UpdateProductAction( 32002008 )

		Xiulian_ZhaoshiSkill_1:SetActionItem(Skill1 : GetID());
		Xiulian_ZhaoshiSkill_2:SetActionItem(Skill2 : GetID());
		Xiulian_ZhaoshiSkill_3:SetActionItem(Skill3 : GetID());
		Xiulian_ZhaoshiSkill_4:SetActionItem(Skill4 : GetID());
		Xiulian_ZhaoshiSkill_5:SetActionItem(Skill5 : GetID());
		Xiulian_ZhaoshiSkill_6:SetActionItem(-1);

		Xiulian_SkillIcon:SetActionItem(Xinfa1 : GetID());
		Xiulian_SkillIcon:SetPushed(1)
		Xiulian_SkillName:SetText("#HNg� H�nh B�o �i�n")
		Xiulian_SkillJingjie:SetText("Ю nh�t B�o �i�n")
		Xiulian_SkillLevel:SetText("S� l��ng b� t�ch: #G5")
		Xiulian_SkillInfo:SetText("#{XL_XML_03}#r#W#{XL_XML_04}")
	end
	
	if nIndex == 2 then
		local Xinfa2 = GemCarve:UpdateProductAction( 32002002 )
		local Skill1 = GemCarve:UpdateProductAction( 32002009 )
		local Skill2 = GemCarve:UpdateProductAction( 32002010 )
		local Skill3 = GemCarve:UpdateProductAction( 32002011 )
		local Skill4 = GemCarve:UpdateProductAction( 32002012 )
		local Skill5 = GemCarve:UpdateProductAction( 32002013 )
		local Skill6 = GemCarve:UpdateProductAction( 32002014 )
	
		Xiulian_ZhaoshiSkill_1:SetActionItem(Skill1 : GetID());
		Xiulian_ZhaoshiSkill_2:SetActionItem(Skill2 : GetID());
		Xiulian_ZhaoshiSkill_3:SetActionItem(Skill3 : GetID());
		Xiulian_ZhaoshiSkill_4:SetActionItem(Skill4 : GetID());
		Xiulian_ZhaoshiSkill_5:SetActionItem(Skill5 : GetID());
		Xiulian_ZhaoshiSkill_6:SetActionItem(Skill6 : GetID());

		Xiulian_SkillIcon:SetActionItem(Xinfa2 : GetID());
		Xiulian_SkillName:SetText("#HV� Nhai Di Th�")
		Xiulian_SkillJingjie:SetText("Ю nh� B�o �i�n")
		Xiulian_SkillLevel:SetText("S� l��ng b� t�ch: #G6")
		Xiulian_SkillInfo:SetText("#{XL_XML_15}#r#W#{XL_XML_16}")
	end
	
	if nIndex == 3 then
		local Xinfa3 = GemCarve:UpdateProductAction( 32002003 )
		local Skill1 = GemCarve:UpdateProductAction( 32002015 )
		local Skill2 = GemCarve:UpdateProductAction( 32002016 )
		local Skill3 = GemCarve:UpdateProductAction( 32002017 )
		local Skill4 = GemCarve:UpdateProductAction( 32002018 )
	
		Xiulian_ZhaoshiSkill_1:SetActionItem(Skill1 : GetID());
		Xiulian_ZhaoshiSkill_2:SetActionItem(Skill2 : GetID());
		Xiulian_ZhaoshiSkill_3:SetActionItem(Skill3 : GetID());
		Xiulian_ZhaoshiSkill_4:SetActionItem(Skill4 : GetID());
		Xiulian_ZhaoshiSkill_5:SetActionItem(-1);
		Xiulian_ZhaoshiSkill_6:SetActionItem(-1);
		
		Xiulian_SkillIcon:SetActionItem(Xinfa3 : GetID());
		Xiulian_SkillName:SetText("#HH�o Thi�n Ch�n Kinh")
		Xiulian_SkillJingjie:SetText("Ю tam B�o �i�n")
		Xiulian_SkillLevel:SetText("S� l��ng b� t�ch: #G4")
		Xiulian_SkillInfo:SetText("#{XL_XML_72}#r#W#{XL_XML_73}")
	end
	
end
--===============================================
-- ����ѡ��״̬ 
--===============================================
function Xiulian_SetSelectState()

  	for i=1, 2 do 
  	  if(i == XIULIAN_BOOK_SELECT) then
  	       XIULIAN_BOOKS[i]:SetPushed(1)
  	  else
  	       XIULIAN_BOOKS[i]:SetPushed(0)
  	  end
	end 
	for i=1, 6 do
		if((XIULIAN_MIJI_SELECT <= 5 and i==XIULIAN_MIJI_SELECT) or (XIULIAN_MIJI_SELECT > 5 and i == XIULIAN_MIJI_SELECT - 5)) then
			XIULIAN_MIJI[i]:SetPushed(1);
		else
			XIULIAN_MIJI[i]:SetPushed(0);
		end
	end 
end
--================================================
-- �ָ������Ĭ�����λ��
--================================================
function Xiulian_Frame_On_ResetPos()

	Xiulian_Frame : SetProperty("UnifiedXPosition", g_Xiulian_Frame_UnifiedXPosition);
	Xiulian_Frame : SetProperty("UnifiedYPosition", g_Xiulian_Frame_UnifiedYPosition);

end