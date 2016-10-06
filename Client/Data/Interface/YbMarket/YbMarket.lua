local YbMarket_UICommand_Id = 701900
local YbMarket_UICommand_SubId = 1
local objCared = -1;

local YbMarket_nSelectTable = 2		--2 is item, 1 is pet
local YbMarket_nSelectSubType = 1 --���ఴťѡ�� ���δ�1��8
local YbMarket_nSearch = 1         --����ʽ

local YbMarket_Page_Total = 0		-- ���β�ѯ��ҳ��
local YbMarket_Page_Cur	= 0			-- ���β�ѯ��ҳ��   �磺  1/10   һ��10ҳ�� ��ǰ��һҳ�� �´�����ҳ��Ϊ2������

local YbMarket_Cur_Select = 0  		--��ǰѡ�е���Ʒ
	
local YbMarket_ctrlAllSubBtns = {}
local YbMarket_ctrlItemSubBtns = {}
local YbMarket_ctrlPetSubBtns = {}
local YbMarket_ctrlItemTexts = {}
local YbMarket_ctrlPetTexts = {}
local YbMarket_ctrlItemActions = {}
local YbMarket_ctrlPetActions = {}

local YbMarket_PetViewBtn = {}


-----------------------------------------------------------------------
-- OnGameEvent
-----------------------------------------------------------------------

function YbMarket_PreLoad()
	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("UPDATE_YBMARKET")
	this:RegisterEvent("YBMARKET_NEED_RESEARCH")
	this:RegisterEvent("UPDATE_YUANBAO");
	
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("PLAYER_LEAVE_WORLD");	
	-- ��Ԫ�������г�
end

function YbMarket_OnLoad()

	YbMarket_PetViewBtn = 
	{
		[1] = YbMarket_Pet1_btnDetail,
		[2] = YbMarket_Pet2_btnDetail,
		[3] = YbMarket_Pet3_btnDetail,
		[4] = YbMarket_Pet4_btnDetail,
		[5] = YbMarket_Pet5_btnDetail,
		[6] = YbMarket_Pet6_btnDetail,
		[7] = YbMarket_Pet7_btnDetail,
		[8] = YbMarket_Pet8_btnDetail,
		[9] = YbMarket_Pet9_btnDetail,
		[10] = YbMarket_Pet10_btnDetail,
	}
	YbMarket_ctrlAllSubBtns =
	{
		[1] = YbMarket_btnSubType1,
		[2] = YbMarket_btnSubType2,
		[3] = YbMarket_btnSubType3,
		[4] = YbMarket_btnSubType4,
		[5] = YbMarket_btnSubType5,
		[6] = YbMarket_btnSubType6,
		[7] = YbMarket_btnSubType7,
		[8] = YbMarket_btnSubType8,
	}
	
	YbMarket_ctrlItemSubBtns = 
	{
		[1] = { ctrl = YbMarket_btnSubType1, text = "#{YBSC_XML_13}", },  --װ������
		[2] = { ctrl = YbMarket_btnSubType2, text = "#{YBSC_XML_14}", },  --���޴���
		[3] = { ctrl = YbMarket_btnSubType3, text = "#{YBSC_XML_15}", },  --������
		[4] = { ctrl = YbMarket_btnSubType4, text = "#{YBSC_XML_16}", },  --����
	}	
	
	YbMarket_ctrlPetSubBtns = 
	{
		[1] = { ctrl = YbMarket_btnSubType1, text = "#{YBSC_XML_23}", }, --5����Я�� 
		[2] = { ctrl = YbMarket_btnSubType2, text = "#{YBSC_XML_24}", }, --45����Я��
		[3] = { ctrl = YbMarket_btnSubType3, text = "#{YBSC_XML_25}", }, --55����Я��
		[4] = { ctrl = YbMarket_btnSubType4, text = "#{YBSC_XML_26}", }, --65����Я��
		[5] = { ctrl = YbMarket_btnSubType5, text = "#{YBSC_XML_27}", }, --75����Я��
		[6] = { ctrl = YbMarket_btnSubType6, text = "#{YBSC_XML_28}", }, --85����Я��
		[7] = { ctrl = YbMarket_btnSubType7, text = "#{YBSC_XML_29}", }, --95����Я��
	}
	
	YbMarket_ctrlItemTexts = 
	{
		[1]  = {YbMarket_Item1_Text_1,  YbMarket_Item1_Text_2,  YbMarket_Item1_Text_3,  YbMarket_Item1_Text_4,  YbMarket_Item1_Text_5, },
		[2]  = {YbMarket_Item2_Text_1,  YbMarket_Item2_Text_2,  YbMarket_Item2_Text_3,  YbMarket_Item2_Text_4,  YbMarket_Item2_Text_5, },
		[3]  = {YbMarket_Item3_Text_1,  YbMarket_Item3_Text_2,  YbMarket_Item3_Text_3,  YbMarket_Item3_Text_4,  YbMarket_Item3_Text_5, },
		[4]  = {YbMarket_Item4_Text_1,  YbMarket_Item4_Text_2,  YbMarket_Item4_Text_3,  YbMarket_Item4_Text_4,  YbMarket_Item4_Text_5, },
		[5]  = {YbMarket_Item5_Text_1,  YbMarket_Item5_Text_2,  YbMarket_Item5_Text_3,  YbMarket_Item5_Text_4,  YbMarket_Item5_Text_5, },
		[6]  = {YbMarket_Item6_Text_1,  YbMarket_Item6_Text_2,  YbMarket_Item6_Text_3,  YbMarket_Item6_Text_4,  YbMarket_Item6_Text_5, },
		[7]  = {YbMarket_Item7_Text_1,  YbMarket_Item7_Text_2,  YbMarket_Item7_Text_3,  YbMarket_Item7_Text_4,  YbMarket_Item7_Text_5, },
		[8]  = {YbMarket_Item8_Text_1,  YbMarket_Item8_Text_2,  YbMarket_Item8_Text_3,  YbMarket_Item8_Text_4,  YbMarket_Item8_Text_5, },
		[9]  = {YbMarket_Item9_Text_1,  YbMarket_Item9_Text_2,  YbMarket_Item9_Text_3,  YbMarket_Item9_Text_4,  YbMarket_Item9_Text_5, },
		[10] = {YbMarket_Item10_Text_1, YbMarket_Item10_Text_2, YbMarket_Item10_Text_3, YbMarket_Item10_Text_4, YbMarket_Item10_Text_5,},
	}
	
	YbMarket_ctrlPetTexts = 
	{
		[1]  = {YbMarket_Pet1_Text_1,   YbMarket_Pet1_Text_2,   YbMarket_Pet1_Text_3, },
		[2]  = {YbMarket_Pet2_Text_1,   YbMarket_Pet2_Text_2,   YbMarket_Pet2_Text_3, },
		[3]  = {YbMarket_Pet3_Text_1,   YbMarket_Pet3_Text_2,   YbMarket_Pet3_Text_3, },
		[4]  = {YbMarket_Pet4_Text_1,   YbMarket_Pet4_Text_2,   YbMarket_Pet4_Text_3, },
		[5]  = {YbMarket_Pet5_Text_1,   YbMarket_Pet5_Text_2,   YbMarket_Pet5_Text_3, },
		[6]  = {YbMarket_Pet6_Text_1,   YbMarket_Pet6_Text_2,   YbMarket_Pet6_Text_3, },
		[7]  = {YbMarket_Pet7_Text_1,   YbMarket_Pet7_Text_2,   YbMarket_Pet7_Text_3, },
		[8]  = {YbMarket_Pet8_Text_1,   YbMarket_Pet8_Text_2,   YbMarket_Pet8_Text_3, },
		[9]  = {YbMarket_Pet9_Text_1,   YbMarket_Pet9_Text_2,   YbMarket_Pet9_Text_3, },
		[10] = {YbMarket_Pet10_Text_1,  YbMarket_Pet10_Text_2,  YbMarket_Pet10_Text_3,},
	}
	
	YbMarket_ctrlItemActions = 
	{
		YbMarket_Item1, YbMarket_Item2, YbMarket_Item3, YbMarket_Item4, YbMarket_Item5,
		YbMarket_Item6, YbMarket_Item7, YbMarket_Item8, YbMarket_Item9, YbMarket_Item10,
	}
	
	YbMarket_ctrlPetActions =
	{
		YbMarket_Pet1, YbMarket_Pet2, YbMarket_Pet3, YbMarket_Pet4, YbMarket_Pet5,
		YbMarket_Pet6, YbMarket_Pet7, YbMarket_Pet8, YbMarket_Pet9, YbMarket_Pet10,
	}
	
	YbMarket_CboSearchMode:AddTextItem("#{YBSC_100111_66}" ,1)			--��ʱ�������������
	YbMarket_CboSearchMode:AddTextItem("#{YBSC_100111_67}" ,2)			--��ʱ��Ӿ���������
	YbMarket_CboSearchMode:AddTextItem("#{YBSC_100111_68}" ,3)			--�����۴Ӹ���������
	YbMarket_CboSearchMode:AddTextItem("#{YBSC_100111_69}" ,4)			--�����۴ӵ���������
	YbMarket_CboSearchMode:AddTextItem("#{YBSC_100111_70}" ,5)			--����Ʒ���ƽ�������
	YbMarket_CboSearchMode:AddTextItem("#{YBSC_100111_71}" ,6)			--����Ʒ������������
	YbMarket_CboSearchMode:AddTextItem("#{YBSC_100111_72}" ,7)			--������������������
	YbMarket_CboSearchMode:AddTextItem("#{YBSC_100111_73}" ,8)			--������������������

	YbMarket_btnWeb:SetToolTip("#{YBSC_XML_81}")
	YbMarket_btnUsage:SetToolTip("#{YBSC_XML_80}")
end

function YbMarket_OnEvent(event)
	if ( event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_LEAVE_WORLD") then
		this:Hide()
	end
	
	if event == "UI_COMMAND" and tonumber(arg0) == YbMarket_UICommand_Id then
		if this:IsVisible() == true then --��ֹ����?
			return
		end
		
		if Get_XParam_INT_Count() ~= 2 then
			return		
		end
		
		if Get_XParam_INT(1) ~= 1 then
			return
		end		
		
		local obj_Server_id = Get_XParam_INT(0)
		local obj_id = DataPool : GetNPCIDByServerID(obj_Server_id);
		this:CareObject(obj_id, 1);
		
		_YbMarket_InitData()
		YbMarket_lblOwnerYBCount:SetText (tostring(Player:GetData("YUANBAO")))
		if (IsWindowShow("YuanbaoShop")) then
			CloseWindow("YuanbaoShop", true);
		end
		this:Show()
		return
	elseif event == "UPDATE_YBMARKET" then
		if this:IsVisible() == true then
			YbMarket_Update(tonumber(arg0) , tonumber(arg1))
		end
		return
	elseif event == "YBMARKET_NEED_RESEARCH" and this:IsVisible() then
		
		local isCanDo = Auction:IsYBMarketCanSwitchPage()
		if isCanDo == 0 then
			PushDebugMessage("#{YBSC_100111_40}")
			return
		end
		
		local strKey = YbMarket_txtSearchItemName:GetText()
		if YbMarket_nSelectTable == 2 then
			_YbMarket_ClearItemList()
			_YbMarket_ChangeToItemList()
			if YbMarket_Page_Cur > 0 then
				Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , tostring(strKey) , YbMarket_Page_Cur)
			else
				Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , tostring(strKey) , 1)
			end
		elseif YbMarket_nSelectTable == 1 then
			_YbMarket_ClearPetList()
			_YbMarket_ChangeToPetList()
			if YbMarket_Page_Cur > 0 then
				Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , tostring(strKey) , YbMarket_Page_Cur)
			else
				Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , tostring(strKey) , 1)
			end
		end
		
	elseif event == "UPDATE_YUANBAO" and this:IsVisible() then
		YbMarket_lblOwnerYBCount:SetText (tostring(Player:GetData("YUANBAO")))
	end
	
end

-----------------------------------------------------------------------
-- on events
-----------------------------------------------------------------------
function YbMarket_OnHidden()
	YbMarket_txtSearchItemName:SetText("")
	Auction:CloseUpItemWindow()
	Auction:CloseUpPetWindow()
	
	if(IsWindowShow("YbMarketUpItem")) then
		CloseWindow("YbMarketUpItem", true);
	end
	
	if (IsWindowShow("YbMarketUpPet")) then
		CloseWindow("YbMarketUpPet", true);
	end
	
	if(IsWindowShow("YbMarketSale")) then
		CloseWindow("YbMarketSale", true);
	end
end

-----------------------------------------------------------------------
-- table
-----------------------------------------------------------------------
function YbMarket_Update(curPage , totalPage)
	YbMarket_Cur_Select = 0
	if YbMarket_nSelectTable == 2 then
		for i = 1 ,10 do 
			local theAction = EnumAction( i - 1 , "ybmarket_cur_page")
			if theAction:GetID() ~= 0 then
				local pName , pSeller ,pCount ,pYB = Auction:GetItemAuctionInfo( i - 1 )
				if pName ~= nil and pSeller ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
					_YbMarket_InsertItemList(i, pName, pSeller, pCount, pYB)
					YbMarket_ctrlItemActions[i]:SetActionItem(theAction:GetID())
				end
			end
		end
	end
	
	if YbMarket_nSelectTable == 1 then
		for i = 1 ,10 do 
			local pName , pSeller ,pYB = Auction:GetPetAuctionInfo( i - 1 )
			if pName ~= nil then
				local strHead = Auction:GetPetPortraitByIndex(i - 1 , 0)
				local nEra = Auction:GetPetEraCount(i - 1 , 0)
				if nEra == 1 then
					pName = "����"..pName
				end
				_YbMarket_InsertPetList(i, pName, pSeller, pYB , strHead)
			end
		end
	end
	
	YbMarket_lblSplitPage:SetText(tostring(curPage).."/"..tostring(totalPage) )
	
	if curPage <= 1 then
		YbMarket_btnUpPage:Disable();
	else
		YbMarket_btnUpPage:Enable();
	end
	
	if curPage >= totalPage then
		YbMarket_btnDownPage:Disable()
	else
		YbMarket_btnDownPage:Enable()
	end
	
	if totalPage <= 1 then
		YbMarket_btnGotoPage:Disable()
	else
		YbMarket_btnGotoPage:Enable()
	end
	YbMarket_Page_Total = totalPage
	YbMarket_Page_Cur	= curPage
	
end

-- �л���Ʒ�����ޣ� 0��Ʒ�� 1����
function OnYbMarket_ChangeTabIndex(index)
	if index == YbMarket_nSelectTable then
		return
	end
	
	local isCanDo = Auction:IsYBMarketCanSwitchPage()
	if isCanDo == 0 then
		if YbMarket_nSelectTable == 1 then
			YbMarket_tblPetMarket:SetCheck(1)
			YbMarket_tblItemMarket:SetCheck(0)
		elseif YbMarket_nSelectTable == 2 then
			YbMarket_tblPetMarket:SetCheck(0)
			YbMarket_tblItemMarket:SetCheck(1)
		end
		PushDebugMessage("#{YBSC_100111_40}")
		return
	end
	
	YbMarket_nSelectTable = index
	if index == 2 then
		YbMarket_nSelectSubType = 1
		_YbMarket_ClearItemList()
		_YbMarket_ChangeToItemList()
	else
		YbMarket_nSelectSubType = 1
		_YbMarket_ClearPetList()
		_YbMarket_ChangeToPetList()
	end
	
	YbMarket_txtSearchItemName:SetText("")
	--__TestOutPutMsg(YbMarket_nSelectTable , YbMarket_nSelectSubType,nIndex , tostring(strKey) , 1)
	Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , "" , 1)
end

-----------------------------------------------------------------------
--btn clicked
-----------------------------------------------------------------------
-- title

function OnYbMarket_CloseClicked()
	this:Hide()
end


-- ������Ʒ
function OnYbMarket_btnSearchClicked()
	local isCanDo = Auction:IsYBMarketCanSwitchPage()
	if isCanDo == 0 then
		PushDebugMessage("#{YBSC_100111_40}")
		return
	end
	_YbMarket_ClearItemList()
	_YbMarket_ClearPetList()

	local strKey = YbMarket_txtSearchItemName:GetText()
	Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , strKey , 1)
	--__TestOutPutMsg(YbMarket_nSelectTable , YbMarket_nSelectSubType,nIndex , strKey , 1)
end

-- ����б��еķ��ఴť����¼��� ��˳������1��2��3��4��5��6��7��8...
function OnYbMarket_btnSubTypeClicked(index)
	if index + 1 == YbMarket_nSelectSubType then
		return
	end
	local isCanDo = Auction:IsYBMarketCanSwitchPage()
	if isCanDo == 0 then
		if YbMarket_nSelectSubType > 1 and YbMarket_nSelectSubType < 10 then
			YbMarket_ctrlAllSubBtns[YbMarket_nSelectSubType - 1]:SetCheck(1)
		end
		PushDebugMessage("#{YBSC_100111_40}")
		return
	end
	YbMarket_nSelectSubType = index + 1
	_YbMarket_ClearItemList()
	_YbMarket_ClearPetList()

	YbMarket_txtSearchItemName:SetText("")
	Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , "" , 1)
	--__TestOutPutMsg(YbMarket_nSelectTable , YbMarket_nSelectSubType,nIndex , strKey , 1)
end

-- �ϼ�����
function OnYbMarket_btnUpPetClieked()
	if IsWindowShow("YbMarketUpPet") then
		Auction:CloseUpPetWindow()
	else
		Auction:OpenUpPetWindow()
	end
end

-- �ϼ���Ʒ
function OnYbMarket_btnUpItemClicked()
	if IsWindowShow("YbMarketUpItem") then
		Auction:CloseUpItemWindow()
	else
		Auction:OpenUpItemWindow()
	end
end

--�ҳ��۵�
function YbMarket_OnSale_Clicked()
	if IsWindowShow("YbMarketSale") then
		Auction:CloseOnSaleWindow()
	else
		
		local isCanDo = Auction:IsYBMarketCanSwitchPage()
		if isCanDo == 0 then
			PushDebugMessage("#{YBSC_100111_40}")
			return
		end
		
		Auction:OpenOnSaleWindow()
	end
end		


-- ��Ʒ�б��У� action���,  ��1��ʼ������ ��10
function OnYbMarket_ActionItemClicked(index)
	for i = 1 , 10 do
		YbMarket_ctrlItemActions[i]:SetPushed(0)
	end
	YbMarket_ctrlItemActions[index]:SetPushed(1)
	
	YbMarket_Cur_Select = index
end

-- �����б��У� action����� ��1��ʼ������ ��10
function OnYbMarket_ActionPetClicked(index)
	for i = 1 , 10 do
		YbMarket_ctrlPetActions[i]:SetPushed(0)
	end
	YbMarket_ctrlPetActions[index]:SetPushed(1)
	
	YbMarket_Cur_Select = index
end


-- �����б��У� �鿴��ť�� ��1��ʼ������ ��10
function OnYbMarket_btnDetailClicked(index)
	if index > 0 and index <= 10 then
		Auction:ShowYBMarketCurPage_PetInfo(index - 1)
		for i = 1 , 10 do
			YbMarket_ctrlPetActions[i]:SetPushed(0)
		end
		YbMarket_ctrlPetActions[index]:SetPushed(1)
		YbMarket_Cur_Select = index
	end
end


-- ת��
function OnYbMarket_btnGotoPageClicked()
	local isCanDo = Auction:IsYBMarketCanSwitchPage()
	if isCanDo == 0 then
		PushDebugMessage("#{YBSC_100111_40}")
		return
	end
	
	_YbMarket_ClearItemList()
	_YbMarket_ClearPetList()

	local strKey = YbMarket_txtSearchItemName:GetText()
	local pageNum = YbMarket_txtPage:GetText()
	if pageNum == nil or pageNum == "" then
		pageNum = 1
	end
	Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , strKey , tonumber(pageNum))
	--__TestOutPutMsg(YbMarket_nSelectTable , YbMarket_nSelectSubType,nIndex , strKey , tonumber(pageNum))
end

-- ��һҳ
function OnYbMarket_btnUpPageClicked()
	local isCanDo = Auction:IsYBMarketCanSwitchPage()
	if isCanDo == 0 then
		PushDebugMessage("#{YBSC_100111_40}")
		return
	end
	
	if YbMarket_Page_Cur > 1 then
		_YbMarket_ClearItemList()
		_YbMarket_ClearPetList()

		local strKey = YbMarket_txtSearchItemName:GetText()
		Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , strKey , YbMarket_Page_Cur - 1)
		--__TestOutPutMsg(YbMarket_nSelectTable , YbMarket_nSelectSubType,nIndex , strKey , YbMarket_Page_Cur - 1)
	end
end

-- ��һҳ
function OnYbMarket_btnDownPageClicked()
	local isCanDo = Auction:IsYBMarketCanSwitchPage()
	if isCanDo == 0 then
		PushDebugMessage("#{YBSC_100111_40}")
		return
	end
	if YbMarket_Page_Cur < YbMarket_Page_Total then
		_YbMarket_ClearItemList()
		_YbMarket_ClearPetList()

		local strKey = YbMarket_txtSearchItemName:GetText()
		Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , strKey , YbMarket_Page_Cur + 1)
		--__TestOutPutMsg(YbMarket_nSelectTable , YbMarket_nSelectSubType,nIndex , strKey , YbMarket_Page_Cur + 1)
	end
end

-- ����
function OnYbMarket_btnBuyClicked()
	--��ȫʱ��
	if tonumber(DataPool:GetLeftProtectTime()) > 0 then
		PushDebugMessage("#{OR_PILFER_LOCK_FLAG}")
		return
	end
	
	if YbMarket_Cur_Select > 0 and YbMarket_Cur_Select <= 10 then
		local myYB = Player:GetData("YUANBAO");
		if YbMarket_nSelectTable == 1 then
			local pName , pSeller ,pYB = Auction:GetPetAuctionInfo( YbMarket_Cur_Select - 1 )
			if myYB < tonumber(pYB)  then
				PushDebugMessage("#{YBSC_100111_17}")
				return
			end
			Auction:PacketSend_Buy(YbMarket_nSelectTable , YbMarket_Cur_Select - 1 , 0)	
		elseif YbMarket_nSelectTable == 2 then
			local pName , pSeller ,pCount ,pYB = Auction:GetItemAuctionInfo( YbMarket_Cur_Select - 1 )
			if myYB < tonumber( pYB ) then
				PushDebugMessage("#{YBSC_100111_17}")
				return
			end
			Auction:PacketSend_Buy(YbMarket_nSelectTable , YbMarket_Cur_Select - 1 , 0)
		end
	else
		PushDebugMessage("#{YBSC_100111_33}")
	end
end

-- ���ٳ�ֵ
function OnYbMarket_btnWebClicked()
	GameProduceLogin:OpenURL("http://account.changyou.com/_login.jsp")
end

-- �г�ʹ��˵��
function OnYbMarket_btnUsageClicked()
	OpenYBShopReference("#{YBSC_100111_39}")
end


-----------------------------------------------------------------------
--private function
-----------------------------------------------------------------------


function _YbMarket_InitData()
	_YbMarket_ChangeToItemList()
	_YbMarket_ClearItemList()
	
	YbMarket_tblItemMarket:SetCheck(1)
	YbMarket_tblPetMarket:SetCheck(0)
	YbMarket_nSelectTable = 2
	YbMarket_nSelectSubType = 1
	YbMarket_nSearch = 1
	
	YbMarket_CboSearchMode:SetCurrentSelect(0)
	
	YbMarket_btnUpPage:Disable();
	YbMarket_btnDownPage:Disable()
	YbMarket_btnGotoPage:Disable()
	
	YbMarket_txtSearchItemName:SetText("")
	Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType , YbMarket_nSearch , "" , 1)
	
end

function _YbMarket_HideAndInitAllSubButton()
	local i
	for i = 1, table.getn(YbMarket_ctrlAllSubBtns) do
		YbMarket_ctrlAllSubBtns[i] : Hide()
		YbMarket_ctrlAllSubBtns[i] : SetCheck(0)
	end
end

function _YbMarket_ShowItemSubButton()
	local i
	for i=1, table.getn(YbMarket_ctrlItemSubBtns) do
			YbMarket_ctrlItemSubBtns[i].ctrl : SetText( YbMarket_ctrlItemSubBtns[i].text );
			YbMarket_ctrlItemSubBtns[i].ctrl : Show();
	end
end

function _YbMarket_ShowPetSubButton()
	local i
	for i=1, table.getn(YbMarket_ctrlPetSubBtns) do
			YbMarket_ctrlPetSubBtns[i].ctrl : SetText( YbMarket_ctrlPetSubBtns[i].text );
			YbMarket_ctrlPetSubBtns[i].ctrl : Show();
	end
end


function _YbMarket_ChangeToItemList()
	YbMarket_lvwItemTitle:Show()
	YbMarket_ItemInfoBk:Show()
	YbMarket_lvwPetTitle:Hide()
	YbMarket_PetInfoBk:Hide()
	_YbMarket_HideAndInitAllSubButton()
	_YbMarket_ShowItemSubButton()
end

function _YbMarket_ChangeToPetList()
	YbMarket_lvwPetTitle:Show()
	YbMarket_PetInfoBk:Show()
	YbMarket_lvwItemTitle:Hide()
	YbMarket_ItemInfoBk:Hide()
	_YbMarket_HideAndInitAllSubButton()
	_YbMarket_ShowPetSubButton()
end

function _YbMarket_ClearItemList()
	local i, j
	for i =1, 10 do
		for j = 1, 5 do
			YbMarket_ctrlItemTexts[i][j] : SetText("")
		end
		YbMarket_ctrlItemActions[i] : Hide()
	end
end

function _YbMarket_ClearPetList()
	local i, j
	for i =1, 10 do
		for j = 1, 3 do
			YbMarket_ctrlPetTexts[i][j] : SetText("")
		end
		YbMarket_ctrlPetActions[i] : Hide()
		YbMarket_ctrlPetActions[i] : SetPushed(0)
		YbMarket_PetViewBtn[i]:Hide()
	end	
end

-- insert item record
function _YbMarket_InsertItemList(line, itemname, itemplayer, itemcount, itemYB)
	if itemcount <= 0 then
		return
	end
	local i = line
	local itemPerYB = string.format("%.1f" , itemYB / itemcount)
	YbMarket_ctrlItemTexts[i][1] : SetText(itemname)
	YbMarket_ctrlItemTexts[i][2] : SetText(itemplayer)
	YbMarket_ctrlItemTexts[i][3] : SetText(itemcount)
	YbMarket_ctrlItemTexts[i][4] : SetText(itemPerYB)
	YbMarket_ctrlItemTexts[i][5] : SetText(itemYB)
	YbMarket_ctrlItemActions[i] : Show()
end

function _YbMarket_InsertPetList(line, petname, petplayer, petYB , headStr)
	local i = line
	YbMarket_ctrlPetTexts[i][1] : SetText(petname)
	YbMarket_ctrlPetTexts[i][2] : SetText(petplayer)
	YbMarket_ctrlPetTexts[i][3] : SetText(petYB)
	YbMarket_PetViewBtn[i]:Show()
	YbMarket_ctrlPetActions[i] : Show()
	YbMarket_ctrlPetActions[i] : SetProperty("NormalImage", headStr)
end


function __TestOutPutMsg(Type , SubType , Order ,strKey ,Page)

	PushDebugMessage("Type{"..Type.."}:SubType{"..SubType.."}:Order{"..Order.."}:page{"..Page.."}")
	PushDebugMessage("Key:"..strKey)

end

function YbMarket_SearchMode_Changed()
	local str , nIndex = YbMarket_CboSearchMode:GetCurrentSelect()
	if YbMarket_nSearch == nIndex then
		return
	end
	

	local isCanDo = Auction:IsYBMarketCanSwitchPage()
	if isCanDo == 0 then
		PushDebugMessage("#{YBSC_100111_40}")
		return
	end
	
	YbMarket_nSearch = nIndex
	_YbMarket_ClearItemList()
	_YbMarket_ClearPetList()

	local strKey = YbMarket_txtSearchItemName:GetText()
	Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , strKey , YbMarket_Page_Cur)

end


function YbMarket_ResetBn_Clicked()
	local isCanDo = Auction:IsYBMarketCanSwitchPage()
	if isCanDo == 0 then
		PushDebugMessage("#{YBSC_100111_40}")
		return
	end
	
	YbMarket_nSearch = 1
	YbMarket_CboSearchMode:SetCurrentSelect(0)
	YbMarket_txtSearchItemName:SetText("")
	
	if YbMarket_nSelectTable == 2 then
		YbMarket_nSelectSubType = 1
		_YbMarket_ClearItemList()
		_YbMarket_ChangeToItemList()
	else
		YbMarket_nSelectSubType = 1
		_YbMarket_ClearPetList()
		_YbMarket_ChangeToPetList()
	end
	
	Auction:PacketSend_Search(YbMarket_nSelectTable , YbMarket_nSelectSubType,YbMarket_nSearch , "" , 1)
end
