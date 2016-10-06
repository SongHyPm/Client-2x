
local g_uitype = 1
local g_serverScriptId = 311111
local g_serverNpcId = -1
local g_clientNpcId = -1
local g_ItemPos		= -1
local g_NeedMoney	= -1
local g_selidx		= -1
local g_ItemID		= -1
local g_Contrl		= false
local MAX_OBJ_DISTANCE = 3.0
local g_DefaultTxt = "��a ��o c� c�n d�ng v�o � ��o c�."
local g_Model1IsEnabel = 0
local g_Model2IsEnabel = 0
--�������޻�ͯ����
local g_HuanTongCJTS = {30503016,30503017,30503018,30503019,30503020}
--�ܹ���������е���Ʒ ��ʼ
local g_HuanTongMin1 = 30503011
local g_HuanTongMax1 = 30503020
local g_HuanTongMin2 = 30309100
local g_HuanTongMax2 = 30309500
--�ܹ���������е���Ʒ ����
--�����ȼ���ͯ����������Ҫ�Ľ�Ǯ
local g_tbabaymoney  = {
							[5]		= 5000,
							[15]	= 6000,
							[20]	= 7000,
							[25]	= 7000,
							[35]	= 10000,
							[45]	= 15000,
							[55]	= 25000,
							[65]	= 40000,
							[75]	= 55000,
							[85]	= 70000,
							[95]	= 85000,
							[105]	= 100000,
						}
						
local g_Pethuantong_Frame_UnifiedPosition;
						
--****************************************
--ע����Ϣ
--****************************************
function Pethuantong_PreLoad()
	this : RegisterEvent( "UNIT_MONEY" )
	this : RegisterEvent( "UI_COMMAND" )
	this : RegisterEvent( "DELETE_PET" )
	this : RegisterEvent( "MONEYJZ_CHANGE" )
	this : RegisterEvent( "UPDATE_PET_PAGE" )
	this : RegisterEvent( "REPLY_MISSION_PET" )
	this : RegisterEvent( "OBJECT_CARED_EVENT" )
	this : RegisterEvent( "PACKAGE_ITEM_CHANGED" )
	this : RegisterEvent( "UPDATE_PET_HUANTONG" )
	this : RegisterEvent( "NEW_DEBUGMESSAGE" )
	this:RegisterEvent("ADJEST_UI_POS")
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
end

--****************************************
--
--****************************************
function Pethuantong_OnLoad()
    g_Pethuantong_Frame_UnifiedPosition=Pethuantong_Frame:GetProperty("UnifiedPosition");
end

--****************************************
--�����¼���Ϣ
--****************************************
function Pethuantong_OnEvent(event)
	if	   ( event == "UI_COMMAND" ) 		then
		Pethuantong_UiCommand(arg0)

	elseif ( event == "UNIT_MONEY" )		then
		Pethuantong_ShowMoney()

	elseif ( event == "DELETE_PET" and this:IsVisible() ) 		then
		Pethuantong_Hide()

	elseif ( event == "MONEYJZ_CHANGE")		then
		Pethuantong_ShowJZ()

	elseif ( event == "UPDATE_PET_PAGE") 	then
		Pethuantong_Show()

	elseif ( event == "REPLY_MISSION_PET") 	then
		Pethuantong_Selected(arg0)

	elseif ( event == "OBJECT_CARED_EVENT") then
		Pethuantong_CareObj(arg0,arg1,arg2)

	elseif ( event == "UPDATE_PET_HUANTONG") then
		Pethuantong_Update(arg0)

	elseif ( event == "PACKAGE_ITEM_CHANGED") then
		if ( arg0 ~= nil and -1 == tonumber(arg0)) then
			return
		end

		if tonumber(arg0) == g_ItemPos then
			if (g_ItemID ~= -1) then
				local nextPos = PlayerPackage : GetBagPosByItemIndex(g_ItemID)
				if nextPos >=0 then
					Pethuantong_Update(nextPos)
				else
					Pethuantong_Resume_Equip_Gem()
				end
			else
				Pethuantong_Resume_Equip_Gem()
			end
		end
		
	elseif (event == "ADJEST_UI_POS" ) then
		Pethuantong_Frame_On_ResetPos()
		
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		Pethuantong_Frame_On_ResetPos()
		
	end
end

--*************************************************
--ʹ��UICOMMAND
--*************************************************
function Pethuantong_UiCommand(Param)
	local nOp = tonumber(Param)
	if (nOp == 20090929) then
		Pethuantong_Open()
	elseif (nOp == 20091130) then
		if (g_selidx ~= -1) then
			Pethuantong_PetModel : SetFakeObject("")
			Pet : SethuantongModel(g_selidx)
			Pethuantong_PetModel : SetFakeObject("My_Pethuantong")
			Pet : SetPetLocation(g_selidx,9)
		else

		end
	end
end

--*************************************************
--��ʾ���޻�ͯ����
--*************************************************
function Pethuantong_Open()
	Pethuantong_Clear()
	g_serverNpcId = Get_XParam_INT(0)
	g_clientNpcId = Target : GetServerId2ClientId(g_serverNpcId)
	if (g_clientNpcId == -1) then
		return
	end

	this : CareObject(g_clientNpcId, 1, "Pethuantong")

	Pethuantong_PetModel : SetFakeObject("")
	--Pethuantong_Mode1 : SetCheck(0)
	--Pethuantong_Mode2 : SetCheck(0)
	g_uitype = Get_XParam_INT(1)
	if ( g_selidx ~= -1 ) then
		Pet : SetPetLocation(g_selidx, -1)
	end
	g_selidx = -1

	Pet : ShowPetList(0)
	Pet : ShowPetList(1)
	this : Show()
end

--*************************************************
--�ر����޻�ͯ����
--*************************************************
function Pethuantong_Hide()
	if (this : IsVisible() == false) then
		return
	end

	if (g_clientNpcId ~= -1) then
		this : CareObject(g_clientNpcId, 0, "Pethuantong")
	end

	this: Hide()
	Pet : ShowPetList(-1)
	Pethuantong_PetModel : SetFakeObject("")
	if (-1 ~= g_selidx) then
		Pet : SetPetLocation(g_selidx, -1)
	end
	g_selidx = -1
end

--*************************************************
--ȷ����ť
--*************************************************
function Pethuantong_Do()

	--�жϵ绰�ܱ��Ͷ������뱣��2012.6.12-LIUBO
	if CheckPhoneMibaoAndMinorPassword() ~= 1 then			
		return
	end
	-- �ж��Ƿ�Ϊ��ȫʱ��2012.6.12-LIUBO
	if (tonumber(DataPool:GetLeftProtectTime()) > 0) then
		PushDebugMessage("#{ZYXT_120528_16}")
		return
	end
	
	--�Ƿ�ѡ������
	if (-1 == g_selidx) then
		PushDebugMessage("Ch�n Tr�n Th�")
		return
	end

	--�Ƿ�ѡ�����
	if (-1 == g_ItemPos) then
		PushDebugMessage("C�n Ho�n аng Quy�n.")
		return
	end

	--�Ƿ��Ǯ�㹻
	local nHaveMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
	if (nHaveMoney < g_NeedMoney) then
		PushDebugMessage("Ti�n kh�ng ��, kh�ng th� ho�n �ng.")
		return
	end

	--
	local nItemID = PlayerPackage : GetItemTableIndex( g_ItemPos )
	g_ItemID = nItemID
	local bRet = 0
	for i=1,table.getn(g_HuanTongCJTS) do
		if (g_HuanTongCJTS[i] == nItemID) then
			bRet = 1
		end
	end

	if (bRet ~= 1) then
		Pet : SkillStudy_Do(2, g_selidx, g_ItemPos)
	else
		local bSelected1 = 0
		if (g_Model1IsEnabel == 1) then
			bSelected1 = Pethuantong_Mode1:GetCheck()
		end

		local bSelected2 = 0
		if (g_Model2IsEnabel == 1) then
			bSelected2 = Pethuantong_Mode2:GetCheck()
		end

		local hid,lid = Pet:GetGUID(g_selidx)
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("OnPropagate")
			Set_XSCRIPT_ScriptID(311111)
			Set_XSCRIPT_Parameter(0,g_serverNpcId)
			Set_XSCRIPT_Parameter(1,hid)
			Set_XSCRIPT_Parameter(2,lid)
			Set_XSCRIPT_Parameter(3,bSelected1)
			Set_XSCRIPT_Parameter(4,bSelected2)
			Set_XSCRIPT_Parameter(5,g_ItemPos)
			Set_XSCRIPT_ParamCount(6)
		Send_XSCRIPT();
		--Pethuantong_Clear()
		--PetPropagateCheck_Accept:Disable()
	end
	g_Contrl = true
end

--*************************************************
--����NPC
--*************************************************
function Pethuantong_CareObj(careId, op, distance)
	if(nil == careId or nil == op or nil == distance) then
		return
	end

	if(tonumber(careId) ~= g_clientNpcId) then
		return
	end

	if(op == "distance" and tonumber(distance)>MAX_OBJ_DISTANCE or op=="destroy") then
		Pethuantong_Hide()
	end
end


--*************************************************
--ѡ��ͬ����ʱ�����ò�ͬ������ģ��
--*************************************************
function Pethuantong_Selected(selidx)
	local nSeletedIndex = tonumber(selidx)
	if (this : IsVisible() == false) then
		return
	end

	if (-1 == nSeletedIndex) then
		return
	end
	
	--�����ѱ���������ѡ��
	if (Pet:GetPetLocation(nSeletedIndex) ~= -1) then
		return
	end

	if Pet:IsPetHaveEquip(nSeletedIndex) == 1 then
		PushDebugMessage("#{ZSZB_090211_18}")
		return
	end

	if (g_selidx ~= -1) then
		Pet : SetPetLocation(g_selidx,-1)
	end

	--Pethuantong_Mode1 : SetCheck(0)
	--Pethuantong_Mode2 : SetCheck(0)
	Pethuantong_Clear()
	g_selidx = tonumber(nSeletedIndex)
	Pethuantong_PetModel : SetFakeObject("")
	Pet : SethuantongModel(g_selidx)
	Pethuantong_PetModel : SetFakeObject("My_Pethuantong")
	Pet : SetPetLocation(g_selidx,9)

	if (g_ItemPos ~= -1) then
		local ItemID = PlayerPackage : GetItemTableIndex( g_ItemPos )
		local petlevel = Pet : GetTakeLevel(selidx)
		local nCostMoney = Pethuantong_GetHuanTongCostMoney(petlevel, ItemID)
		g_NeedMoney = nCostMoney
		Pethuantong_Money : SetProperty("MoneyNumber", tostring(g_NeedMoney))
		Pethuantong_DisableModel()
	else
		Pethuantong_Money : SetProperty("MoneyNumber", "")
	end

end

--*************************************************
--���޻�ͯ���ѵĽ�Ǯ
--*************************************************
function Pethuantong_GetHuanTongCostMoney(petlevel, itemId)

	if(nil == petlevel or nil == itemId or -1 == itemId) then
		return 0
	end

	if(nil == g_tbabaymoney[petlevel]) then
		return 0
	end

	local costMoney = g_tbabaymoney[petlevel]
	--�ռ���ͯ�����շѽ���90%
	if 	   (itemId == 30503011 or
			itemId == 30503012) then
	--���޻�ͯ����/�߼����޻�ͯ����
	elseif (itemId == 30503016 or
			itemId == 30503017 or
			itemId == 30503018 or
			itemId == 30503019 or
			itemId == 30503020) then

			costMoney = (costMoney * 90)/100
			if (costMoney <= 0) then
				costMoney = 1
			end
			Pethuantong_Mode1 : Enable()
			Pethuantong_Mode2 : Enable()
	else
	--���� ��ͯ��������
			costMoney = costMoney/100
			if (costMoney <= 0) then
				costMoney = 1
			end
	end
	return costMoney
end


--*************************************************
--
--*************************************************
function Pethuantong_Show()
	if (this : IsVisible() == true) then
		return
	end

	if (g_Contrl == false) then
		if(g_selidx ~= -1) then
			--if (Pet : GetIsFighting(g_selidx))then
			Pet : SetPetLocation(g_selidx,-1)
			--end
		end
		Pethuantong_PetModel : SetFakeObject( "" )
		g_selidx = -1
	end

	g_Contrl = false
end

--*************************************************
--��ʾ����
--*************************************************
function Pethuantong_ShowJZ()
	Pethuantong_SelfJiaozi : SetProperty( "MoneyNumber", tostring(Player:GetData("MONEY_JZ")) )
end

--*************************************************
--��ʾ��Ǯ
--*************************************************
function Pethuantong_ShowMoney()
	Pethuantong_SelfMoney : SetProperty( "MoneyNumber", tostring(Player:GetData("MONEY")) )
end

--*************************************************
--�Ҽ����ActionButton
--*************************************************
function Pethuantong_Resume_Equip_Gem()
	Pethuantong_Clear()
end

--*************************************************
--�������
--*************************************************
function Pethuantong_Clear()
	if g_ItemPos ~= -1 then
		LifeAbility : Lock_Packet_Item( g_ItemPos, 0 )
		Pethuantong_Object : SetActionItem( -1 )
		g_ItemPos = -1
		g_NeedMoney = -1
		Pethuantong_Money : SetProperty( "MoneyNumber", 0 )
	end
	Pethuantong_Mode1 : SetCheck(0)
	--Pethuantong_Mode1 : Disable()
	Pethuantong_Mode1 : Enable()
	Pethuantong_Mode2 : SetCheck(0)
	--Pethuantong_Mode2 : Disable()
	Pethuantong_Mode2 : Enable()
	g_ItemID = -1
end


--*************************************************
--���½���
--*************************************************
function Pethuantong_Update( pos_packet )
	if (pos_packet == nil) then
		return
	end

	local BagPos = tonumber( pos_packet )
	--�Ƿ����....
	if (PlayerPackage:IsLock(BagPos) == 1) then
		PushDebugMessage("#{Item_Locked}")
		return
	end

	--�������޻�ͯ���Ͻ���
	local ItemID = PlayerPackage : GetItemTableIndex( BagPos )
	if ( ItemID <= 0) then
		PushDebugMessage("#{GMActionSystem_Item_CantUseInPetSkillStudy}")
		return
	end

	if ( (ItemID < g_HuanTongMin1 or ItemID > g_HuanTongMax1) and
		 (ItemID < g_HuanTongMin2 or ItemID > g_HuanTongMax2)) then
		PushDebugMessage("#{GMActionSystem_Item_CantUseInPetSkillStudy}")
		return
	end

	if (g_ItemPos ~= -1) then
		LifeAbility : Lock_Packet_Item( g_ItemPos, 0 )
	end

	LifeAbility : Lock_Packet_Item( BagPos, 1 )
	g_ItemPos = BagPos

	--�������޻�ͯ�����޽���
	local theAction = EnumAction( BagPos, "packageitem" )
	if (theAction : GetID() == 0) then
		return
	end

	Pethuantong_Object : SetActionItem( theAction : GetID() )

	--�������޻�ͯ��Ҫ���ѵĽ�Ǯ
	if (-1 ~= g_selidx) then
		local petlevel = Pet : GetTakeLevel(g_selidx)
		local nCostMoney = Pethuantong_GetHuanTongCostMoney(petlevel, ItemID)
		g_NeedMoney = nCostMoney
		Pethuantong_Money : SetProperty( "MoneyNumber", tostring(g_NeedMoney) )
		Pethuantong_DisableModel()
	end
end

--*************************************************
--�رս���
--*************************************************
function Pethuantong_Frame_OnHiden()
	Pethuantong_Hide()
	Pethuantong_Clear()
end

--*************************************************
--������ת����
--*************************************************
function Pethuantong_Modle_TurnLeft(start)
	--������ת��ʼ
	if(start == 1) then
		Pethuantong_PetModel : RotateBegin(-0.3)
	--������ת����
	else
		Pethuantong_PetModel : RotateEnd()
	end
end

--*************************************************
--������ת����
--*************************************************
function Pethuantong_Modle_TurnRight(start)
	--������ת��ʼ
	if(start == 1) then
		Pethuantong_PetModel : RotateBegin(0.3)
	--������ת����
	else
		Pethuantong_PetModel : RotateEnd()
	end
end


--*************************************************
--ѡ�� �������� �����ɳ���
--*************************************************
function Pethuantong_Mode_Clicked(Index)

	if (Index ~= 1 and Index ~= 2) then
		return
	end

end


function Pethuantong_DisableModel()
	if (nil ~= g_selidx and g_selidx ~= -1 and nil ~= g_ItemPos and g_ItemPos ~= -1) then
		--��������ǳ������޻�ͯ����
		local ItemID = PlayerPackage : GetItemTableIndex( g_ItemPos )
		if (ItemID == 30503017 or ItemID == 30503018 or
			ItemID == 30503019 or ItemID == 30503020) then
			local pettype = Pet : GetPetType(g_selidx)
			local petgene = Pet : GetGeneration(g_selidx)
			if (pettype == 0 and petgene == 0) then
				Pethuantong_Mode1 : Enable()
				Pethuantong_Mode2 : Enable()
				g_Model1IsEnabel = 1
				g_Model2IsEnabel = 1
			else
				Pethuantong_Mode1 : SetCheck( 0 )
				Pethuantong_Mode2 : SetCheck( 0 )
				Pethuantong_Mode1 : Disable()
				Pethuantong_Mode2 : Disable()
				g_Model1IsEnabel = 0
				g_Model2IsEnabel = 0
			end
		else
			Pethuantong_Mode1 : SetCheck( 0 )
			Pethuantong_Mode2 : SetCheck( 0 )
			Pethuantong_Mode1 : Disable()
			Pethuantong_Mode2 : Disable()
			g_Model1IsEnabel = 0
			g_Model2IsEnabel = 0
		end
	else
		Pethuantong_Mode1 : Enable()
		Pethuantong_Mode2 : Enable()
	end
end

function Pethuantong_Frame_On_ResetPos()
  Pethuantong_Frame:SetProperty("UnifiedPosition", g_Pethuantong_Frame_UnifiedPosition);
end
