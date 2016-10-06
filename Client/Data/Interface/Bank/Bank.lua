local g_InitiativeClose = 0;

--����������
local PACK_BUTTONS_NUM = 5;
local PACK_BUTTONS = {};

--���Ӽ�����
local GRID_BUTTONS_NUM = 20;
local GRID_BUTTONS = {};

--ʵ��ÿ���������еĸ�����
local nUsedGrid = {};

--��ǰ�򿪵�������
local g_CurrentRentBox = 1;

local objCared = -1;
local MAX_OBJ_DISTANCE = 3.0;

--===============================================
-- OnLoad()
--===============================================
function Bank_PreLoad()

	this:RegisterEvent("TOGLE_BANK");
	this:RegisterEvent("UPDATE_BANK");
	this:RegisterEvent("OBJECT_CARED_EVENT");
	this:RegisterEvent("PACKAGE_ITEM_CHANGED");

end
	
function Bank_OnLoad()

	GRID_BUTTONS[1]  = Bank_Item1;
	GRID_BUTTONS[2]  = Bank_Item2;
	GRID_BUTTONS[3]  = Bank_Item3;
	GRID_BUTTONS[4]  = Bank_Item4;
	GRID_BUTTONS[5]  = Bank_Item5;
	GRID_BUTTONS[6]  = Bank_Item6;
	GRID_BUTTONS[7]  = Bank_Item7;
	GRID_BUTTONS[8]  = Bank_Item8;
	GRID_BUTTONS[9]  = Bank_Item9;
	GRID_BUTTONS[10] = Bank_Item10;
	GRID_BUTTONS[11] = Bank_Item11;
	GRID_BUTTONS[12] = Bank_Item12;
	GRID_BUTTONS[13] = Bank_Item13;
	GRID_BUTTONS[14] = Bank_Item14;
	GRID_BUTTONS[15] = Bank_Item15;
	GRID_BUTTONS[16] = Bank_Item16;
	GRID_BUTTONS[17] = Bank_Item17;
	GRID_BUTTONS[18] = Bank_Item18;
	GRID_BUTTONS[19] = Bank_Item19;
	GRID_BUTTONS[20] = Bank_Item20;
										 
	PACK_BUTTONS[1]  = Bank_patulousBox_1;
	PACK_BUTTONS[2]  = Bank_patulousBox_2;
	PACK_BUTTONS[3]  = Bank_patulousBox_3;
	PACK_BUTTONS[4]  = Bank_patulousBox_4;
	PACK_BUTTONS[5]  = Bank_patulousBox_5;

end										


--===============================================
-- OnEvent
--===============================================
function Bank_OnEvent(event)

	if(event == "TOGLE_BANK") then
		this:Show();
		g_InitiativeClose = 0;
		
		--����NPC
		objCared = Bank:GetNpcId();
		this:CareObject(objCared, 1, "Bank");
		
		for i=1, PACK_BUTTONS_NUM do
			PACK_BUTTONS[i]:Hide();
		end
		
		--����Ѿ�ӵ�е����������
		local nRentNum = Bank:GetRentBoxNum();
		--�����Ѿ�ӵ�е��������ͼ��
		for i=1, nRentNum do
			PACK_BUTTONS[i]:Show();
		end
		
		g_CurrentRentBox = 1;
		Bank_UpdateFrame(g_CurrentRentBox);
		
	elseif(event == "UPDATE_BANK")  then
		Bank_UpdateFrame(g_CurrentRentBox);
	
	elseif (event == "OBJECT_CARED_EVENT") then
		AxTrace(0, 0, "arg0"..arg0.." arg1"..arg1.." arg2"..arg2);
		if(tonumber(arg0) ~= objCared) then
			return;
		end
		--�����NPC�ľ������һ��������߱�ɾ�����Զ��ر�
		if(arg1 == "distance" and tonumber(arg2)>MAX_OBJ_DISTANCE or arg1=="destroy") then
			g_InitiativeClose = 1;
			this:Hide();
			Bank:Close();

			--ȡ������
			this:CareObject(objCared, 0, "Bank");
		end

	elseif ( event == "PACKAGE_ITEM_CHANGED" and this:IsVisible()) then
		Bank_UpdateFrame(g_CurrentRentBox);

	end
end

--===============================================
-- Bank_UpdateFrame
--===============================================
function Bank_UpdateFrame(nIndex)

		Bank:SetCurRentIndex(nIndex);
		for i=1, PACK_BUTTONS_NUM do
			if(i==nIndex) then
				PACK_BUTTONS[i]:SetPushed(1);
			else
				PACK_BUTTONS[i]:SetPushed(0);
			end
		end
		
		for i=1, GRID_BUTTONS_NUM do
			GRID_BUTTONS[i]:SetActionItem(-1);
			GRID_BUTTONS[i]:Enable();
		end
	
	
	--�����Ǯ
	local nMoney;
	local nGoldCoin;	
	local nSilverCoin;
	local nCopperCoin;

	nMoney,nGoldCoin,nSilverCoin,nCopperCoin = Bank:GetBankMoney();
	Bank_Money:SetProperty("MoneyNumber", tostring(nMoney));	
		
	--��������������ʹ�õĸ�����
	local nBeginIndex,nGridNum = Bank:GetRentBoxInfo(nIndex);
	
	--������Щ����ʹ�õĸ��ӣ��ûҲ���ʹ�õĸ���
	for i=1, nGridNum do
		GRID_BUTTONS[i]:Show();
	end
	
	for i=nGridNum+1 ,GRID_BUTTONS_NUM do
		GRID_BUTTONS[i]:SetProperty("NormalImage","set:Common2 image:Unopened_Normal");
		GRID_BUTTONS[i]:SetProperty("Empty","False");
		--�����ĸ��ǵ����֣�ȫ����Ϊ��
		GRID_BUTTONS[i]:SetProperty("CornerChar","TopLeft ");
		GRID_BUTTONS[i]:SetProperty("CornerChar","TopRight ");
		GRID_BUTTONS[i]:SetProperty("CornerChar","BotLeft ");
		GRID_BUTTONS[i]:SetProperty("CornerChar","BotRight ");
		GRID_BUTTONS[i]:Disable();
	end

	--�����ݳ���ʹ���������뱳���ڵ���Ʒ
	local nTotalNum = GetActionNum("bankitem");
	
	local nActIndex = nBeginIndex;
	local i=1;
	for i=1, nGridNum  do
		local theAction, bLocked = Bank:EnumItem(nActIndex);
		nActIndex = nActIndex+1;

		if theAction:GetID() ~= 0 then
			GRID_BUTTONS[i]:SetActionItem(theAction:GetID());
			if(bLocked == true) then 
				GRID_BUTTONS[i]:Disable();
			else
				GRID_BUTTONS[i]:Enable();
			end
		else
			GRID_BUTTONS[i]:SetActionItem(-1);
		end
	end

end

--===============================================
-- �򿪴�Ǯ�ĶԻ���
--===============================================
function Bank_Save_Clicked()
	Bank:OpenSaveFrame();
end

--===============================================
-- ��ȡǮ�ĶԻ���
--===============================================
function Bank_Get_Clicked()
	Bank:OpenGetFrame();
end


--===============================================
-- ���������Ĳ��� 
--===============================================
function Bank_patulousBox_Clicked(nIndex)

	g_CurrentRentBox = nIndex;
	--AxTrace(0, 0, "Bank:g_CurrentRentBox =  " .. g_CurrentRentBox);
	Bank_UpdateFrame(nIndex);

end

--===============================================
-- ����ر�
--===============================================
function Bank_Close_Clicked()
	if(g_InitiativeClose == 1)  then
		return;
	end
	
	this:CareObject(objCared, 0, "Bank");
	this:Hide();
	Bank:Close();
end


--========================================================================
--
-- ���ö������롣
--
--========================================================================
function Bank_SuperPassword_Clicked()

		Player:SetSupperPassword();
end;