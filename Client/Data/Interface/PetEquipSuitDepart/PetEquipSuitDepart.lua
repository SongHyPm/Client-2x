--*********************************************
--������װ������
--*********************************************
local PetEquipSuitDepartName = "PetEquipSuitDepart"
local g_PetEquipItemPos  = -1
local g_PetEquipItemID	 = -1
local g_ObjCareID		 = -1
local g_ServerCareID	 = -1
local g_ProductNeedMoney =  0
local MAX_OBJ_DISTANCE 	 = 3.0;
local g_PetEquipDepartiIndex = 19831205
local g_PetEquipFunCtrl  = -1	--���ܿ���

local g_PetEquipSuitDepart_Frame_UnifiedPosition;

--**********************************************
--�¼�ע��
--**********************************************
function PetEquipSuitDepart_PreLoad()
	this:RegisterEvent("UI_COMMAND")
	this:RegisterEvent("RESUME_ENCHASE_GEM")
	this:RegisterEvent("OBJECT_CARED_EVENT")
	this:RegisterEvent("UPDATE_PETEQUIP_DEPART") --�½�һ���������¼�
	this:RegisterEvent("PACKAGE_ITEM_CHANGED")
	this:RegisterEvent("UNIT_MONEY")
	this:RegisterEvent("MONEYJZ_CHANGE")
	this:RegisterEvent("NEW_DEBUGMESSAGE")
	this:RegisterEvent("ADJEST_UI_POS")
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
end


--**********************************************
--
--**********************************************
function PetEquipSuitDepart_OnLoad()
	g_PetEquipSuitDepart_Frame_UnifiedPosition=PetEquipSuitDepart_Frame:GetProperty("UnifiedPosition");
end


--**********************************************
--�¼���Ӧ
--**********************************************
function PetEquipSuitDepart_OnEvent( event )
	if (event == "UI_COMMAND") then
		PetEquipSuitDepart_UiCommand(arg0)
	elseif (event == "RESUME_ENCHASE_GEM") then
		PetEquipSuitDepart_Resume_Equip(1)
	elseif (event == "OBJECT_CARED_EVENT") then
		PetEquipSuitDepart_CareEvent(arg0,arg1,arg2)
	elseif (event == "UPDATE_PETEQUIP_DEPART") then
		PetEquipSuitDepart_Update(arg0)
	elseif (event == "PACKAGE_ITEM_CHANGED") then
		PetEquipSuitDepart_PackageItemChange(arg0)
	elseif (event == "MONEYJZ_CHANGE") then
		PetEquipSuitDepart_JZMChange()
	elseif (event == "UNIT_MONEY") then
		PetEquipSuitDepart_UnitMoney()
	elseif (event == "ADJEST_UI_POS" ) then
		PetEquipSuitDepart_Frame_On_ResetPos()
		
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		PetEquipSuitDepart_Frame_On_ResetPos()
	end
end


--**********************************************
--ȷ����ť
--**********************************************
function PetEquipSuitDepart_Buttons_Clicked()
	--�Ƿ�ɳ���װ����������
	if (g_PetEquipItemPos == -1) then
		return
	end

	--����ľ�װ����Table�е�ID
	if (g_PetEquipItemID == -1) then
		return
	end

	--�ж���Ʒ�Ƿ�������㹻�ڷ��������ж�
	if (PlayerPackage:IsLock(g_PetEquipItemPos) == 1) then
		PushDebugMessage("#{Item_Locked}")
		return
	end

	--���͸����������������
	PetEquipSuitDepart:SetPetEquipDepartFunc("OnPetEquipSuitDepart", 800122, g_PetEquipItemPos, g_ServerCareID, 2)
	PetEquipSuitDepart:ShowConfirm(g_PetEquipItemPos, 17)
end


--*************************************************
--���ý���
--*************************************************
function PetEquipSuitDepart_Clear()
	if (g_PetEquipItemPos ~= -1) then
		LifeAbility : Lock_Packet_Item(g_PetEquipItemPos,0);
	end

	PetEquipSuitDepart_OK:Disable()
	PetEquipSuitDepart_Object:SetActionItem(-1)
	PetEquipSuitDepart_Explain_Text1:SetText("#G0%")
	PetEquipSuitDepart_Explain_Text3:SetText("#G0")
	PetEquipSuitDepart_Demand_Jiaozi:SetProperty("MoneyNumber", "")

	g_PetEquipItemPos  = -1
	g_PetEquipItemID   = -1
	g_ProductNeedMoney = 0
end


--*************************************************
--����UI_COMMAND�߼�
--*************************************************
function PetEquipSuitDepart_UiCommand(arg0)
	PetEquipSuitDepart_Clear()
	--����Ƿ���иý���
	local nUiIdx = tonumber(arg0)
	if (nUiIdx ~= g_PetEquipDepartiIndex) then
		return
	end

	--�Ƿ���˰�ȫʱ��....
	if( tonumber(DataPool:GetLeftProtectTime()) >0 ) then
		PushDebugMessage("#{OR_PILFER_LOCK_FLAG}")
		return
	end

	--���ĵ�ǰ�Ի���NPC
	local targetId = Get_XParam_INT(0)
	g_ServerCareID = targetId
	g_ObjCareID = DataPool:GetNPCIDByServerID(targetId);
	if (g_ObjCareID == -1) then
		PushDebugMessage("server�����������������⡣");
		return
	end

	--��ȡ���Ǹ���֧���ܵĿ��Ʒ�
	--1 Ϊ����װ�����ǹ���
	g_PetEquipFunCtrl = Get_XParam_INT(1)
	PetEquipSuitDepart_BeginCareObject()
	PetEquipSuitDepart_Clear()
	this:Show();
end


--*************************************************
--����RESUME_ENCHASE_GEM�߼�
--*************************************************
function PetEquipSuitDepart_Resume_Equip(Index)
	if (Index ~= 1) then
		return
	end

	LifeAbility:Lock_Packet_Item(g_PetEquipItemPos, 0)
	PetEquipSuitDepart_Object:SetActionItem(-1)
	g_PetEquipItemPos=-1
	PetEquipSuitDepart_Clear()
	PetEquipSuitDepart_Demand_Jiaozi:SetProperty("MoneyNumber", "")
	PetEquipSuitDepart_OK:Disable()
end

--*************************************************
--����OBJECT_CARED_EVENT�߼�
--*************************************************
function PetEquipSuitDepart_CareEvent(arg0,arg1,arg2)
	local ObjCaredID = tonumber(arg0)
	if( ObjCaredID ~= g_ObjCareID) then
		return
	end

	local ObjDistance = tonumber(arg2)
	if( (arg1 == "distance" and ObjDistance>MAX_OBJ_DISTANCE) or arg1=="destroy") then
		PetEquipSuitDepart_Close()
	end
end

--*************************************************
--����UPDATE_PETEQUIP_UP�߼� �������
--*************************************************
function PetEquipSuitDepart_Update(pos_packet)
	if (pos_packet == nil) then
		return
	end

	local BagPos = tonumber(pos_packet)
	--�Ƿ����....
	if (PlayerPackage:IsLock(BagPos) == 1) then
		PushDebugMessage("#{Item_Locked}")
		return
	end

	--����������Ʒ��Action
	local ItemID = PlayerPackage:GetItemTableIndex(BagPos)
	--ͨ�����ȡ���ɲ���ID��������Ŀ���������ơ��������ʡ���Ҫ��Ǯ��Ŀ��
	local nMaterialID,nMaterialNum,nPercent = PetEquipSuitDepart:GetPetEquipDepartInfo(ItemID) --debug
	if (-1 == nMaterialID) then
		PushDebugMessage("#{ZSZBSJ_090706_08}")
		return
	end

	--����������Ʒ���Action....
	local theAction = EnumAction(BagPos, "packageitem");
	if (theAction:GetID() == 0) then
		return
	end

	if (g_PetEquipItemPos ~= -1) then
		LifeAbility:Lock_Packet_Item(g_PetEquipItemPos, 0)
	end

	LifeAbility:Lock_Packet_Item(BagPos, 1)
	PetEquipSuitDepart_Object:SetActionItem(theAction:GetID())

	g_PetEquipItemPos=BagPos


	g_PetEquipItemID	= ItemID
	g_ProductNeedMoney  = 0
	PetEquipSuitDepart_Explain_Text1:SetText("#G"..tostring(nPercent).."%")
	PetEquipSuitDepart_Explain_Text3:SetText("#G"..tostring(nMaterialNum))

	PetEquipSuitDepart_OK:Enable()
	PetEquipSuitDepart:SetPetEquipDepartFunc("OnPetEquipSuitDepart", 800122, -1, -1, 0)
end


--*************************************************
--����PACKAGE_ITEM_CHANGED�߼�
--*************************************************
function PetEquipSuitDepart_PackageItemChange(arg0)
	if (this:IsVisible() == 0) then
		return
	end

	local NumArg0 = tonumber(arg0)
	if (arg0~= nil and -1 == NumArg0) then
		return
	end


	if (g_PetEquipItemPos == NumArg0) then
		PetEquipSuitDepart_Resume_Equip(1)
	end
end

--*************************************************
--����UNIT_MONEY�߼�
--*************************************************
function PetEquipSuitDepart_UnitMoney()
	PetEquipSuitDepart_Currently_Money:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")))
end

--*************************************************
--����MONEYJZ_CHANGE�߼�
--*************************************************
function PetEquipSuitDepart_JZMChange()
	PetEquipSuitDepart_Currently_Jiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")))
end

--*************************************************
--��ʼ����NPC������ȷ����ҵ�ǰ������NPC�������NPC
--̫Զ�ͻ�رմ����ڿ�ʼ����֮ǰ��Ҫ��ȷ���������
--�ǲ����Ѿ��С����ġ���NPC������еĻ�����ȡ���Ѿ�
--�еġ����ġ�
--*************************************************
function PetEquipSuitDepart_BeginCareObject()
	this:CareObject(g_ObjCareID, 1, "PetEquipSuitDepart");
end


--*************************************************
--ֹͣ��ĳNPC�Ĺ���
--*************************************************
function PetEquipSuitDepart_StopCareObject()
	this:CareObject(g_ObjCareID, 0, "PetEquipSuitDepart");
end

--*************************************************
--�رս���
--*************************************************
function PetEquipSuitDepart_Close()
	this:Hide()
	PetEquipSuitDepart_StopCareObject()
	PetEquipSuitDepart_Clear()
end


function PetEquipSuitDepart_OnHiden()
	PetEquipSuitDepart_Close()
end


function PetEquipSuitDepart_Frame_On_ResetPos()
  PetEquipSuitDepart_Frame:SetProperty("UnifiedPosition", g_PetEquipSuitDepart_Frame_UnifiedPosition);
end