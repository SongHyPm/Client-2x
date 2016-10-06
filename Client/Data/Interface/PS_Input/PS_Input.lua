
local g_MoneyType=-1;

local PS_IMMITBASE			= 1;
local PS_IMMIT					= 2;
local PS_DRAW						= 3;

local objCared = -1;
local MAX_OBJ_DISTANCE = 3.0;

--===============================================
-- PreLoad
--===============================================
function PS_Input_PreLoad()
	this:RegisterEvent("PS_INPUT_MONEY");
	this:RegisterEvent("OBJECT_CARED_EVENT");
	this:RegisterEvent("PS_CLOSE_SHOP_MAG");
end

--===============================================
-- OnLoad
--===============================================
function PS_Input_OnLoad()
end

--===============================================
-- OnEvent
--===============================================
function PS_Input_OnEvent(event)

	if(event == "PS_INPUT_MONEY") then
		--玩家商店冲入本金
		if (arg0 == "immitbase") then
			this:Show();
			objCared = PlayerShop:GetNpcId();
			this:CareObject(objCared, 1, "PS_Input");	

			g_nSaveOrGetMoney = PS_IMMITBASE;
			
			local nBaseMoney;
			local nMoney1;
			local nMoney2;
			local nMoney3;
			nBaseMoney,nMoney1,nMoney2,nMoney3 = PlayerShop:GetMoney("base","self");

			PS_Input_DragTitle:SetText("#gFF0FA0N誴 ti玭 v鄌");
			PS_Input_Accept:SetText("N誴");
			PS_Input_Warning:SetText("N誴 s� ti玭 nh� nh l� 10#-02#rc� s� s� ti玭 hi畁 t読 l�".. tostring(nMoney1) .."#-02" .. tostring(nMoney2) .. "#-03" .. tostring(nMoney3) .. "#-04");
			PS_Input_CurrentlyPrincipal:SetProperty("MoneyNumber", tostring(nBaseMoney));
			PS_Input_Text1:SetText("M秈 n誴 s� ti玭 n鄖 v鄌: ");
			PS_Input_Text2:SetText("S� ti玭 hi畁 t読: ");
			
			PS_Input_Gold:SetProperty("DefaultEditBox", "True");
			
		--玩家商店冲入
		elseif (arg0 == "immit") then
			this:Show();
			objCared = PlayerShop:GetNpcId();
			this:CareObject(objCared, 1, "PS_Input");	

			g_nSaveOrGetMoney = PS_IMMIT;
			PS_Input_DragTitle:SetText("#gFF0FA0 nh v鄌 ti玭 l㱮 nhu");
			PS_Input_Accept:SetText("N誴");
			PS_Input_CurrentlyPrincipal:SetProperty("MoneyNumber", tostring(PlayerShop:GetMoney("profit","self")));
			
			local nBaseMoney;
			local nMoney1;
			local nMoney2;
			local nMoney3;
			nBaseMoney,nMoney1,nMoney2,nMoney3 = PlayerShop:GetMoney("input_profit","self");
			local szCom = PlayerShop:GetCommercialFactor()

			local szInfo = "S� ti玭 l㱮 nhu nh v鄌 kh鬾g 疬㧟 th h絥 s� v鄋g hi畁 c�: s� v鄋g hi畁 c�: 30" .. "#-02" .. "*Ch� s� th呓ng nghi畃*s� qu h鄋g, ch� s� th呓ng nghi畃 tr呔c 痼 l�".. szCom .. ", c醕 h� 韙 nh c n誴 v鄌".. tostring(nMoney1) .."#-02" .. tostring(nMoney2) .. "#-03" .. tostring(nMoney3) .. "#-04";
			PS_Input_Warning:SetText(szInfo);
			
			PS_Input_Text1:SetText("Xin nh v鄌 ti玭 l㱮 nhu:");
			PS_Input_Text2:SetText("ti玭 l㱮 nhu hi畁 t読:");

			PS_Input_Gold:SetProperty("DefaultEditBox", "True");

		--玩家商店取出
		elseif (arg0 == "draw") then
			this:Show();
			objCared = PlayerShop:GetNpcId();
			this:CareObject(objCared, 1, "PS_Input");	

			g_nSaveOrGetMoney = PS_DRAW;
			PS_Input_DragTitle:SetText("#gFF0FA0R鷗 ti玭 l㱮 nhu");
			PS_Input_Accept:SetText("L頽h");

			PS_Input_Warning:SetText("#{SHOPTIPS_090205_2}");--[tx44221]

			PS_Input_Text1:SetText("Mu痭 r鷗 ti玭 l㱮 nhu: ");
			PS_Input_Text2:SetText("ti玭 l㱮 nhu hi畁 t読:");

			PS_Input_Gold:SetProperty("DefaultEditBox", "True");
			PS_Input_CurrentlyPrincipal:SetProperty("MoneyNumber", tostring(PlayerShop:GetMoney("profit","self")));
		end		
		PS_Input_Frame:SetForce();
		PS_Input_Gold:SetText("");
		PS_Input_Silver:SetText("");
		PS_Input_CopperCoin:SetText("");
		
	elseif ( event == "OBJECT_CARED_EVENT" )   then
		if(tonumber(arg0) ~= objCared) then
			return;
		end
		
		--如果和NPC的距离大于一定距离或者被删除，自动关闭
		if(arg1 == "distance" and tonumber(arg2)>MAX_OBJ_DISTANCE or arg1=="destroy") then
			g_InitiativeClose = 1;
			this:Hide();

			--取消关心
			this:CareObject(objCared, 0, "PS_Input");
		end	
	
	elseif( event == "PS_CLOSE_SHOP_MAG" )    then
	
		if( this:IsVisible() )   then
			this:Hide();
			--取消关心
			this:CareObject(objCared, 0, "PS_Input");
		end
		
	end	
	
end

--===============================================
-- Accept
--===============================================
function PS_Input_Accept_Clicked()
	local szGold = PS_Input_Gold:GetText();
	local szSilver = PS_Input_Silver:GetText();
	local szCopperCoin = PS_Input_CopperCoin:GetText();
	
	--在程序里头再检测输入字符的有效性和数值
	local bAvailability,nMoney = Bank:GetInputMoney(szGold,szSilver,szCopperCoin);
	if(bAvailability == true) then
	
		if( g_nSaveOrGetMoney == PS_IMMITBASE ) then
			--充入本金
			local szResult;
			local nResult;
			szResult,nResult= PlayerShop:DealMoney("immitbase",nMoney)
			if( szResult == "ok" )   then
				this:Hide();
				--取消关心
				this:CareObject(objCared, 0, "PS_Input");

				PlayerShop:ApplyMoney("immitbase",nMoney);
				
			elseif(szResult == "few" )  then
				

			elseif(szResult == "more" )  then
				this:Hide();
				--取消关心
				this:CareObject(objCared, 0, "PS_Input");

				PlayerShop:ApplyMoney("immitbase",nResult);

			end
		
		elseif( g_nSaveOrGetMoney == PS_IMMIT ) then
			--充入
			local szResult;
			local nResult;
			szResult,nResult= PlayerShop:DealMoney("immit",nMoney);
			
			if( szResult == "ok" )   then
				this:Hide();
				--取消关心
				this:CareObject(objCared, 0, "PS_Input");

				PlayerShop:ApplyMoney("immit",nMoney);
			
			elseif(szResult == "few" )  then
				
			
			elseif(szResult == "more" )  then
				this:Hide();
				--取消关心
				this:CareObject(objCared, 0, "PS_Input");

				PlayerShop:ApplyMoney("immit",nResult);

			end
		
		elseif( g_nSaveOrGetMoney == PS_DRAW ) then
			--支取
			PlayerShop:ApplyMoney("draw_ok",nMoney);
			this:Hide();
			--取消关心
			this:CareObject(objCared, 0, "PS_Input");
			
		end
	end
end

--===============================================
-- Cancel
--===============================================
function PS_Input_Cancel_Clicked()
	this:Hide();
	--取消关心
	this:CareObject(objCared, 0, "PS_Input");
end


--===============================================
-- OnHiden
--===============================================
function PS_Input_Frame_OnHiden()
	PS_Input_Gold:SetProperty("DefaultEditBox", "False");
	PS_Input_Silver:SetProperty("DefaultEditBox", "False");
	PS_Input_CopperCoin:SetProperty("DefaultEditBox", "False");
end

