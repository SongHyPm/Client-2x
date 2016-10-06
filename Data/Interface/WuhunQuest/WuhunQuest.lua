--Create By Vega
local g_FrameInfo = -1				--当前窗口确认的类型
local FrameInfoList = {
	YBMARKET_UP_ITEM_COMFIRM 			= 1,			--元宝市场上架物品
	YBMARKET_UP_PET_COMFIRM 			= 2,			--元宝市场上架珍兽
	YBMARKET_BUY_COMFIRM 				= 3,			--元宝市场买东西
	YBMARKET_TAKE_BACK_COMFIRM 			= 4,			--商品下架
	SELL_ITEM_CONFIRM					= 5,			--zhanglei 卖出物品再次确认
	PET_EQUIP_SUITUP_CONFIRM			= 6,
	
}
--确认框缓存变量，用于点击确定和取消时做处理, 每个变量的意义，根据界面不同各不相同，请使用者用到时自己注释
local g_FrameVar = {
	[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[5] = 0,
	[6] = 0,
	[7] = 0,
	[8] = 0,
}
function WuhunQuest_PreLoad()
	this:RegisterEvent("GAME_NOTIFY_INFO_OK");
	this:RegisterEvent("GAME_NOTIFY_INFO_CLOSE");
	this:RegisterEvent("GAME_NOTIFY_INFO_YESNO");
	this:RegisterEvent("UI_COMMAND");

	this:RegisterEvent("YBMARKET_UP_ITEM_COMFIRM")
	this:RegisterEvent("YBMARKET_UP_PET_COMFIRM")
	this:RegisterEvent("YBMARKET_BUY_COMFIRM")
	this:RegisterEvent("YBMARKET_TAKE_BACK_COMFIRM")

	this:RegisterEvent("SELL_ITEM_CONFIRM") 
	this:RegisterEvent("PET_EQUIP_SUITUP_CONFIRM")
end

function WuhunQuest_OnLoad()
	WuhunQuest_Frame_sub:SetProperty("AlwaysOnTop", "True");
end

function WuhunQuestUpdateRect()
	local nWidth, nHeight = WuhunQuest_InfoWindow:GetWindowSize();
	local nTitleHeight = 23;
	local nBottomHeight = 25;
	nWindowHeight = nTitleHeight + nBottomHeight + nHeight;
	WuhunQuest_Frame_sub:SetProperty( "AbsoluteHeight", tostring( nWindowHeight ) );
end

-- OnEvent
function WuhunQuest_OnEvent(event)
	--******************************
	--建议：处理不同的event，请在读出参数后，将逻辑自己写在一个函数内
	--这样可以尽可能的使OnEvent函数能简洁一些不至于像MessageBox界面一样
	--注意：一定要先将参数读出来再传给自己写的函数
	--参考：event == "YBMARKET_UP_ITEM_COMFIRM"
	--*******************************
	if ( event == "GAME_NOTIFY_INFO_OK" ) then
		local str = arg0
		WuhunQuest_Open_Window_OK(str)		--点击后不需要有处理的提示框，只有一个确认按钮，显示信息由参数传入
	elseif ( event == "GAME_NOTIFY_INFO_CLOSE") then
		local str = arg0
		WuhunQuest_Open_Window_CLOSE(str)
	elseif ( event == "GAME_NOTIFY_INFO_YESNO") then
		local str = arg0
		WuhunQuest_Open_Window_YESNO(str)
	elseif ( event == "YBMARKET_UP_ITEM_COMFIRM" ) then
		local nIndex = tonumber(arg0)
		local nPrice = tonumber(arg1)
		WuhunQuest_Open_Window_YBM_UpItem(nIndex , nPrice)
	elseif ( event == "YBMARKET_UP_PET_COMFIRM" ) then
		local nIndex = tonumber(arg0)
		local nPrice = tonumber(arg1)
		WuhunQuest_Open_Window_YBM_UpPet(nIndex , nPrice)
	elseif ( event == "YBMARKET_BUY_COMFIRM" ) then
		local nType = tonumber(arg0)
		local nIndex =tonumber(arg1)
		local nPrice = tonumber(arg2)
		WuhunQuest_Open_Window_YBM_Buy(nType ,nIndex ,nPrice)
	elseif ( event == "YBMARKET_TAKE_BACK_COMFIRM" ) then
		local nType = tonumber(arg0)
		local nIndex = tonumber(arg1)
		WuhunQuest_Open_Window_YBM_TakeBack(nType , nIndex)
	elseif ( event == "SELL_ITEM_CONFIRM" ) then
		local nItemPos = tonumber(arg0)
		WuhunQuest_Open_Window_SellItemConfirm(nItemPos);
	elseif (event == "PET_EQUIP_SUITUP_CONFIRM") then
		local nType 	= tonumber(arg0)
		local nEquipPos = tonumber(arg1)
		local nItemNum	= tonumber(arg2)
		local nPercent	= tonumber(arg3)
		local nObjCareId= tonumber(arg4)
		WuhunQuest_Open_Window_PetEquipSuitUp(nType, nEquipPos, nItemNum, nPercent, nObjCareId)
	end

end

-- 按钮1 点击事件
function WuhunQuest_Bn1Click()

	if (g_FrameInfo == FrameInfoList.YBMARKET_UP_ITEM_COMFIRM ) then
		Auction:PacketSend_SellItem(g_FrameVar[1] , tonumber(g_FrameVar[2]) , 1)
	elseif (g_FrameInfo == FrameInfoList.YBMARKET_UP_PET_COMFIRM  ) then
		Auction:PacketSend_SellPet(g_FrameVar[1] , tonumber(g_FrameVar[2]) ,1)
	elseif (g_FrameInfo == FrameInfoList.YBMARKET_BUY_COMFIRM  ) then
		Auction:PacketSend_Buy(g_FrameVar[1] , g_FrameVar[2] , 1)
	elseif (g_FrameInfo == FrameInfoList.YBMARKET_TAKE_BACK_COMFIRM  ) then
		Auction:GetBackWhatOnSale(g_FrameVar[1] , g_FrameVar[2] ,1 )
	elseif (g_FrameInfo == FrameInfoList.SELL_ITEM_CONFIRM) then
		PlayerPackage:SellCurrItem(tonumber(g_FrameVar[1]) )
	elseif (g_FrameInfo == FrameInfoList.PET_EQUIP_SUITUP_CONFIRM) then
		WuhunQuest_Window_PetEquipSuitUp_Confirm()
	end
	this:Hide();

end
-- 按钮2 点击事件
function WuhunQuest_Bn2Click()
	this:Hide();
end

function WuhunQuest_Frame_OnHiden()
	if(IsWindowShow("AntiJDY")) then    --简单游互斥界面显示时，不激活快捷键 for 69994
	else
		DataPool:SetCanUseHotKey(1);
	end
	WuhunQuest_Clear_Var()
end

function WuhunQuest_CleanUp()
	WuhunQuest_Frame_sub:SetProperty( "UnifiedPosition", "{{0.500000,-173.000000},{0.500000,-118.000000}}" )
	WuhunQuest_Button2:Hide();
	WuhunQuest_Button1:Hide();
end

function WuhunQuest_Clear_Var()
	for i = 1,8 do
		g_FrameVar[i] = 0
	end
	g_FrameInfo = -1
end
-- event == "GAME_NOTIFY_INFO_OK"
function WuhunQuest_Open_Window_OK(str)
	WuhunQuest_Clear_Var()
	WuhunQuest_InfoWindow:SetText(str);
	WuhunQuestUpdateRect();
	WuhunQuest_Button1:Show()
	WuhunQuest_Button1:SetText("#{INTERFACE_XML_557)");  --确定
	WuhunQuest_Button2:Hide()
	DataPool:SetCanUseHotKey(0)
	this:Show();
end
-- event == "GAME_NOTIFY_INFO_CLOSE"
function WuhunQuest_Open_Window_CLOSE(str)
	WuhunQuest_Clear_Var()
	WuhunQuest_InfoWindow:SetText(arg0);
	WuhunQuestUpdateRect();
	WuhunQuest_Button1:Show()
	WuhunQuest_Button1:SetText("#{INTERFACE_XML_1173}");  --关闭
	WuhunQuest_Button2:Hide()
	DataPool:SetCanUseHotKey(0)
	this:Show();
end
-- event == "GAME_NOTIFY_INFO_YESNO"
function WuhunQuest_Open_Window_YESNO(str)
	WuhunQuest_Clear_Var()
	WuhunQuest_InfoWindow:SetText(arg0);
	WuhunQuestUpdateRect();
	WuhunQuest_Button1:Show()
	WuhunQuest_Button1:SetText("#{INTERFACE_XML_557}");  --确定
	WuhunQuest_Button2:Show()
	WuhunQuest_Button2:SetText("#{INTERFACE_XML_542}");  --取消
	DataPool:SetCanUseHotKey(0)
	this:Show();
end
-- event == "YBMARKET_UP_ITEM_COMFIRM"
function WuhunQuest_Open_Window_YBM_UpItem(nIndex , nPrice)
	WuhunQuest_Clear_Var()
	g_FrameVar[1]  = tonumber(nIndex)
	g_FrameVar[2]  = tonumber(nPrice)
	local itemName = PlayerPackage:GetBagItemName(g_FrameVar[1])
--	local nNum 	= PlayerPackage:GetBagItemNum(g_FrameVar[1])
	local needMoney = Auction:GetNeedMoneyForSell(g_FrameVar[2])
--	local totalPrice = g_FrameVar[2] * nNum
--	local totalNeedMoney = needMoney * nNum
	WuhunQuest_InfoWindow:SetText( "#{YBSC_XML_65}"..itemName.."#{YBSC_XML_66}"..tostring(g_FrameVar[2]).."#{YBSC_XML_67}".."#{_EXCHG"..tostring(needMoney).."}".."#{YBSC_XML_68}");	-- 设置内容
	g_FrameInfo = FrameInfoList.YBMARKET_UP_ITEM_COMFIRM ;
	WuhunQuest_Button1:Show()
	WuhunQuest_Button1:SetText("#{INTERFACE_XML_557}");  --确定
	WuhunQuest_Button2:Show()
	WuhunQuest_Button2:SetText("#{INTERFACE_XML_542}");  --取消
	WuhunQuestUpdateRect();
	DataPool:SetCanUseHotKey(0)
	this:Show();
end
-- event == "YBMARKET_UP_PET_COMFIRM"
function WuhunQuest_Open_Window_YBM_UpPet(nIndex , nPrice)
	WuhunQuest_Clear_Var()
	g_FrameVar[1] = tonumber(nIndex)
	g_FrameVar[2] = tonumber(nPrice)
	local petName,szOn = Pet:GetPetList_Appoint(g_FrameVar[1]);
	local needMoney = Auction:GetNeedMoneyForSell(g_FrameVar[2])
	WuhunQuest_InfoWindow:SetText( "#{YBSC_XML_69}"..petName.."#{YBSC_XML_70}"..g_FrameVar[2].."#{YBSC_XML_71}".."#{_EXCHG"..tostring(needMoney).."}".."#{YBSC_XML_72}");	-- 设置内容
	g_FrameInfo = FrameInfoList.YBMARKET_UP_PET_COMFIRM ;
	WuhunQuest_Button1:Show()
	WuhunQuest_Button1:SetText("#{INTERFACE_XML_557}");  --确定
	WuhunQuest_Button2:Show()
	WuhunQuest_Button2:SetText("#{INTERFACE_XML_542}");  --取消
	WuhunQuestUpdateRect();
	DataPool:SetCanUseHotKey(0)
	this:Show();
end
-- event == "YBMARKET_BUY_COMFIRM"
function WuhunQuest_Open_Window_YBM_Buy(nType ,nIndex ,nPrice)
	g_FrameVar[1] = tonumber(nType)
	g_FrameVar[2] = tonumber(nIndex)
	g_FrameVar[3] = tonumber(nPrice)
	local unitName = ""
	if g_FrameVar[1] == 2 then
		local pName , pSeller ,pCount ,pYB = Auction:GetItemAuctionInfo( g_FrameVar[2] )
		unitName =  pName
		WuhunQuest_InfoWindow:SetText( "#{YBSC_XML_73}"..tostring(pYB).."#{YBSC_XML_74}"..tostring(pCount).."#{YBSC_XML_79}"..unitName.."#{YBSC_XML_75}");	-- 设置内容
	elseif g_FrameVar[1] == 1 then
		local pName , pSeller ,pYB = Auction:GetPetAuctionInfo( g_FrameVar[2] )
		unitName = pName
		WuhunQuest_InfoWindow:SetText( "#{YBSC_XML_73}"..g_FrameVar[3].."#{YBSC_XML_74}"..unitName.."#{YBSC_XML_75}");	-- 设置内容
	end
	g_FrameInfo = FrameInfoList.YBMARKET_BUY_COMFIRM  ;
	WuhunQuest_Button1:Show()
	WuhunQuest_Button1:SetText("#{INTERFACE_XML_557}");  --确定
	WuhunQuest_Button2:Show()
	WuhunQuest_Button2:SetText("#{INTERFACE_XML_542}");  --取消
	WuhunQuestUpdateRect();
	DataPool:SetCanUseHotKey(0)
	this:Show();
end
-- event == "YBMARKET_TAKE_BACK_COMFIRM"
function WuhunQuest_Open_Window_YBM_TakeBack(nType , nIndex)
	g_FrameVar[1] = tonumber(nType)
	g_FrameVar[2] = tonumber(nIndex)
	local pName = Auction:GetMySellBoxItemName(g_FrameVar[1] , g_FrameVar[2])
	WuhunQuest_InfoWindow:SetText( "#{YBSC_XML_76}"..pName.."#{YBSC_XML_77}");	-- 设置内容
	g_FrameInfo = FrameInfoList.YBMARKET_TAKE_BACK_COMFIRM
	WuhunQuest_Button1:Show()
	WuhunQuest_Button1:SetText("#{INTERFACE_XML_557}");  --确定
	WuhunQuest_Button2:Show()
	WuhunQuest_Button2:SetText("#{INTERFACE_XML_542}");  --取消
	WuhunQuestUpdateRect();
	DataPool:SetCanUseHotKey(0)
	this:Show();
end

function WuhunQuest_Open_Window_SellItemConfirm(nItemPos)
	g_FrameVar[1] = tonumber(nItemPos)
	WuhunQuest_InfoWindow:SetText("#{ZBBH_100505_1}");	-- 设置内容
	g_FrameInfo = FrameInfoList.SELL_ITEM_CONFIRM;
	WuhunQuest_Button1:Show()
	WuhunQuest_Button1:SetText("#{INTERFACE_XML_557}");  --确定
	WuhunQuest_Button2:Show()
	WuhunQuest_Button2:SetText("#{INTERFACE_XML_542}");  --取消
	WuhunQuestUpdateRect();
	DataPool:SetCanUseHotKey(0)
	this:Show();
end
-- event == "PET_EQUIP_SUITUP_CONFIRM"
function WuhunQuest_Open_Window_PetEquipSuitUp(nType, nEquipPos, nItemNum, nPercent, nObjCareId)
	g_FrameVar[1] = nType
	g_FrameVar[2] = nEquipPos
	g_FrameVar[3] = nItemNum
	g_FrameVar[4] = nPercent
	g_FrameVar[5] = nObjCareId
	--需要换字典号（暂时使用自己配置的）
	if (nPercent == 100) then
		WuhunQuest_InfoWindow:SetText("#{ZSZB_SJ_01}" ..nItemNum .."#{ZSZB_SJ_02}"..nPercent.."%#{ZSZB_SJ_03}#G")
	else
		WuhunQuest_InfoWindow:SetText("#{ZSZB_SJ_01}" ..nItemNum .."#{ZSZB_SJ_02}#cff0000"..nPercent.."%#{ZSZB_SJ_03}#G")
	end

	g_FrameInfo = FrameInfoList.PET_EQUIP_SUITUP_CONFIRM
	WuhunQuest_Button1:Show()
	WuhunQuest_Button1:SetText("#{INTERFACE_XML_557}");  --确定
	WuhunQuest_Button2:Show()
	WuhunQuest_Button2:SetText("#{INTERFACE_XML_542}");  --取消
	WuhunQuestUpdateRect();
	DataPool:SetCanUseHotKey(0)
	this:Show();
end

-- event == "PET_EQUIP_SUITUP_CONFIRM"
function WuhunQuest_Window_PetEquipSuitUp_Confirm()
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("OnPetEquipSuitUp")
		Set_XSCRIPT_ScriptID(800109)
		Set_XSCRIPT_Parameter(0,tonumber(g_FrameVar[2]))
		Set_XSCRIPT_Parameter(1,tonumber(g_FrameVar[5]))
		Set_XSCRIPT_Parameter(2,tonumber(g_FrameVar[3]))
		Set_XSCRIPT_ParamCount(3)
	Send_XSCRIPT();
	Player:CommonClientMessage(20100524,0,0,0,0,0)
end
