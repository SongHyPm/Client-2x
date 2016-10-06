
local g_nSaveOrGetMoney;

local SAVE_MONEY				= 1;
local GET_MONEY					= 2;
local EXCHANGE_MONEY 		= 3;
local STALLSALE_PRICE		= 4;
local STALLSALE_REPRICE	= 5;
local PS_PRICE_ITEM		  = 6;
local PS_IMMITBASE			= 7;
local PS_IMMIT					= 8;
local PS_DRAW						= 9;
local STALL_PET_UP			= 10;
local STALL_PRICE_PET		= 11;
local PS_PRICE_PET			= 12;
local PS_TRANSFER				= 13;
local SAFEBOX_GET_MONEY = 14;
local SAFEBOX_SAVE_MONEY= 15;

--ÐÞ¸ÄÌ¯Î»ÎïÆ·¼Û¸ñÐèÒªµÄ
local nStallItemID = -1;
local nStallItemIndex = -1;

--===============================================
-- OnLoad()
--===============================================
function InputMoney_PreLoad()
	this:RegisterEvent("TOGLE_INPUT_MONEY");
	
	this:RegisterEvent("BEING_MONEY");
	this:RegisterEvent("CLOSE_INPUT_MONEY");
	
end

function InputMoney_OnLoad()
	
end

--===============================================
-- OnEvent
--===============================================
function InputMoney_OnEvent(event)

	if(event == "TOGLE_INPUT_MONEY") then
		if(arg0~="price")then
			StallSale:UnlockSelItem();
		end
		if (arg0 == "get") then
			this:TogleShow();
			
			
			g_nSaveOrGetMoney = GET_MONEY;
			InputMoney_Title:SetText("#gFF0FA0Rút ti«n");
			InputMoney_Accept_Button:SetText("Duy®t");
			
		elseif (arg0 == "save") then
			this:TogleShow();
			
			g_nSaveOrGetMoney = SAVE_MONEY;
			InputMoney_Title:SetText("#gFF0FA0GØi ti«n");
			InputMoney_Accept_Button:SetText("Duy®t");
			
		elseif (arg0 == "exch") then
			this:TogleShow();
		
			g_nSaveOrGetMoney = EXCHANGE_MONEY;
			InputMoney_Title:SetText("#gFF0FA0Nh§p vào ngân lßþng giao d¸ch");
			InputMoney_Accept_Button:SetText("Duy®t");
			
		elseif (arg0 == "get_safebox") then
			this:TogleShow();
		
			g_nSaveOrGetMoney = SAFEBOX_GET_MONEY;
			InputMoney_Title:SetText("#gFF0FA0 Ði«n vào s¯ lßþng ti«n vàng c¥n rút");
			InputMoney_Accept_Button:SetText("Duy®t");
		
		elseif (arg0 == "save_safebox") then
			this:TogleShow();
		
			g_nSaveOrGetMoney = SAFEBOX_SAVE_MONEY;
			InputMoney_Title:SetText("#gFF0FA0 Ði«n vào s¯ lßþng ti«n vàng c¥n c¤t");
			InputMoney_Accept_Button:SetText("Duy®t");
		
		elseif (arg0 == "price") then
			this:Show();
			
			g_nSaveOrGetMoney = STALLSALE_PRICE;
			InputMoney_Title:SetText("#gFF0FA0Giá thß½ng ph¦m");
			InputMoney_Accept_Button:SetText("Lên giá");
			
		elseif (arg0 == "reprice") then
			this:TogleShow();
			
			g_nSaveOrGetMoney = STALLSALE_REPRICE;
			InputMoney_Title:SetText("#gFF0FA0Thay ð±i báo giá");
			InputMoney_Accept_Button:SetText("Ð±i");
			
		--Íæ¼ÒÉÌµêÉÏ¼Ü(ÎïÆ·)
		elseif (arg0 == "ps_upitem" ) then
			this:Show();
			g_nSaveOrGetMoney = PS_PRICE_ITEM;
			InputMoney_Title:SetText("#gFF0FA0Giá thß½ng ph¦m");
			InputMoney_Accept_Button:SetText("Lên giá");
			
		elseif (arg0 == "ps_uppet" ) then
			this:Show();
			g_nSaveOrGetMoney = PS_PRICE_PET;
			InputMoney_Title:SetText("#gFF0FA0Giá Trân thú");
			InputMoney_Accept_Button:SetText("Lên giá");
		
--		--Íæ¼ÒÉÌµê³åÈë±¾½ð
--		elseif (arg0 == "immitbase") then
--			this:Show();
--			g_nSaveOrGetMoney = PS_IMMITBASE;
--			InputMoney_Title:SetText("#gFF0FA0³äÈë±¾½ð");
--			InputMoney_Accept_Button:SetText("È·¶¨");
--		
--		--Íæ¼ÒÉÌµê³åÈë
--		elseif (arg0 == "immit") then
--			this:Show();
--			g_nSaveOrGetMoney = PS_IMMIT;
--			InputMoney_Title:SetText("#gFF0FA0³äÈë");
--			InputMoney_Accept_Button:SetText("È·¶¨");
--		
--		--Íæ¼ÒÉÌµêÈ¡³ö
--		elseif (arg0 == "draw") then
--			this:Show();
--			g_nSaveOrGetMoney = PS_DRAW;
--			InputMoney_Title:SetText("#gFF0FA0Ö§È¡");
--			InputMoney_Accept_Button:SetText("È·¶¨");
			
		elseif (arg0 == "st_pet") then
			this:Show();
			g_nSaveOrGetMoney = STALL_PET_UP;
			InputMoney_Title:SetText("#gFF0FA0Giá Trân thú");
			InputMoney_Accept_Button:SetText("Lên giá");
		
		elseif (arg0 == "petrepice") then
			this:Show();
			g_nSaveOrGetMoney = STALL_PRICE_PET;
			InputMoney_Title:SetText("#gFF0FA0Giá Trân thú");
			InputMoney_Accept_Button:SetText("Duy®t");
			
		elseif (arg0 == "transfershop") then
			this:Show();
			g_nSaveOrGetMoney = PS_TRANSFER;
			InputMoney_Title:SetText("#gFF0FA0Ð¸nh giá hàng");
			InputMoney_Accept_Button:SetText("Duy®t");
			
		end
		
		InputMoney_Gold:SetText("");
		InputMoney_Silver:SetText("");
		InputMoney_CopperCoin:SetText("");
		InputMoney_Accept_Button:Disable();
		
		if (g_nSaveOrGetMoney == GET_MONEY) then
			local nMoney,nGold,nSilver,nCopper = Bank:GetBankMoney();
			if nGold>99999 then nGold = 99999; nSilver = 99; nCopper = 99; end
			if (nGold == 0) then 
				if (nSilver == 0) then
					InputMoney_Gold:SetText(tostring(nGold));
					InputMoney_Silver:SetText(tostring(nSilver));
					InputMoney_CopperCoin:SetText(tostring(nCopper));
					InputMoney_CopperCoin:SetSelected(0,-1);
					InputMoney_CopperCoin:SetProperty("DefaultEditBox", "True");
				else
					InputMoney_Gold:SetText(tostring(nGold));
					InputMoney_Silver:SetText(tostring(nSilver));
					InputMoney_Silver:SetSelected(0,-1);
					InputMoney_Silver:SetProperty("DefaultEditBox", "True");
					InputMoney_CopperCoin:SetText("0");
				end
			else
				InputMoney_Gold:SetText(tostring(nGold));
				InputMoney_Gold:SetSelected(0,-1);
				InputMoney_Gold:SetProperty("DefaultEditBox", "True");
				InputMoney_Silver:SetText("0");
				InputMoney_CopperCoin:SetText("0");
			end
			
		elseif (g_nSaveOrGetMoney == SAVE_MONEY) then
			local nGold,nSilver,nCopper = Bank:GetBagMoney();
			if nGold>99999 then nGold = 99999; nSilver = 99; nCopper = 99; end
			if (nGold == 0) then 
				if (nSilver == 0) then
					InputMoney_Gold:SetText(tostring(nGold));
					InputMoney_Silver:SetText(tostring(nSilver));
					InputMoney_CopperCoin:SetText(tostring(nCopper));
					InputMoney_CopperCoin:SetSelected(0,-1);
					InputMoney_CopperCoin:SetProperty("DefaultEditBox", "True");
				else
					InputMoney_Gold:SetText(tostring(nGold));
					InputMoney_Silver:SetText(tostring(nSilver));
					InputMoney_Silver:SetSelected(0,-1);
					InputMoney_Silver:SetProperty("DefaultEditBox", "True");
					InputMoney_CopperCoin:SetText("0");
				end
			else
				InputMoney_Gold:SetText(tostring(nGold));
				InputMoney_Gold:SetSelected(0,-1);
				InputMoney_Gold:SetProperty("DefaultEditBox", "True");
				InputMoney_Silver:SetText("0");
				InputMoney_CopperCoin:SetText("0");
			end

			
			
			
		end

		
		if( (this:IsVisible() == true) and (g_nSaveOrGetMoney ~= GET_MONEY) and (g_nSaveOrGetMoney ~= SAVE_MONEY) )  then 
			InputMoney_Gold:SetProperty("DefaultEditBox", "True");
			
			--È·¶¨Õâ¸ö´°¿ÚµÄ·ÅÖÃÎ»ÖÃ
			--local nPosX ;
			--local nPosY ;
			--nPosX,nPosY = GetCurMousePos();
			--AxTrace(0,0,"nPosX =" .. tostring(nPosX) "   nPosY =" .. tostring(nPosY));
			--InputMoney_Frame:AutoMousePosition(nPosX, nPosY);

		end
		
	elseif( event == "CLOSE_INPUT_MONEY")	 then
		this:Hide();
	
	end
	
end


--===============================================
-- ÊäÈë½ðÇ®ºóÈ·¶¨
--===============================================
function InputMoneyAccept_Clicked()

	local szGold = InputMoney_Gold:GetText();
	local szSilver = InputMoney_Silver:GetText();
	local szCopperCoin = InputMoney_CopperCoin:GetText();
	
	--ÔÚ³ÌÐòÀïÍ·ÔÙ¼ì²âÊäÈë×Ö·ûµÄÓÐÐ§ÐÔºÍÊýÖµ
	local bAvailability,nMoney = Bank:GetInputMoney(szGold,szSilver,szCopperCoin);
	
	--???Ê²Ã´Çé¿öÏÂÊ§°ÜÐèÒªÔÙ¶¨
	if(bAvailability == true) then
		
		if( g_nSaveOrGetMoney == SAVE_MONEY ) then
			--Ö´ÐÐ´æÇ®²Ù×÷
			Bank:SaveMoneyToBank(nMoney);
			this:Hide();
			
		elseif( g_nSaveOrGetMoney == GET_MONEY ) then
			--Ö´ÐÐÈ¡Ç®²Ù×÷
			Bank:GetMoneyFromBank(nMoney);
			this:Hide();
			
		elseif( g_nSaveOrGetMoney == EXCHANGE_MONEY ) then
			--Ö´ÐÐExchangÖÐµÄ½ðÇ®µÄÊäÈë
			Exchange:GetMoneyFromInput(nMoney);
			this:Hide();
			
		elseif( g_nSaveOrGetMoney == SAFEBOX_GET_MONEY ) then
			--Ö´ÐÐ±£ÏÕÏäÖÐµÄ½ðÇ®µÄÊäÈë
			SafeBox("realgetmoney", nMoney);
			this:Hide();
			
		elseif( g_nSaveOrGetMoney == SAFEBOX_SAVE_MONEY ) then
			--Ö´ÐÐ±£ÏÕÏäÖÐµÄ½ðÇ®µÄÊäÈë
			SafeBox("realsavemoney", nMoney);
			this:Hide();
			
		elseif( g_nSaveOrGetMoney == STALLSALE_PRICE ) then
			--Ö´ÐÐStallSaleÖÐµÄÉÌÆ·±ê¼Û(Ìá½»ÉÌÆ·¼Û¸ñ)
			StallSale:ReferItemPrice(nMoney);
			this:Hide();
			
		elseif( g_nSaveOrGetMoney == STALLSALE_REPRICE ) then
			--Ö´ÐÐStallSaleÖÐµÄÉÌÆ·¸ü¸Ä¼Û¸ñ

			--´ÓÈ«¾Ö±äÁ¿ÖÐÈ¡³öÊý¾Ý
			nStallItemID		= GetGlobalInteger("StallSale_ItemID");
			nStallItemIndex = GetGlobalInteger("StallSale_Item");

			StallSale:ItemReprice(nMoney,nStallItemID,nStallItemIndex);
			this:Hide();
			
		elseif( g_nSaveOrGetMoney == PS_PRICE_ITEM ) then
			--Ö´ÐÐÍæ¼ÒÉÌµêµÄ¼Û¸ñÊäÈë(ÎïÆ·)
			PlayerShop:UpStall("item",nMoney);
			this:Hide();
			
--		elseif( g_nSaveOrGetMoney == PS_IMMITBASE ) then
--			--³äÈë±¾½ð
--			PlayerShop:DealMoney("immitbase",nMoney);
--			this:Hide();
--		
--		elseif( g_nSaveOrGetMoney == PS_IMMIT ) then
--			--³äÈë
--			PlayerShop:DealMoney("immit",nMoney);
--			this:Hide();
--		
--		elseif( g_nSaveOrGetMoney == PS_DRAW ) then
--			--Ö§È¡
--			PlayerShop:DealMoney("draw",nMoney);
--			this:Hide();
			
		elseif( g_nSaveOrGetMoney == STALL_PET_UP ) then
			--ÕäÊÞÉÏ¼Ü
			StallSale:PetUpStall(nMoney);
			this:Hide();
			
		elseif( g_nSaveOrGetMoney == STALL_PRICE_PET ) then
			StallSale:PetReprice(nMoney);
			this:Hide();
		
		elseif( g_nSaveOrGetMoney == PS_PRICE_PET ) then
			--Ö´ÐÐÍæ¼ÒÉÌµêµÄ¼Û¸ñÊäÈë(ÕäÊÞ)
			PlayerShop:UpStall("pet",nMoney);
			this:Hide();
			
		elseif( g_nSaveOrGetMoney == PS_TRANSFER )  then
			--³ö¼ÛÅÌµê
			-- add by zchw
			if (tonumber(nMoney) > 100000000) then
				InputMoney_Gold:SetText("");
				InputMoney_Silver:SetText("");
				InputMoney_CopperCoin:SetText("");
				PushDebugMessage("Giá cä thß½ng ðiªm bày bán không ðßþc quá 10000 vàng, xin hãy nh§p lÕi.");
				return;
			end
			PlayerShop:Transfer("info", "sale", nMoney);
			this:Hide();
			
		end
		
	end
end


--===============================================
-- È¡Ïû
--===============================================
function InputMoneyRefuse_Clicked()
	StallSale:UnlockSelItem();
	this:Hide();
	InputMoney_CopperCoin:SetProperty("DefaultEditBox", "False");
	InputMoney_Gold:SetProperty("DefaultEditBox", "False");
	InputMoney_Silver:SetProperty("DefaultEditBox", "False");
end


--===============================================
-- ÊäÈë¸Ä±ä
--===============================================
function InputMoney_ChangeMoney()
	
	local szGold = InputMoney_Gold:GetText();
	local szSilver = InputMoney_Silver:GetText();
	local szCopperCoin = InputMoney_CopperCoin:GetText();
	
	if(szGold=="" and szSilver=="" and szCopperCoin=="")then
		InputMoney_Accept_Button:Disable();
	else
		InputMoney_Accept_Button:Enable();
	end

end
