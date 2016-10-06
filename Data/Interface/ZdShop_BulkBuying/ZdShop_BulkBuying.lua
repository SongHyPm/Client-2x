local g_ItemMax = 0;
local g_ItemIdx = -1;

local ARR_PRICE = {};

local CU_ZENGDIAN			= 6	-- ����

function ZdShop_BulkBuying_PreLoad()
	this:RegisterEvent("OPEN_BULKBUY_BOOTH_ZD");
	this:RegisterEvent("UPDATE_ZENGDIAN");
	this:RegisterEvent("CLOSE_BOOTH");
end

function ZdShop_BulkBuying_OnLoad()
	ARR_PRICE[1] = Shop_BulkBuying_Money1;
	ARR_PRICE[2] = Shop_BulkBuying_Money2;
	ARR_PRICE[3] = Shop_BulkBuying_Money3;
end

function ZdShop_BulkBuying_OnEvent(event)
	if(event == "OPEN_BULKBUY_BOOTH_ZD") then
		ZdShop_BulkBuying_Open(tonumber(arg0));
	elseif(event == "CLOSE_BOOTH") then
		this:Hide();
	elseif( (event == "UPDATE_ZENGDIAN" ) and this:IsVisible()) then
		local playerZengDian = Player:GetData("ZENGDIAN");
		ZdShop_BulkBuying_Money3:SetText(playerZengDian);
	end
end

function ZdShop_BulkBuying_Open( idx )
	--�̵������Ľ�Ǯ��
	local i = 0;
	if(NpcShop:GetShopType("unit") == CU_ZENGDIAN) then
		--���λ�õ���Ʒ�ĵ��������Ǵ���1��
		g_ItemMax = NpcShop:EnumItemMaxOverlay(idx);
		--if(g_ItemMax > 1) then
			--������������ʾ����
		
			ZdShop_BulkBuying_IME:SetProperty("DefaultEditBox", "True");
			g_ItemIdx = idx;
			local price = NpcShop:EnumItemPrice(g_ItemIdx);
			--local playerZengDian = Player:GetData("IPREGION");
			local playerZengDian = Player:GetData("ZENGDIAN");
			--��Ҫ����
			--Shop_BulkBuying_Money2:SetProperty("MoneyMaxNumber", playerMoney);
			ZdShop_BulkBuying_Money2:SetText(price*20);
			--��Ʒ����
			ZdShop_BulkBuying_Money1:SetText(price);
			--����Я��
			ZdShop_BulkBuying_Money3:SetText(playerZengDian);
			--����
			ZdShop_BulkBuying_IME:SetProperty("DefaultEditBox", "True");
			ZdShop_BulkBuying_IME:SetText("20");
			ZdShop_BulkBuying_IME:SetSelected( 0, -1 );
			--����
			ZdShop_BulkBuying_PageHeader:SetText("#gFF0FA0"..NpcShop:EnumItemName(g_ItemIdx));
			this:Show();
		--end
	end
	
		
end

function ZdShop_BulkBuying_Accept_Clicked()
	--������
	local num = tonumber(ZdShop_BulkBuying_IME:GetText());
	if(nil ~= num) then
		if( tonumber( num ) == 0  ) then
		else
			NpcShop:BulkBuyItem(g_ItemIdx, num);
		end
	end
	this:Hide();
end

function ZdShop_BulkBuying_TextChanged()
	local num = tonumber(ZdShop_BulkBuying_IME:GetText());
	if(nil == num or(num and num < 0)) then 
		ZdShop_BulkBuying_Money2:SetText(0);
		return; 
	end
	
	if(num > 20) then
		num = 20;
	end
	if(num == 0) then
		ZdShop_BulkBuying_Money2:SetText(0);
	end
	--if(tostring(num) ~= Shop_BulkBuying_IME:GetText())then --�ý�Ǯ��ʱ����,by hukai#38377
		local price = NpcShop:EnumItemPrice(g_ItemIdx)*num;
		ZdShop_BulkBuying_Money2:SetText(price);
		ZdShop_BulkBuying_IME:SetTextOriginal(num); --�޸�ԭ����bug���ݹ���õ��¿ͻ��˽ű�ϵͳ����
	--end
	
end