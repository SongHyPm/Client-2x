--*********************************************
--������װ��������
--*********************************************

local PetEquipSuitUpName = "PetEquipSuitUp"
local g_PetEquipItemPos  = -1
local g_PetEquipItemID	 = -1
local g_PetEquipProductID= -1
local g_ObjCareID		 = -1
local g_ProductNeedMoney = 0
local g_PetEquipUiIndex	 = 19831204
local MAX_OBJ_DISTANCE 	 = 3.0;
local g_PetEquipFunCtrl  = -1	--���ܿ���
--*********************************************
--��̬�ı������Ҫ�ĳ���
--*********************************************
--0��ʾΪ4�Ǽ�װ�����ǽ���   1��ʾΪ5�Ǽ�������װ�����ǽ���
local g_PetEquipUIMark	 = 1

--ѡ��ɾ�����ϵĸ���
local g_PetEquipMaterialNum	 = 0
--��ǰ�ĳɹ���ֵ
local g_SuccessPercent 	 = -1
local g_DynamicConst1 	 = 58
local g_DynamicConst2 	 = 25


local g_PetEquipSuitUp_Frame_UnifiedPosition;

--**********************************************
--�¼�ע��
--**********************************************
function PetEquipSuitUp_PreLoad()
	this:RegisterEvent("UI_COMMAND")
	this:RegisterEvent("UNIT_MONEY")
	this:RegisterEvent("MONEYJZ_CHANGE")
	this:RegisterEvent("RESUME_ENCHASE_GEM")
	this:RegisterEvent("OBJECT_CARED_EVENT")
	this:RegisterEvent("UPDATE_PETEQUIP_UP") --�½�һ���������¼�
	this:RegisterEvent("PACKAGE_ITEM_CHANGED")
	this:RegisterEvent("COMMON_CLIENT_MESSAGE")
	this:RegisterEvent("NEW_DEBUGMESSAGE")
	this:RegisterEvent("ADJEST_UI_POS")
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
end


--**********************************************
--
--**********************************************
function PetEquipSuitUp_OnLoad()
	PetEquipSuitUp_NumberList:ComboBoxAddItem("0",0)
	PetEquipSuitUp_NumberList:ComboBoxAddItem("1",1)
	PetEquipSuitUp_NumberList:ComboBoxAddItem("2",2)
	PetEquipSuitUp_NumberList:ComboBoxAddItem("3",3)
	PetEquipSuitUp_NumberList:ComboBoxAddItem("4",4)
	PetEquipSuitUp_NumberList:ComboBoxAddItem("5",5)
	PetEquipSuitUp_NumberList:SetCurrentSelect(0)
	g_PetEquipSuitUp_Frame_UnifiedPosition=PetEquipSuitUp_Frame:GetProperty("UnifiedPosition");
end


--**********************************************
--�¼���Ӧ
--**********************************************
function PetEquipSuitUp_OnEvent( event )
	if (event == "UI_COMMAND") then
		PetEquipSuitUp_UiCommand(arg0)
	elseif (event == "UNIT_MONEY") then
		PetEquipSuitUp_UnitMoney()
	elseif (event == "MONEYJZ_CHANGE") then
		PetEquipSuitUp_JZMChange()
	elseif (event == "RESUME_ENCHASE_GEM") then
		PetEquipSuitUp_GetDownItem(arg0)
	elseif (event == "OBJECT_CARED_EVENT") then
		PetEquipSuitUp_CareEvent(arg0,arg1,arg2)
	elseif (event == "UPDATE_PETEQUIP_UP") then
		PetEquipSuitUp_Update(arg0,arg1)
	elseif (event == "PACKAGE_ITEM_CHANGED") then
		PetEquipSuitUp_PackageItemChange(arg0)
	elseif (event == "COMMON_CLIENT_MESSAGE") then
		PetEquipSuitUp_CommonClientMessage(arg0)
		
	elseif (event == "ADJEST_UI_POS" ) then
		PetEquipSuitUp_Frame_On_ResetPos()
		
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		PetEquipSuitUp_Frame_On_ResetPos()
	end
end


--**********************************************
--ȷ����ť
--**********************************************
function PetEquipSuitUp_Buttons_Clicked()
	--�Ƿ�ɳ���װ����������
	if (g_PetEquipItemPos == -1 or g_PetEquipProductID == -1) then
		return
	end

	--����ľ�װ����Table�е�ID
	if (g_PetEquipItemID == -1) then
		return
	end

	--�ж���Ʒ�Ƿ�������㹻�ڷ��������ж�

	--�жϽ�Ǯ�ǲ��ǹ�
	local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
	if (selfMoney < g_ProductNeedMoney) then
		PushDebugMessage( "û���㹻�Ľ�Ǯ�����ܽ�������װ��������" )
		return
	end

	local szName, nIndex  = PetEquipSuitUp_NumberList:GetCurrentSelect()
	local nSuccessPercent = g_SuccessPercent + nIndex * 15
	g_PetEquipMaterialNum = nIndex
	if ( nSuccessPercent >= 100 ) then
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("OnPetEquipSuitUp")
			Set_XSCRIPT_ScriptID(800109)
			Set_XSCRIPT_Parameter(0,g_PetEquipItemPos)
			Set_XSCRIPT_Parameter(1,g_ObjCareID)
			Set_XSCRIPT_Parameter(2,g_PetEquipMaterialNum)
			Set_XSCRIPT_ParamCount(3)
		Send_XSCRIPT()
		PetEquipSuitUp_Clear()
		PetEquipSuitUp_Explain3_Text2:SetText("#cff0000"..tostring(0).."%")
		PetEquipSuitUp_SmallShow()
	else
		PetEquipSuitUp:SendSuitUpConfirm(26, g_PetEquipItemPos,
											 g_ObjCareID,
											 g_PetEquipMaterialNum,
											 nSuccessPercent)
	end
end


--*************************************************
--���ý���
--*************************************************
function PetEquipSuitUp_Clear()
	if (g_PetEquipItemPos ~= -1) then
		LifeAbility : Lock_Packet_Item(g_PetEquipItemPos,0);
	end

	PetEquipSuitUp_Accept:Disable()
	PetEquipSuitUp_GemItem:SetActionItem(-1)
	PetEquipSuitUp_ProductItem:SetActionItem(-1)
	PetEquipSuitUp_ProductItem:Hide();
	PetEquipSuitUp_Explain2_Info:SetText("#{ZSZBSJ_XML_05}")
	PetEquipSuitUp_Explain4:SetText("#{ZSZBSJ_XML_03}")
	PetEquipSuitUp_Demand_Jiaozi:SetProperty("MoneyNumber", "")
	PetEquipSuitUp_Explain3_Text2:SetText("")
	g_PetEquipItemPos  = -1
	g_PetEquipItemID   = -1
	g_PetEquipProductID= -1
	g_ProductNeedMoney = 0
end

--*************************************************
--����UI_COMMAND�߼�
--*************************************************
function PetEquipSuitUp_UiCommand(arg0)

	--����Ƿ���иý���
	local nUiIdx = tonumber(arg0)
	if (nUiIdx ~= g_PetEquipUiIndex) then
		return
	end

	--���ĵ�ǰ�Ի���NPC
	local targetId = Get_XParam_INT(0)
	g_ObjCareID = DataPool:GetNPCIDByServerID(targetId);
	if (g_ObjCareID == -1) then
		PushDebugMessage("server�����������������⡣");
		return
	end

	--��ȡ���Ǹ���֧���ܵĿ��Ʒ�
	--1 Ϊ����װ�����ǹ���
	g_PetEquipFunCtrl = Get_XParam_INT(1)

	PetEquipSuitUp_BeginCareObject()
	PetEquipSuitUp_Clear()

  	PetEquipSuitUp_SmallShow()
	this:Show();
end

--*************************************************
--����UNIT_MONEY�߼�
--*************************************************
function PetEquipSuitUp_UnitMoney()
	PetEquipSuitUp_Currently_Money:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")))
end

--*************************************************
--����MONEYJZ_CHANGE�߼�
--*************************************************
function PetEquipSuitUp_JZMChange()
	PetEquipSuitUp_Currently_Jiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")))
end

--*************************************************
--����RESUME_ENCHASE_GEM�߼�
--*************************************************
function PetEquipSuitUp_Resume_Equip(Index)
	if (Index == nil) then
		return
	end

	if (Index < 0 or Index > 5) then
		return
	end

	if (Index == 0) then
		LifeAbility:Lock_Packet_Item(g_PetEquipItemPos, 0)
		PetEquipSuitUp_GemItem:SetActionItem(-1)
		g_PetEquipItemPos=-1
		PetEquipSuitUp_Clear()
		PetEquipSuitUp_ProductItem:SetActionItem(-1)
		g_PetEquipProductID=-1
		PetEquipSuitUp_Demand_Jiaozi:SetProperty("MoneyNumber", "")
		PetEquipSuitUp_Accept:Disable()
		--��ʾ4�ǽ���
		PetEquipSuitUp_SmallShow()
		return
	end
end

--*************************************************
--����OBJECT_CARED_EVENT�߼�
--*************************************************
function PetEquipSuitUp_CareEvent(arg0,arg1,arg2)
	local ObjCaredID = tonumber(arg0)
	if( ObjCaredID ~= g_ObjCareID) then
		return
	end

	local ObjDistance = tonumber(arg2)
	if( (arg1 == "distance" and ObjDistance>MAX_OBJ_DISTANCE) or arg1=="destroy") then
		PetEquipSuitUp_Close()
	end
end

--*************************************************
--����UPDATE_PETEQUIP_UP�߼� �������
--*************************************************
function PetEquipSuitUp_Update( pos_ui, pos_packet )
	if (pos_packet == nil) then
		return
	end

	local BagPos = tonumber(pos_packet)
	local UiPos  = tonumber(pos_ui)

	--deleted by guochenshu for TT:66411
	--�Ƿ����....
	--if (PlayerPackage:IsLock(BagPos) == 1) then
	--	PushDebugMessage("#{Item_Locked}")
	--	return
	--end

	local theAction = EnumAction(UiPos, "packageitem")
	if (theAction == 0) then
		return
	end

	local ItemID = PlayerPackage:GetItemTableIndex(BagPos)
	local nClass = math.floor(ItemID/10000000)

	--����װ��
	if (nClass == 7) then
		local nRet = PetEquipSuitUp_5DownUpdate(BagPos)
		if (nRet == 0) then
			return
		end

		local nIs5LevelUp = PetEquipSuitUp:GetPetEquip5LevelupMark(ItemID)
		--��������װ����5�����µ�װ��
		if (nIs5LevelUp <= 6) then
			if (g_PetEquipUIMark == 1) then
				--�ı��5�����½���
				PetEquipSuitUp_SmallShow()
			end
		elseif(nIs5LevelUp > 6 ) then
			if (g_PetEquipUIMark == 0) then
				--�ı��5�����Ͻ���
				PetEquipSuitUp_BigShow()
			end
		else
			return
		end
	end
end


--*************************************************
--����PACKAGE_ITEM_CHANGED�߼�
--*************************************************
function PetEquipSuitUp_PackageItemChange(arg0)
	if (this:IsVisible() == 0) then
		return
	end

	if (arg0 == nil) then
		return
	end

	local NumArg0 = tonumber(arg0)
	if (-1 == NumArg0) then
		return
	end

	if (g_PetEquipItemPos == NumArg0) then
		PetEquipSuitUp_Resume_Equip(0)
	end
end

--*************************************************
--��ʼ����NPC������ȷ����ҵ�ǰ������NPC�������NPC
--̫Զ�ͻ�رմ����ڿ�ʼ����֮ǰ��Ҫ��ȷ���������
--�ǲ����Ѿ��С����ġ���NPC������еĻ�����ȡ���Ѿ�
--�еġ����ġ�
--*************************************************
function PetEquipSuitUp_BeginCareObject()
	this:CareObject(g_ObjCareID, 1, "PetEquipSuitUp");
end


--*************************************************
--ֹͣ��ĳNPC�Ĺ���
--*************************************************
function PetEquipSuitUp_StopCareObject()
	this:CareObject(g_ObjCareID, 0, "PetEquipSuitUp");
end

--*************************************************
--�رս���
--*************************************************
function PetEquipSuitUp_Close()
	this:Hide()
	PetEquipSuitUp_StopCareObject()
	PetEquipSuitUp_Clear()
end

--*************************************************
--�رս���
--*************************************************
function PetEquipSuitUp_OnHide()
	PetEquipSuitUp_Close()
end

--*************************************************
--��̬��ʾ���ӵĲ���
--*************************************************
function PetEquipSuitUp_BigShow()

	if (g_PetEquipUIMark == 0) then
	 	local nSuitUpFramHeightOld = PetEquipSuitUp_Frame:GetProperty("AbsoluteHeight")
	 	local nFunctionFramHeightOld = PetEquipSuitUp_Function_Frame:GetProperty("AbsoluteHeight")
		local nExplain3PosY  = PetEquipSuitUp_Explain3:GetProperty("AbsoluteYPosition")
		local nExplain2PosY  = PetEquipSuitUp_Explain2_Bk:GetProperty("AbsoluteYPosition")

		--���ô��ڴ�С�������ؼ�λ��
		PetEquipSuitUp_Frame:SetProperty("AbsoluteHeight", nSuitUpFramHeightOld+g_DynamicConst1)
		PetEquipSuitUp_Function_Frame:SetProperty("AbsoluteHeight", nFunctionFramHeightOld+g_DynamicConst1)

		PetEquipSuitUp_Explain3:SetProperty("AbsoluteYPosition", nExplain3PosY+g_DynamicConst2)
		PetEquipSuitUp_Explain2_Bk:SetProperty("AbsoluteYPosition", nExplain2PosY+g_DynamicConst1)
		PetEquipSuitUp_5LevelUiShow()
		PetEquipSuitUp_NumberList:SetCurrentSelect(0)
	end
	g_PetEquipUIMark = 1
end

--*************************************************
--��̬�������ӵĲ���
--*************************************************
function PetEquipSuitUp_SmallShow()
	if (g_PetEquipUIMark == 1) then
	 	local nSuitUpFramHeightOld = PetEquipSuitUp_Frame:GetProperty("AbsoluteHeight")
	 	local nFunctionFramHeightOld = PetEquipSuitUp_Function_Frame:GetProperty("AbsoluteHeight")
		local nExplain3PosY  = PetEquipSuitUp_Explain3:GetProperty("AbsoluteYPosition")
		local nExplain2PosY  = PetEquipSuitUp_Explain2_Bk:GetProperty("AbsoluteYPosition")

		--���ô��ڴ�С�������ؼ�λ��
		PetEquipSuitUp_Frame:SetProperty("AbsoluteHeight", nSuitUpFramHeightOld-g_DynamicConst1)
		PetEquipSuitUp_Function_Frame:SetProperty("AbsoluteHeight", nFunctionFramHeightOld-g_DynamicConst1)

		PetEquipSuitUp_Explain3:SetProperty("AbsoluteYPosition", nExplain3PosY-g_DynamicConst2)
		PetEquipSuitUp_Explain2_Bk:SetProperty("AbsoluteYPosition", nExplain2PosY-g_DynamicConst1)
		PetEquipSuitUp_NumberList:SetCurrentSelect(0)
		PetEquipSuitUp_5LevelUiHide()
	end
	g_PetEquipUIMark = 0
end


--*************************************************
--5�Ǽ�����װ������ʱ����Ҫ��ʾ���Ͽ�ʥ������
--*************************************************
function PetEquipSuitUp_5LevelUiShow()
	PetEquipSuitUp_Explain5:Show()
	PetEquipSuitUp_Explain6:Show()
	PetEquipSuitUp_NumberList:Show()
end

--*************************************************
--5�Ǽ�����װ������ʱ����Ҫ���ز��Ͽ�ʥ������
--*************************************************
function PetEquipSuitUp_5LevelUiHide()
	PetEquipSuitUp_Explain5:Hide()
	PetEquipSuitUp_Explain6:Hide()
	PetEquipSuitUp_NumberList:Hide()
end


--*************************************************
--����װ��������洦��UPDATE_PETEQUIP_UP�߼� �������
--*************************************************
function PetEquipSuitUp_5DownUpdate( BagPos )
	if (BagPos == nil or BagPos == -1) then
		return 0
	end

	local ItemID = PlayerPackage:GetItemTableIndex(BagPos)
	--ͨ�����ȡ������ƷID����Ҫ��Ǯ��Ŀ���������ʡ���������
	local nProductID,nPercent,nNeedMoney,nMaterialKind, strImpact= PetEquipSuitUp:GetPetEquipUpProductInfo(ItemID, 0) --debug

	if (-1 == nProductID) then
		PushDebugMessage("#{ZSZBSJ_090706_03}")
		return 0
	end

	--����������Ʒ���Action....
	local theAction = EnumAction(BagPos, "packageitem");
	if (theAction:GetID() == 0) then
		return 0
	end

	if (g_PetEquipItemPos ~= -1) then
		LifeAbility:Lock_Packet_Item(g_PetEquipItemPos, 0)
	end
	LifeAbility:Lock_Packet_Item(BagPos, 1)
	PetEquipSuitUp_GemItem:SetActionItem(theAction:GetID())

	g_PetEquipItemPos=BagPos
	--����������Ʒ��Action
	g_PetEquipItemID	= ItemID
	g_PetEquipProductID = nProductID
	g_ProductNeedMoney  = nNeedMoney
	g_SuccessPercent 	= nPercent

	PetEquipSuitUp_Explain4:SetText("#{ZSZBSJ_XML_04}")
	local ProductAction = PetEquipSuitUp:UpdateProductAction(nProductID,BagPos) --debug
	if (ProductAction and ProductAction:GetID() ~= 0) then
		PetEquipSuitUp_ProductItem:SetActionItem(ProductAction:GetID());
		PetEquipSuitUp_ProductItem:Show()
	else
		PetEquipSuitUp_ProductItem:SetActionItem(-1)
	end

	--������Ҫ��Ǯ��Ŀ
	PetEquipSuitUp_Demand_Jiaozi:SetProperty("MoneyNumber", tostring(g_ProductNeedMoney))
	if (nPercent < 100) then
		PetEquipSuitUp_Explain3_Text2:SetText("#cff0000"..tostring(nPercent).."%")
	else
		nPercent = 100
		PetEquipSuitUp_Explain3_Text2:SetText("#G"..tostring(nPercent).."%")
	end

	--����Table�е�ID��ȡ����Ҫ�Ĳ���
	local nMaterial = {
					  [1] = {id=0,num=0,name="",},
					  [2] = {id=0,num=0,name="",},
					  [3] = {id=0,num=0,name="",},
					  }
	local szTipInfo = "#{ZSZBSJ_XML_06}"
	if (nMaterialKind > 0) then
		for i=1,nMaterialKind do
			nMaterial[i].id,nMaterial[i].num,nMaterial[i].name = PetEquipSuitUp:GetPetEquipUpMaterial(g_PetEquipItemID, 0, i) --debug
			if (-1 ~= nMaterial[i].id) then
				szTipInfo = szTipInfo..nMaterial[i].name.."#G"..nMaterial[i].num.."#cfff263����"
			end
		end

		if (strImpact ~= nil) then
			szTipInfo = szTipInfo.."\n"..strImpact
		end

		PetEquipSuitUp_Explain2_Info:SetText(szTipInfo)
	end

	local nMaxCount = PetEquipSuitUp_MaxCount(nPercent)
	if (nMaxCount > 0) then
		PetEquipSuitUp_NumberList:ResetList()
		for i=0, nMaxCount do
			PetEquipSuitUp_NumberList:ComboBoxAddItem(tostring(i),i)
		end
	end

	PetEquipSuitUp_NumberList:SetCurrentSelect(0)
	PetEquipSuitUp_Accept:Enable()
	return 1
end


--*************************************************
--�ҵ�����ڼ���ʥ�����󣬳ɹ���Ϊ100%
--*************************************************
function PetEquipSuitUp_FindCriticalValue(nPercent)
	for i=1,5 do
		local nTmp = nPercent + i * 15
		if (nTmp >=100) then
			return i
		end
	end
	return 5
end


--*************************************************
--ȡ�½����е�����װ��
--*************************************************
function PetEquipSuitUp_GetDownItem(arg0)
	if (arg0 == nil) then
		return
	end

	--ȡ�½����ϵ�װ��
	local nIndex = tonumber(arg0)
	PetEquipSuitUp_Resume_Equip(nIndex)
end

--*************************************************
--�����б����ѡ������ָı�
--*************************************************
function PetEquipSuitUp_ComboListProvinceChanged(nIndex)
	local szName, nIndex = PetEquipSuitUp_NumberList:GetCurrentSelect()
	if (nIndex == 0) then
		PetEquipSuitUp_Explain3_Text2:SetText("#cff0000"..tostring(g_SuccessPercent).."%")
		return
	end

	if (nIndex < 1 or nIndex > 5) then
		return
	end

	if (g_SuccessPercent == -1) then
		return
	end

	local nCriticalValue  = PetEquipSuitUp_FindCriticalValue(g_SuccessPercent)
	if (nCriticalValue == 0) then
		return
	end

	if (nCriticalValue < nIndex) then
		PetEquipSuitUp_NumberList:SetCurrentSelect(0)
		PetEquipSuitUp_Explain3_Text2:SetText("#cff0000"..tostring(g_SuccessPercent).."%")
		PushDebugMessage("#{ZSZB_100510_1}")
	else
		local nPercent = g_SuccessPercent + nIndex * 15
		if (nPercent < 100) then
			PetEquipSuitUp_Explain3_Text2:SetText("#cff0000"..tostring(nPercent).."%")
		else
			PetEquipSuitUp_Explain3_Text2:SetText("#G"..tostring(nPercent).."%")
		end
	end
end


--*************************************************
--���ݰٷֱ��趨ʥ�����������Ŀ
--*************************************************
function PetEquipSuitUp_MaxCount(nPercent)

	local nRet = 0
	local nCount = 100 - nPercent
	if (nCount > 0) then
		nRet = math.ceil(nCount/15)
	end

	if (nRet > 0) then
		return nRet
	end
	return 0
end


function PetEquipSuitUp_CommonClientMessage(arg0)
	if (tonumber(arg0) == 20100524) then
		PetEquipSuitUp_NumberList:SetCurrentSelect(0)
	end
end

function PetEquipSuitUp_Frame_On_ResetPos()
  PetEquipSuitUp_Frame:SetProperty("UnifiedPosition", g_PetEquipSuitUp_Frame_UnifiedPosition);
end
