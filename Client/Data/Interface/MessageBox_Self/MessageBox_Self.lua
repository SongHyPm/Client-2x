g_InitiativeClose = 0;
local g_currentList = 0;
local g_currentIndex = 0;
-- 摆摊地租提示窗口，在这里有发送给服务器的确定开始摆摊的消息
local Recycle_Type = -1;
local Recycle_CurSelectItem = -1
local g_FrameInfo = -1;
local FrameInfoList = {
	STALL_RENT_FRAME			= 1,
	DISCARD_ITEM_FRAME			= 2,
	CANNT_DISCARD_ITEM			= 3,
	TEAM_ASKJOIN				= 4,	--有人邀请你加入队伍
    TEAM_MEMBERINVERT			= 5,	--队员邀请某人加入队伍请求你同意
    TEAM_SOMEASK				= 6,	--某人申请加入队伍
    TEAM_FOLLOW		 			= 7,	--进入组队跟随模式
    FRAME_AFFIRM_SHOW 			= 8,	--进入放弃任务确认模式
    GUILD_CREATE_CONFIRM		= 9, 	--帮会创建确认模式
    SYSTEM_TIP_INFO 			= 10,	--系统提示对话框模式
    GUILD_QUIT_CONFIRM 			= 11,	--帮会退出确认模式
    GUILD_DESTORY_CONFIRM		= 12,	--帮会删除确认模式
    CALL_OF						= 13,	--拉人
    NET_CLOSE_MESSAGE			= 14,	--断开网络
    PET_FREE_CONFIRM			= 15,	--珍兽放生确认
    CITY_CONFIRM				= 16,	--城市相关确认
    SAVE_STALL_INFO				= 17,	--保存摆摊信息
    PET_SYNC_CONFIRM			= 18,	--珍兽繁殖确认
    QUIT_GAME					= 19,	--退出游戏的确认
    EQUIP_ITEM					= 20,	--装备物品
    YUANBAO_BUY_ITEM		= 21, --元宝商店购买物品确认
    CONFIRM_REMOVE_STALL	= 22,--确认撤滩 add by zchw
    PET_PROCREATE_PROMPT			= 23, -- 珍兽繁殖提示 zchw

	--这个24一定不能改，改了出错的！！！！！Chris
	SERVER_CONTROL				= 24,	--Server控制弹出的提示框
	DELETE_FRIEND_MESSAGE		= 25,	--确定删除好友的提示框

    GEM_COMBINED_CONFIRM		= 88,	-- 确认宝石合成
   	ENCHASE_CONFIRM					= 99,	-- 确认镶嵌
   	ENCHASE_FOUR_CONFIRM		= 100,	-- add:lby20080527确认4镶嵌  
   	 	
   	--CARVE_CONFIRM				= 102,	-- 确认雕琢



    PS_RENAME_MESSAGE			= 116,	--更改玩家商店店名
    PS_READ_MESSAGE				= 117,	--更改玩家商店介绍（广告）
    PS_ADD_BASE_MONEY			= 118,	--充入本金
    PS_ADD_GAIN_MONEY			= 119,	--充入盈利金
    PS_DEC_GAIN_MONEY			= 120,	--取出盈利金
    PS_ADD_STALL				= 121,	--增加柜台
    PS_DEL_STALL				= 122,	--减少柜台
    PS_INFO_PANCHU				= 123,	--商店盘出
    PS_INFO_PANRU				= 124,	--商店盘入
    PS_INFO_MODIFY_TYPE			= 125,	--更改商店类型
    FREEFORALL					= 201,	--FREEFORALL: 个人混战
    FREEFORTEAM					= 202,	--FREEFORTEAM： 组队混战
    FREEFORGUILD				= 203,	-- FREEFORGUILD：帮派混战
    MAKESUREPVPCHALLENGE		= 204,
    EXCHANGE_MONEY_OVERFLOW			= 205, --交易后增加玩家是否到达钱上限的判定

    GUILD_DEMIS_CONFIRM		= 206, 			--禅让确认

    CHANGEPROTECTTIME		= 207, 				--安全时间
    COMMISION_BUY = 208, 							--寄售商店购买确认

    Player_Give_Rose		= 209,
    RECYCLE_DEL_ITEM		=210, 				--取消收购确认

    OPEN_IS_SELL_TO_RECSHOP	= 211, 		--出售物品确认

    CONFIRM_STENGTH = 212,

    CHAR_RANAME_CONFIRM = 213,

    CITY_RANAME_CONFIRM = 214,

    CONFIRM_RE_IDENTIFY = 215,

    KICK_MEMBER_MSGBOX = 216,
    
		SAFEBOX_LOCK_CONFIRM = 217,						--保险箱锁定确认框
		SAFEBOX_UNLOCK_CONFIRM = 218,					--保险箱解锁确认框
		
		LOCK_ITEM_CONFIRM_FRAME = 219,        --	加锁确认
    GUILD_LEAGUE_QUIT_CONFIRM = 220,			--	退出帮会同盟确认
    GUILD_LEAGUE_CREATE_CONFIRM = 221,		--	创建帮会同盟确认
		PET_SKILL_STUDY_CONFIRM = 222,				--	宠物学习技能确认
		EXCHANGE_BANGGONG = 223,							--	兑换帮贡牌确认
		PUT_GUILDMONEY = 224,									--	帮会资金捐助
		TLZ_CONFIRM_SETPOS = 225,							--	确认土灵珠重新定位

		DISMISS_TEAM = 226,										--	解散队伍						WTT		20090212
};

local PVPFLAG = { FREEFORALL = 201, FREEFORTEAM = 202, FREEFORGUILD = 203, MAKESUREPVPCHALLENGE = 204, ACCEPTDUEL = 205, DuelGUID = 0, DuelName = "" }
--FREEFORALL: 个人混战 FREEFORTEAM： 组队混战 FREEFORGUILD：帮派混战

--
local g_szData;
local g_nData;
local g_nData1
--

local Quest_Number;
local Pet_Number;
local Server_Script_Function = "";
local Server_Script_ID = "";
local Server_Return_1 = 0;
local Server_Return_2 = 0;
local Server_Return_3 = 0;

local g_CityData = {};						--由于upvalue的限制，城市和珍兽合成共用这个数据区

local strMessageString = "";		--对话框字符
local strMessageData   = 0;			--对话框类型，用于提示什么得对话框
local strMessageArgs = 0;				--按钮参数
local strMessageType = "Normal";--按钮风格
local strMessageArgs_2 = 0			--按钮参数2

local GemCombinedData = {}

local EnchaseData = {}

local SplitData = {}

local CarveData = {}

local CommisionBuyData = {}  --寄售商店购买确认框的数据

local MAX_OBJ_DISTANCE = 3.0;

local Client_ItemIndex = -1

function CancelLastOp(str)
	if(this:IsVisible() and str ~= g_FrameInfo) then
		MessageBox_Self_Cancel_Clicked(0);
	end
end
--===============================================
-- OnLoad()
--===============================================
function MessageBox_Self_PreLoad()
	--this:RegisterEvent("MSGBOX_ACCEPTDUEL");
	this:RegisterEvent("MSGBOX_MAKESUREPVPCHALLENGE");
    this:RegisterEvent("MENU_SHOWACCEPTCHANGEPVP");
	this:RegisterEvent("OPEN_STALL_RENT_FRAME");
	this:RegisterEvent("OPEN_DISCARD_ITEM_FRAME");
	this:RegisterEvent("OPEN_CANNT_DISCARD_ITEM");
	this:RegisterEvent("AFFIRM_SHOW");
	this:RegisterEvent("NET_CLOSE");
	this:RegisterEvent("DELETE_FRIEND");
	this:RegisterEvent("TIME_UPDATE");
	this:RegisterEvent("PET_PROCREATE_PROMPT"); -- zchw pet procreate

	-- zchw fix Transfer bug
	this:RegisterEvent("OBJECT_CARED_EVENT");
	---- 有人邀请你加入队伍
	--this:RegisterEvent("SHOW_TEAM_YES_NO");
	---- 队员邀请某人加入队伍请你同意.
	--this:RegisterEvent("TEAM_MEMBER_INVITE");
	---- 某人申请加入队伍.
	--this:RegisterEvent("TEAM_APPLY");
	---- 队长邀请进入组队跟随模式
	--this:RegisterEvent("TEAM_FOLLOW_INVITE");

	-- 创建帮会确认
	this:RegisterEvent("GUILD_CREATE_CONFIRM");
	-- 删除帮会确认
	this:RegisterEvent("GUILD_DESTORY_CONFIRM");
	-- 退出帮会确认
	this:RegisterEvent("GUILD_QUIT_CONFIRM");
	this:RegisterEvent("GUILD_LEAGUE_QUIT_CONFIRM");
	this:RegisterEvent("GUILD_LEAGUE_CREATE_CONFIRM");

	this:RegisterEvent("PET_FREE_CONFIRM");

	this:RegisterEvent("OPEN_PS_MESSAGE_FRAME");

	this:RegisterEvent("UI_COMMAND");
	this:RegisterEvent("CITY_CONFIRM");
	--add by zchw
	this:RegisterEvent("OPEN_REMOVE_STALL");
	this:RegisterEvent("OPEN_SAVE_STALL_INFO");

	this:RegisterEvent("PET_SYNC_CONFIRM");
	this:RegisterEvent("QUEST_QUIT_GAME");

	this:RegisterEvent( "MESSAGE_BOX" );

	this:RegisterEvent( "GEM_COMBINED_CONFIRM" );
	this:RegisterEvent( "ENCHASE_CONFIRM" );  
	this:RegisterEvent( "ENCHASE_FOUR_CONFIRM" );-- add:lby20080527确认4镶嵌
	
	--this:RegisterEvent( "CARVE_CONFIRM" );
	this:RegisterEvent( "EXCHANGE_MONEY_OVERFLOW" );
	this:RegisterEvent( "GUILD_DEMIS_CONFIRM" );
	this:RegisterEvent("YUANBAO_BUY_ITEM_CONFIRM");

	this:RegisterEvent("CHANGEPROTECTTIME");
	
	this:RegisterEvent("CONFIRM_COMMISION_BUY"); --寄售商店购买确认

	this:RegisterEvent("PLAYER_GIVE_ROSE");

	this:RegisterEvent( "RECYCLE_DEL_ITEM" );

	this:RegisterEvent( "OPEN_IS_SELL_TO_RECSHOP" );

	this:RegisterEvent( "CLOSE_PS_CHANGETYPE_MSG" );

	this:RegisterEvent( "CONFIRM_STENGTH" );

	this:RegisterEvent( "EXCHANGE_BANGGONG" );
		
	this:RegisterEvent( "PUT_GUILDMONEY" );

	this:RegisterEvent( "CLOSE_STRENGTH_MSGBOX" );

	this:RegisterEvent( "CLOSE_RECYCLESHOP_MSG" );

	this:RegisterEvent( "ENCHASE_CLOSE_MSGBOX" );
	
	this:RegisterEvent( "CITY_RANAME_CONFIRM" );

	this:RegisterEvent( "CHAR_RANAME_CONFIRM" );	

	--当logon打开的时候，关闭所有MessageBox
	this:RegisterEvent( "GAMELOGIN_OPEN_COUNT_INPUT" );

	this:RegisterEvent( "CONFIRM_RE_IDENTIFY" );

	this:RegisterEvent( "CLOSE_RE_IDENTIFY_MSGBOX" );
	
	this:RegisterEvent( "KICK_MEMBER_MSGBOX" );
	
	this:RegisterEvent( "CLOSE_KICK_MEMBER_MSGBOX" );
	
	--保险箱锁定确认框
	this:RegisterEvent( "SAFEBOX_LOCK_CONFIRM" );

	--保险箱解锁确认框
	this:RegisterEvent( "SAFEBOX_UNLOCK_CONFIRM" );
	
	this:RegisterEvent( "CLOSE_SAFEBOX_CONFIRM" );
	
	--加锁确认
	this:RegisterEvent( "LOCK_ITEM_CONFIRM" );
	this:RegisterEvent( "OPEN_PETSKILLSTUDY_MSGBOX" );
	this:RegisterEvent( "CLOSE_PETSKILLSTUDY_MSGBOX" );
	--土灵珠定位确认
	this:RegisterEvent( "CONFIRM_SETPOS_TLZ" );
	
	-- 弹出解散队伍的二次确认窗口			add by WTT	20090212
	this:RegisterEvent( "OPNE_DISMISS_TEAM_MSGBOX" );

end

--===============================================
-- OnLoad()
--===============================================
function MessageBox_Self_OnLoad()

end

function  MessageBox_Self_UpdateRect()

	local nWidth, nHeight = MessageBox_Self_Text:GetWindowSize();
	local nTitleHeight = 36;
	local nBottomHeight = 75;
	nWindowHeight = nTitleHeight + nBottomHeight + nHeight;
	MessageBox_Self_Frame:SetProperty( "AbsoluteHeight", tostring( nWindowHeight ) );
end
--===============================================
-- OnEvent()
--===============================================
function MessageBox_Self_OnEventEx(event)

	local objCaredID = -1; -- zchw fix Transfer bug
	if(event == "QUEST_QUIT_GAME") then
		this:Show();
		g_FrameInfo = FrameInfoList.QUIT_GAME;
	-- add by zchw
	elseif event == "OPEN_REMOVE_STALL" then
		CancelLastOp(FrameInfoList.CONFIRM_REMOVE_STALL);
		g_FrameInfo = FrameInfoList.CONFIRM_REMOVE_STALL;
	-- zchw for pet procreate
	elseif event == "PET_PROCREATE_PROMPT" then
		CancelLastOp(FrameInfoList.PET_PROCREATE_PROMPT);
		g_FrameInfo = FrameInfoList.PET_PROCREATE_PROMPT;
	elseif event == "OPEN_SAVE_STALL_INFO"    then
		CancelLastOp(FrameInfoList.SAVE_STALL_INFO);
		g_FrameInfo = FrameInfoList.SAVE_STALL_INFO;
	elseif event == "YUANBAO_BUY_ITEM_CONFIRM" then
		if(arg0 == "close") then
			if(g_FrameInfo == FrameInfoList.YUANBAO_BUY_ITEM and this:IsVisible())then
			--如果是关于购物弹出的窗口，才关闭
				g_CityData = {};
				this:Hide();
			end
			return -1;
		elseif(arg0 == "open") then
			g_CityData = {};
			g_CityData[1] = tonumber(arg2);	--在货架的位置
			g_CityData[2] = tonumber(arg3);	--在商店的售价
			g_CityData[3] = arg1;	--货物名称
			CancelLastOp(FrameInfoList.YUANBAO_BUY_ITEM);
			g_FrameInfo = FrameInfoList.YUANBAO_BUY_ITEM;
		end
	elseif( event == "PET_SYNC_CONFIRM" ) then
		g_CityData[1] = tonumber(arg0);
		g_CityData[2] = tonumber(arg1);
		CancelLastOp(FrameInfoList.PET_SYNC_CONFIRM);
		g_FrameInfo = FrameInfoList.PET_SYNC_CONFIRM;
	--寄售商店购买确认消息
	elseif event == "CONFIRM_COMMISION_BUY" then
		if(arg0 == "close") then
			if(g_FrameInfo == FrameInfoList.COMMISION_BUY and this:IsVisible())then
			--如果是寄售商店确认框，才关闭
				CommisionBuyData = {};
				this:Hide();
			end
			return -1;
		elseif(arg0 == "open") then
			CommisionBuyData = {};
			CommisionBuyData[1] = arg1;	--物品名称
			CommisionBuyData[2] = arg2;	--价格
			CancelLastOp(FrameInfoList.COMMISION_BUY);
			g_FrameInfo = FrameInfoList.COMMISION_BUY;
		end
	elseif event == "TIME_UPDATE" then
		if(this:IsVisible() and g_FrameInfo == FrameInfoList.STALL_RENT_FRAME ) then
			local xNow, yNow;
			xNow, yNow = Player:GetPos();
			
			local askPosX = Variable:GetVariable("AskBaiTanPosX");
			local askPosY = Variable:GetVariable("AskBaiTanPosY");
			
			if(tostring(xNow) ~= askPosX or tostring(yNow) ~= askPosY) then
				MessageBox_Self_Cancel_Clicked(1);
			end
		end

		return -1;
	end
	if g_FrameInfo == FrameInfoList.QUIT_GAME   then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0");
		local msg = "C醕 h� quy猼 r秈 b� th� gi緄 Thi阯 Long B醫 B�?";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	end

	if ( event == "RECYCLE_DEL_ITEM" ) then
		Recycle_Type = tonumber(arg0);
		Recycle_CurSelectItem = tonumber(arg1);
		CancelLastOp(FrameInfoList.RECYCLE_DEL_ITEM);
		g_FrameInfo = FrameInfoList.RECYCLE_DEL_ITEM;
		MessageBox_Self_DragTitle:SetText("#gFF0FA0");
		local msg = "C醕 h� c� mu痭 x醕 nh h鼀 b� l thu mua n鄖 kh鬾g?";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	end

	if ( event == "OPEN_IS_SELL_TO_RECSHOP" ) then
		Recycle_Bag_idx = tonumber(arg0);
		Recycle_Shop_idx = tonumber(arg1);
		Recycle_Shop_Num =  tonumber(arg2);
		Recycle_Shop_AllPrice =  tonumber(arg3);
		CancelLastOp(FrameInfoList.OPEN_IS_SELL_TO_RECSHOP);
		g_FrameInfo = FrameInfoList.OPEN_IS_SELL_TO_RECSHOP;
		local name = PlayerShop:GetRecycleItem(Recycle_Shop_idx,3,"name");
		MessageBox_Self_DragTitle:SetText("#gFF0FA0");
		local msg = "#W Nguy阯 li畊 m� c醕 h� c b醤 l� #G"..name.."#W, S� l唼ng l�"..Recycle_Shop_Num.."#W, S� ti玭 v鄋g nh 疬㧟 l� #Y#{_MONEY"..Recycle_Shop_AllPrice.."}";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	end
	if ( event == "CONFIRM_STENGTH" ) then
		Stength_Equip_Idx = tonumber(arg0);
		Stength_Item_Idx = tonumber(arg1);
		CancelLastOp(FrameInfoList.CONFIRM_STENGTH);
		g_FrameInfo = FrameInfoList.CONFIRM_STENGTH;
		MessageBox_Self_DragTitle:SetText("#gFF0FA0");
		local msg = "Sau khi c叨ng h骯 s� l t裞 kh tr� 餴 v ph trong t鋣 n鋓 C叨ng h骯 tinh hoa kh骯 鸶nh, Trang b� sau khi C叨ng h骯 c鹡g s� kh骯 鸶nh c鵱g v緄 nh鈔 v, c� mu痭 x醕 nh c叨ng h骯 kh鬾g? #r g㱮 �: N猽 nh� kh鬾g mu痭 sau khi c叨ng h骯 trang b� b� kh骯 鸶nh, xin h銀 c C叨ng h骯 tinh hoa kh骯 鸶nh 痼 v鄌 Th呓ng ph� r癷 h銀 皙n 疴y c叨ng h骯.";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	end
	
	if ( event == "EXCHANGE_BANGGONG" ) then
		BangGong_Value = tonumber(arg0);
		ObjCaredID = tonumber(arg1); --这里不需要在使用GetNPCIDByServerID了
		if ObjCaredID ~= -1 then
			--开始关心NPC
			this:CareObject(ObjCaredID, 1, "MsgBox");
		end
		local extravalue = math.floor(BangGong_Value*0.1)
		CancelLastOp(FrameInfoList.EXCHANGE_BANGGONG);
		g_FrameInfo = FrameInfoList.EXCHANGE_BANGGONG;
		MessageBox_Self_DragTitle:SetText("#gFF0FA0");
		local msg = "#{BGCH_8922_28}"..BangGong_Value.."#{BGCH_8922_29}"..extravalue.."#{BGCH_8922_30}";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	end
	
	if ( event == "PUT_GUILDMONEY" ) then
		GuildMoney_Value = tonumber(arg0);
		ObjCaredID = tonumber(arg1); --这里不需要在使用GetNPCIDByServerID了
		if ObjCaredID ~= -1 then
		--开始关心NPC
			this:CareObject(ObjCaredID, 1, "MsgBox");
		end
		local value = math.floor(GuildMoney_Value*0.9)
		CancelLastOp(FrameInfoList.PUT_GUILDMONEY);
		g_FrameInfo = FrameInfoList.PUT_GUILDMONEY;
		MessageBox_Self_DragTitle:SetText("#gFF0FA0");
		local msg = "#{BPZJ_0801014_008}#{_EXCHG"..GuildMoney_Value.."}#{BPZJ_0801014_009}#{_EXCHG"..value.."}#{BPZJ_0801014_013}";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	end

	if ( event == "CONFIRM_RE_IDENTIFY" ) then
		RID_Equip_Idx = tonumber(arg0);
		--Stength_Item_Idx = tonumber(arg1);
		CancelLastOp(FrameInfoList.CONFIRM_RE_IDENTIFY);
		g_FrameInfo = FrameInfoList.CONFIRM_RE_IDENTIFY;
		MessageBox_Self_DragTitle:SetText("#gFF0FA0");
		local msg = "Khi gi醡 鸶nh l読 t� ch c黙 trang b� th� s� 遳 ti阯 kh tr� ra Kim Cang Sa ho Kim Cang To� 疸 c� 鸶nh, gi醡 鸶nh l読 xong t� ch trang b� th� trang b� s� c� 鸶nh, x醕 nh ti猵 t鴆 kh鋗 鸶nh kh鬾g ?  #r#GNh nh�: N猽 nh� kh鬾g mu痭 c� 鸶nh trang b� sau khi kh鋗 鸶nh, mong bg h鎢 h銀 b� Kim Cang Sa ho Kim Cang T鯽  疸 c� 鸶nh v鄌 Th呓ng Kh� r癷 h銀 quay l読 kh鋗 鸶nh.#W";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	end

	if ( event == "KICK_MEMBER_MSGBOX" ) then
		Member_Idx = tonumber(arg0);
		Member_Name = arg1;
		CancelLastOp(FrameInfoList.KICK_MEMBER_MSGBOX);
		g_FrameInfo = FrameInfoList.KICK_MEMBER_MSGBOX;
		MessageBox_Self_DragTitle:SetText("#gFF0FA0");
		local msg = "C醕 h� c� 鸢ng � l鄊 cho ng叨i ch絠 #G"..Member_Name.."#W B鋓 tr� xu bang h礽 kh鬾g?";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	end

	
	return 1;
end

--===============================================
-- OnEvent()
--===============================================
function MessageBox_Self_OnEvent(event)
	if event == "GEM_COMBINED_CONFIRM" then
		
		GemCombinedData[1] = tonumber( arg0 )
		GemCombinedData[2] = tonumber( arg1 )
		GemCombinedData[3] = tonumber( arg2 )
		GemCombinedData[4] = tonumber( arg3 )
		GemCombinedData[5] = tonumber( arg4 )
		GemCombinedData[6] = tonumber( arg5 )
		GemCombinedData[7] = arg6
		CancelLastOp(FrameInfoList.GEM_COMBINED_CONFIRM);
		g_FrameInfo = FrameInfoList.GEM_COMBINED_CONFIRM
		MessageBox_Self_UpdateFrame()
		return
	end

	if event == "EXCHANGE_MONEY_OVERFLOW" then
		MessageBox_Self_Text:SetText( "#YNg鈔 l唼ng c黙 c醕 h� 疸 qu� m裞 gi緄 h課, h銀 ti陁 b総 餴. L遳 �: kh鬾g 疬㧟 #Rtho醫 kh鰅 tr� ch絠 ho d竎h 鸨i 鸶a danh#Y, n猽 kh鬾g c醕 h� s� b� m 餴 s� ti玭 v唼t gi緄 h課 痼" );
		
		MessageBox_Self_UpdateRect();
		CancelLastOp(FrameInfoList.EXCHANGE_MONEY_OVERFLOW);
		g_FrameInfo = FrameInfoList.EXCHANGE_MONEY_OVERFLOW
		
		this:Show();
	end
	if event == "GUILD_DEMIS_CONFIRM" then
		local TargetName = tostring( arg0 );
		MessageBox_Self_Text:SetText( "C醕 h� c� quy猼 鸶nh nh叨ng ng鬷 Bang ch� cho "..TargetName.." kh鬾g? Sau khi nh叨ng ng鬷 th� ch裞 v� c黙 c醕 h� l� ph� bang ch�!" );		
		MessageBox_Self_UpdateRect();	
		CancelLastOp(FrameInfoList.GUILD_DEMIS_CONFIRM);
		g_FrameInfo = FrameInfoList.GUILD_DEMIS_CONFIRM
		this:Show();
	end

	if event == "ENCHASE_CONFIRM" then
		MessageBox_Self_Text:SetText( "Kh鬾g c� nguy阯 li畊 穑c th� s� khi猲 vi甤 kh鋗 n誱 c� th� th b読 v� b鋙 th誧h s� m. C醕 h� x醕 鸶nh mu痭 ti猵 t鴆 kh鋗 n誱 ?" );
		EnchaseData[1] = tonumber( arg0 )
		EnchaseData[2] = tonumber( arg1 )
		EnchaseData[3] = tonumber( arg2 )
		EnchaseData[4] = tonumber( arg3 )
		CancelLastOp(FrameInfoList.ENCHASE_CONFIRM);
		g_FrameInfo = FrameInfoList.ENCHASE_CONFIRM
		this:Show();
	end
	
	if event == "ENCHASE_FOUR_CONFIRM" then  -- add:lby20080527确认4镶嵌
		MessageBox_Self_Text:SetText( "Kh鬾g c� nguy阯 li畊 穑c th� s� khi猲 vi甤 kh鋗 n誱 c� th� th b読 v� b鋙 th誧h s� m. C醕 h� x醕 鸶nh mu痭 ti猵 t鴆 kh鋗 n誱 ?" );
		EnchaseData[1] = tonumber( arg0 )
		EnchaseData[2] = tonumber( arg1 )
		EnchaseData[3] = tonumber( arg2 )
		EnchaseData[4] = tonumber( arg3 )
		CancelLastOp(FrameInfoList.ENCHASE_FOUR_CONFIRM);
		g_FrameInfo = FrameInfoList.ENCHASE_FOUR_CONFIRM
		this:Show();
	end

	-- 打开珍兽技能学习的二次确认界面
	if event == "OPEN_PETSKILLSTUDY_MSGBOX" then
		MessageBox_Self_Text:SetText( "Tr鈔 th� c黙 c醕 h� s 疬㧟 2 k� n錸g Th� 械ng, ti陁 hao #{_EXCHG990000}, c醕 h� 鸢ng � kh鬾g?" );
		CancelLastOp(FrameInfoList.PET_SKILL_STUDY_CONFIRM);
		g_FrameInfo = FrameInfoList.PET_SKILL_STUDY_CONFIRM
		this:Show();
	end
	
	-- 关闭珍兽技能学习的二次确认界面
	if(event == "CLOSE_PETSKILLSTUDY_MSGBOX" ) then
		if(this:IsVisible() and  g_FrameInfo == FrameInfoList.PET_SKILL_STUDY_CONFIRM) then
			CancelLastOp(-1);
			this:Hide();
		end
		return;
	end
	
--	if event == "CARVE_CONFIRM" then
--		MessageBox_Self_Text:SetText( "注意！#您要雕琢的宝石或雕琢符为已绑定物品，雕琢后的宝石也将与您绑定，确认要继续雕琢的话请再次点击雕琢按钮。" );
--		CarveData[1] = tostring( arg0 )
--		CarveData[2] = tonumber( arg1 )
--		CarveData[3] = tonumber( arg2 )
--		CarveData[4] = tonumber( arg3 )
--		CarveData[5] = tonumber( arg4 )
--		CancelLastOp(FrameInfoList.CARVE_CONFIRM);
--		g_FrameInfo = FrameInfoList.CARVE_CONFIRM
--		this:Show();
--	end
	
	if(event == "OPEN_STALL_RENT_FRAME") then
		CancelLastOp(FrameInfoList.STALL_RENT_FRAME);
		--记录当前位置
		local xPos, yPos;
		xPos, yPos = Player:GetPos();
		Variable:SetVariable("AskBaiTanPosX", tostring(xPos), 1);
		Variable:SetVariable("AskBaiTanPosY", tostring(yPos), 1);
		
		this:Show();
		g_InitiativeClose = 0;
		g_FrameInfo = FrameInfoList.STALL_RENT_FRAME;
		

	elseif ( event == "MSGBOX_MAKESUREPVPCHALLENGE" ) then
	    local TargetName = tostring( arg0 )
	    --AxTrace(0,0,"MSGBOX_MAKESUREPVPCHALLENGE");
		CancelLastOp(FrameInfoList.MAKESUREPVPCHALLENGE);
		g_FrameInfo = FrameInfoList.MAKESUREPVPCHALLENGE;
	    MessageBox_Self_Text:SetText( "C醕 h� x醕 鸶nh c鵱g"..TargetName.."tuy阯 chi猲 kh鬾g? Sau khi gi猼 ch猼 鸠i ph呓ng s� t錸g 餴琺 s醫 kh�? S醫 kh� cao th� l鷆 nh鈔 v ch猼 s� t眓 th r l緉." );
		MessageBox_Self_UpdateRect();
		this:Show();

	elseif ( event == "MENU_SHOWACCEPTCHANGEPVP" ) then
		local Mode = tonumber( arg0 )
		local ModeText = ""
		if( 1 == Mode ) then
			CancelLastOp(FrameInfoList.FREEFORALL);
		    --AxTrace(0,0,FrameInfoList.FREEFORALL);
		    g_FrameInfo = FrameInfoList.FREEFORALL;
		    ModeText = "H靚h th裞 n鄖 c� th� c鬾g k韈h t c� ng叨i ch絠 tr� b鋘 th鈔, m秈 x醕 nh"
		end
		if( 2 == Mode ) then
			CancelLastOp(FrameInfoList.FREEFORTEAM);
		    --AxTrace(0,0,FrameInfoList.FREEFORTEAM);
		    g_FrameInfo = FrameInfoList.FREEFORTEAM;
		    ModeText = "H靚h th裞 n鄖 c� th� c鬾g k韈h t c� ng叨i ch絠 tr� ng叨i trong t� 鸬i, m秈 x醕 nh"
		end
		if( 3 == Mode ) then
			CancelLastOp(FrameInfoList.FREEFORGUILD)
		    --AxTrace(0,0,FrameInfoList.FREEFORGUILD);
		    g_FrameInfo = FrameInfoList.FREEFORGUILD;
		    ModeText = "#{TM_20080311_18}"
		end
		if( Mode >= 1 and Mode <= 3 ) then
		    MessageBox_Self_Text:SetText( ModeText );
			MessageBox_Self_UpdateRect();
		    this:Show();
		end

	elseif ( event == "MSGBOX_ACCEPTDUEL" ) then
	    local Name = tostring( arg0 )
	    local GUID = tostring( arg1 )
	    PVPFLAG.DuelName = Name
	    PVPFLAG.DuelGUID = GUID
	    g_FrameInfo = PVPFLAG.ACCEPTDUEL;
	    local MsgText = Name.."th醕h 黏u v緄 b課, c醕 h� c� 鸢ng � kh鬾g? Ch� �: trong tr 黏u n猽 t� vong s� b� tr譶g ph誸."
	    MessageBox_Self_Text:SetText( MsgText )
		MessageBox_Self_UpdateRect();
	    this:Show();

	elseif(event == "OPEN_DISCARD_ITEM_FRAME") then
		argDISCARD_ITEM_FRAME0 = arg0;
		CancelLastOp(FrameInfoList.DISCARD_ITEM_FRAME);
		this:Show();
		g_InitiativeClose = 0;
		g_FrameInfo = FrameInfoList.DISCARD_ITEM_FRAME;

	elseif(event == "OPEN_CANNT_DISCARD_ITEM") then
		argCANNT_DISCARD_ITEM0 = arg0
		CancelLastOp(FrameInfoList.CANNT_DISCARD_ITEM);
		this:Show();
		g_InitiativeClose = 0;
		g_FrameInfo = FrameInfoList.CANNT_DISCARD_ITEM;
		
	elseif(event == "LOCK_ITEM_CONFIRM") then
		argLOCK_ITEM_FRAME0 = arg0;
		CancelLastOp(FrameInfoList.LOCK_ITEM_CONFIRM_FRAME);
		this:Show();
		g_InitiativeClose = 0;
		g_FrameInfo = FrameInfoList.LOCK_ITEM_CONFIRM_FRAME;

	elseif(event == "AFFIRM_SHOW") then
		this:Show();
		g_InitiativeClose = 0;
		Quest_Number = tonumber(arg2);
		argFRAME_AFFIRM_SHOW0 = arg0;
		CancelLastOp(FrameInfoList.FRAME_AFFIRM_SHOW);
		g_FrameInfo = FrameInfoList.FRAME_AFFIRM_SHOW;


	-- 帮会成立需玩家确认
	elseif ( event == "GUILD_CREATE_CONFIRM" ) then
		argCREATE_CONFIRM0 = arg0
		CancelLastOp(FrameInfoList.GUILD_CREATE_CONFIRM);
		g_FrameInfo = FrameInfoList.GUILD_CREATE_CONFIRM;
		MessageBox_Self_Text:SetText("Mu痭 kh穒 t誳" .. argCREATE_CONFIRM0 .. "kh鬾g?");
		MessageBox_Self_UpdateRect();
		this:Show();

	-- 帮会删除需玩家确认
	elseif ( event == "GUILD_DESTORY_CONFIRM" ) then
		argDESTORY_CONFIRM0 = arg0
		CancelLastOp(FrameInfoList.GUILD_DESTORY_CONFIRM);
		g_FrameInfo = FrameInfoList.GUILD_DESTORY_CONFIRM;
		MessageBox_Self_Text:SetText("Mu痭 h鼀 b�" .. argDESTORY_CONFIRM0 .. "kh鬾g?");
		MessageBox_Self_UpdateRect();
		this:Show();

	-- 帮会退出需玩家确认
	elseif ( event == "GUILD_QUIT_CONFIRM" ) then
		argQUIT_CONFIRM0 = arg0
		CancelLastOp(FrameInfoList.GUILD_QUIT_CONFIRM);
		g_FrameInfo = FrameInfoList.GUILD_QUIT_CONFIRM;
		MessageBox_Self_Text:SetText("Mu痭 tho醫 ra" .. argQUIT_CONFIRM0 .. "kh鬾g?");
		MessageBox_Self_UpdateRect();
		this:Show();
	
	--帮会同盟退出确认
	elseif event == "GUILD_LEAGUE_QUIT_CONFIRM" then
		argQUIT_LEAGUE_CONFIRM0 = arg0;
		CancelLastOp(FrameInfoList.GUILD_LEAGUE_QUIT_CONFIRM);
		g_FrameInfo = FrameInfoList.GUILD_LEAGUE_QUIT_CONFIRM
		MessageBox_Self_Text:SetText( "Bg h鎢 x醕 nh r秈 b�"..argQUIT_LEAGUE_CONFIRM0.."邪ng Minh kh鬾g ?" );		
		MessageBox_Self_UpdateRect();	
		this:Show();
		
	--帮会同盟创建确认
	elseif event == "GUILD_LEAGUE_CREATE_CONFIRM" then
		argCREATE_LEAGUE_CONFIRM0 = arg0;
		argCREATE_LEAGUE_CONFIRM1 = arg1;
		CancelLastOp(FrameInfoList.GUILD_LEAGUE_CREATE_CONFIRM);
		g_FrameInfo = FrameInfoList.GUILD_LEAGUE_CREATE_CONFIRM
		MessageBox_Self_Text:SetText( "#{TM_20080331_09}#{_EXCHG1000000}#{TM_20080331_02}" );		
		MessageBox_Self_UpdateRect();	
		this:Show();
		

	-- 服务器断了
	elseif ( event == "NET_CLOSE" ) then
		argNET_CLOSE0 = arg0 
		CancelLastOp(FrameInfoList.NET_CLOSE_MESSAGE);
		g_FrameInfo = FrameInfoList.NET_CLOSE_MESSAGE;
		this:Show();

	elseif ( event == "PET_FREE_CONFIRM") then
		Pet_Number = tonumber(arg0);
		CancelLastOp(FrameInfoList.PET_FREE_CONFIRM);
		g_FrameInfo = FrameInfoList.PET_FREE_CONFIRM;
		this:Show();

	elseif ( event == "OPEN_PS_MESSAGE_FRAME" )  then


		AxTrace(0,0,"arg0 = " .. arg0);


		if( arg0 == "name" )    then
			g_szData = arg1;
			g_nData = tonumber(arg2);
			CancelLastOp(FrameInfoList.PS_RENAME_MESSAGE);
			g_FrameInfo = FrameInfoList.PS_RENAME_MESSAGE;

		elseif( arg0 == "ad" )  then
			g_szData = arg1;
			g_nData = tonumber(arg2);
			CancelLastOp(FrameInfoList.PS_READ_MESSAGE);
			g_FrameInfo = FrameInfoList.PS_READ_MESSAGE;

		elseif( arg0 == "immitbase" )		then -- 本金
			g_szData = arg1;
			g_nData  = tonumber(arg2);
			g_nData1 = tonumber(arg3);
			CancelLastOp(FrameInfoList.PS_ADD_BASE_MONEY);
			g_FrameInfo = FrameInfoList.PS_ADD_BASE_MONEY;

		elseif( arg0 == "immit" )				then -- 盈利金存入
			g_szData = arg1;
			g_nData  = tonumber(arg2);
			g_nData1 = tonumber(arg3);
			CancelLastOp(FrameInfoList.PS_ADD_GAIN_MONEY);
			g_FrameInfo = FrameInfoList.PS_ADD_GAIN_MONEY;

		elseif( arg0 == "draw" )				then -- 盈利金取出
			g_szData = arg1;
			g_nData  = tonumber(arg2);
			g_nData1 = tonumber(arg3);
			CancelLastOp(FrameInfoList.PS_DEC_GAIN_MONEY);
			g_FrameInfo = FrameInfoList.PS_DEC_GAIN_MONEY;

		elseif( arg0 == "add_stall" )		then --
			g_szData = arg1;
			g_nData  = tonumber(arg2);
			CancelLastOp(FrameInfoList.PS_ADD_STALL);
			g_FrameInfo = FrameInfoList.PS_ADD_STALL;


		elseif( arg0 == "del_stall" )		then --
			g_szData = arg1;
			g_nData  = tonumber(arg2);
			CancelLastOp(FrameInfoList.PS_DEL_STALL);
			g_FrameInfo = FrameInfoList.PS_DEL_STALL;
			

		elseif( arg0 == "sale" )     	then 	-- 盘出
			g_szData = tonumber(arg2);
			g_nData  = tonumber(arg3);
			CancelLastOp(FrameInfoList.PS_INFO_PANCHU);
			g_FrameInfo = FrameInfoList.PS_INFO_PANCHU;
			

		elseif( arg0 == "back" )     	then	-- 取消盘出
			g_szData = tonumber(arg2);
			g_nData  = tonumber(arg3);
			CancelLastOp(FrameInfoList.PS_INFO_PANRU);
			g_FrameInfo = FrameInfoList.PS_INFO_PANRU;

		elseif( arg0 == "ps_type" )		then	-- 更改玩家商店的子类提示信息
			g_szData = tonumber(arg2);
			g_nData  = tonumber(arg3);
			CancelLastOp(FrameInfoList.PS_INFO_MODIFY_TYPE);
			g_FrameInfo = FrameInfoList.PS_INFO_MODIFY_TYPE;


		end
	elseif ( event == "UI_COMMAND" ) then
		--AxTrace(0,1,"tonumber(arg0)="..tonumber(arg0))
		if tonumber(arg0) == FrameInfoList.SERVER_CONTROL then
				CancelLastOp(FrameInfoList.SERVER_CONTROL);
				g_FrameInfo = FrameInfoList.SERVER_CONTROL;
				-- zchw fix Transfer bug
				local xx = Get_XParam_INT(1);
				ObjCaredID = DataPool : GetNPCIDByServerID(xx);
				if ObjCaredID ~= -1 then	
					--开始关心NPC
					this:CareObject(ObjCaredID, 1, "MsgBox");
				end
		else
				return;
		end
	-- zchw fix Transfer bug
	elseif (event == "OBJECT_CARED_EVENT" and this:IsVisible()) then
		if(tonumber(arg0) ~= ObjCaredID) then
			return;
		end
		--如果和NPC的距离大于一定距离或者被删除，自动关闭
		if(arg1 == "distance" and tonumber(arg2)>MAX_OBJ_DISTANCE or arg1=="destroy") then
			if ObjCaredID ~= -1 then	
				this:CareObject(ObjCaredID, 0, "MsgBox");
			end
			this:Hide();
		end
	elseif( event == "DELETE_FRIEND" ) then
		g_currentList = tonumber(arg0);
		g_currentIndex = tonumber(arg1);
		CancelLastOp(FrameInfoList.DELETE_FRIEND_MESSAGE);
		g_FrameInfo = FrameInfoList.DELETE_FRIEND_MESSAGE;
	elseif( event == "CITY_CONFIRM" ) then
		g_CityData[1] = tonumber(arg0);
		g_CityData[2] = tonumber(arg1);
		g_CityData[3] = arg2;
		g_CityData[4] = arg3;
		g_CityData[5] = arg4;
		g_CityData[6] = arg5;
		g_CityData[7] = arg6;
		g_CityData[8] = arg7;
		CancelLastOp(FrameInfoList.CITY_CONFIRM);
		g_FrameInfo = FrameInfoList.CITY_CONFIRM;
	elseif( event == "MESSAGE_BOX" ) then
		MeesageBox_Init();
		return;
	elseif( event == "CHANGEPROTECTTIME" ) then
		g_ChangeTiemArg0 = tonumber(arg0);
		g_ChangeTiemArg1 = tonumber(arg1);
		CancelLastOp(FrameInfoList.CHANGEPROTECTTIME);
		g_FrameInfo = FrameInfoList.CHANGEPROTECTTIME;
		MessageBox_Self_DragTitle:SetText("#gFF0FA0th秈 gian an to鄋");
		if(g_ChangeTiemArg0 == 0)then
			MessageBox_Self_Text:SetText("M祎 khi thi猼 l th秈 gian an to鄋, l l阯 m課g sau trong th秈 gian an to鄋 s� kh鬾g th� ti猲 h鄋h r nhi玼 vi甤, cho n阯 c醕 h� vui l騨g thi猼 l th秈 gian an to鄋 c黙 m靚h 1 c醕h h䅟 l�. X醕 nh mu痭 thi猼 l kh鬾g ?");
		else
			MessageBox_Self_Text:SetText("T鄆 kho鋘 s� an to鄋 h絥 khi th秈 gian an to鄋 t錸g nh遪g trong th秈 gian n鄖 kh鬾g th� th馽 hi畁 nhi玼 thao t醕. H銀 c鄆 穑t h䅟 l� ch鷑g. C醕 h� c� mu痭 t錸g th秈 gian an to鄋?");
			--帐号  to  账号
		end
		MessageBox_Self_UpdateRect();
		this:Show();
		return;
	elseif(event == "PLAYER_GIVE_ROSE")then
		g_RoseArg0 = arg0;
		g_RoseArg1 = arg1;
		g_RoseArg2 = arg2;
		g_RoseArg3 = arg3;
		g_RoseArg4 = arg4;
		if(g_RoseArg0==nil or g_RoseArg1 == nil )then
			return;
		end
		CancelLastOp(FrameInfoList.Player_Give_Rose);
		g_FrameInfo = FrameInfoList.Player_Give_Rose;
		MessageBox_Self_Text:SetText("#cFFF263 ph鋓 ch錸g tg #c00ff00999 痼a hoa h皀g#cFFF263 cho #c00ff00"..g_RoseArg0.."#cFFF263?");
		MessageBox_Self_UpdateRect();
		this:Show();
		return;
	end

	if(event == "CLOSE_PS_CHANGETYPE_MSG" ) then
		if(this:IsVisible() and g_FrameInfo == FrameInfoList.PS_INFO_MODIFY_TYPE)then
			this:Hide();
		end
		return;
	end
	if(event == "CLOSE_STRENGTH_MSGBOX" ) then
		if(this:IsVisible()) then
			if g_FrameInfo == FrameInfoList.CONFIRM_STENGTH  then 
				this:Hide();
			elseif g_FrameInfo == FrameInfoList.SERVER_CONTROL then
				this:Hide();
			end
		end
		return;
	end
	
	if(event == "CLOSE_RE_IDENTIFY_MSGBOX" ) then
		if(this:IsVisible()) then
			if g_FrameInfo == FrameInfoList.CONFIRM_RE_IDENTIFY  then 
				this:Hide();
			end
		end
		return;
	end
	
	if(event == "CLOSE_KICK_MEMBER_MSGBOX" ) then
		if(this:IsVisible()) then
			if g_FrameInfo == FrameInfoList.KICK_MEMBER_MSGBOX  then 
				this:Hide();
			end
		end
		return;
	end

	if(event == "CLOSE_SAFEBOX_CONFIRM" ) then
		if(this:IsVisible()) then
			if (g_FrameInfo == FrameInfoList.SAFEBOX_LOCK_CONFIRM or g_FrameInfo == FrameInfoList.SAFEBOX_UNLOCK_CONFIRM) then 
				this:Hide();
			end
		end
		return;
	end	
	

	if(event == "CLOSE_RECYCLESHOP_MSG" ) then
		if(this:IsVisible()) then
			
			if g_FrameInfo == FrameInfoList.RECYCLE_DEL_ITEM  then 
				CancelLastOp(-1);
				this:Hide();
			elseif g_FrameInfo == FrameInfoList.OPEN_IS_SELL_TO_RECSHOP then
				CancelLastOp(-1);
				this:Hide();
			end
		end
		return;
	end

	if(event == "ENCHASE_CLOSE_MSGBOX" ) then
		if(this:IsVisible() and  g_FrameInfo == FrameInfoList.ENCHASE_CONFIRM) then
			CancelLastOp(-1);
			this:Hide();
		end
		return;
	end
	
	
	
	-- add:lby20080527确认4镶嵌ENCHASE_FOUR_CONFIRM
	if(event == "ENCHASE_CLOSE_MSGBOX" ) then
		if(this:IsVisible() and  g_FrameInfo == FrameInfoList.ENCHASE_FOUR_CONFIRM) then
			CancelLastOp(-1);
			this:Hide();
		end
		return;
	end

	if(event == "CHAR_RANAME_CONFIRM" ) then
		g_arg_chrc = arg0;
		MessageBox_Self_DragTitle:SetText("#gFF0FA0S豠 t阯 nh鈔 v");
		MessageBox_Self_Text:SetText("Ch� �, C醕 h� ch� c� 1 l s豠 鸨i t阯. #r C醕 h� c� mu痭 x醕 nh s豠 鸨i t阯 l� #G"..g_arg_chrc.."#cFFF263 kh鬾g?");	
		CancelLastOp(FrameInfoList.CHAR_RANAME_CONFIRM);
		g_FrameInfo = FrameInfoList.CHAR_RANAME_CONFIRM
		MessageBox_Self_UpdateRect();
		this:Show();
		return;
	end
	
	if(event == "CITY_RANAME_CONFIRM" ) then
		g_arg_circ = arg0;
		MessageBox_Self_DragTitle:SetText("#gFF0FA0 鸨i t阯 bang h礽");
		MessageBox_Self_Text:SetText("Ch� �, C醕 h� ch� c� 1 l s豠 鸨i t阯. #r C醕 h� c� mu痭 x醕 nh s豠 鸨i t阯 bang h礽 l� #G"..g_arg_circ.."#cFFF263 kh鬾g?");	
		CancelLastOp(FrameInfoList.CITY_RANAME_CONFIRM);
		g_FrameInfo = FrameInfoList.CITY_RANAME_CONFIRM
		MessageBox_Self_UpdateRect();
		this:Show();
		return;
	end

	if(event == "GAMELOGIN_OPEN_COUNT_INPUT") then
		if(this:IsVisible()) then
			CancelLastOp(-1);
			this:Hide();
		end
		return;
	end
		
	if(event == "SAFEBOX_LOCK_CONFIRM") then
		CancelLastOp(FrameInfoList.SAFEBOX_LOCK_CONFIRM);
		g_FrameInfo = FrameInfoList.SAFEBOX_LOCK_CONFIRM;
		MessageBox_Self_DragTitle:SetText("#gFF0FA0 Kh骯 鸶nh R呓ng b鋙 hi琺");
		MessageBox_Self_Text:SetText("#{YHBXX_20071220_10}");
		MessageBox_Self_UpdateRect();
		this:Show();
		return;
	end
	
	if(event == "SAFEBOX_UNLOCK_CONFIRM") then
		CancelLastOp(FrameInfoList.SAFEBOX_UNLOCK_CONFIRM);
		g_FrameInfo = FrameInfoList.SAFEBOX_UNLOCK_CONFIRM;
		MessageBox_Self_DragTitle:SetText("#gFF0FA0 Gi鋓 kh骯 R呓ng b鋙 hi琺");
		MessageBox_Self_Text:SetText("#{YHBXX_20071220_07}");
		MessageBox_Self_UpdateRect();
		this:Show();
		return;
	end
	
	if (event == "CONFIRM_SETPOS_TLZ") then
		CancelLastOp(FrameInfoList.TLZ_CONFIRM_SETPOS);
		g_FrameInfo = FrameInfoList.TLZ_CONFIRM_SETPOS;
		
		local itemIdx = tonumber(arg0)
		local szSceneName = tostring(arg1);
		local iPosX = tonumber(arg2);
		local iPosZ = tonumber(arg3);
		
		Client_ItemIndex = itemIdx
		
		if (szSceneName ~= "") then
			MessageBox_Self_Text:SetText("#{TLZ_081114_1}"..szSceneName.." ("..iPosX..","..iPosZ..")".."#{TLZ_081114_2}")
			MessageBox_Self_UpdateRect();
			this:Show();
		else
			MessageBox_Self_OK_Clicked()
			this:Hide()
			return
		end
		
	end
	
	-- 弹出解散队伍的二次确认窗口			add by WTT	20090212
	if (event == "OPNE_DISMISS_TEAM_MSGBOX")	then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Gi鋓 t醤 鸬i");			-- 设置标题
		MessageBox_Self_Text:SetText( "#{TeamDismiss_090912_1}" );	-- 设置内容
		CancelLastOp(FrameInfoList.DISMISS_TEAM);
		g_FrameInfo = FrameInfoList.DISMISS_TEAM;
		MessageBox_Self_UpdateRect();																-- 恢复窗口大小到初始大小
		this:Show();
		return;
	end

	if(MessageBox_Self_OnEventEx(event) > 0) then
		MessageBox_Self_UpdateFrame();
	end

end

function MeesageBox_Init()
	strMessageString = tostring( arg0 );
	strMessageData	= tostring( arg1 );
	strMessageArgs = tostring(arg2);
	strMessageType	= tostring(arg3);
	strMessageArgs_2 = tostring(arg4)
	CancelLastOp(FrameInfoList.EQUIP_ITEM);
	g_FrameInfo = FrameInfoList.EQUIP_ITEM;
	MessageBox_Update();
end

function MessageBox_Update()
	this:Show();
	MessageBox_Self_OK_Button:Hide();
	MessageBox_Self_Cancel_Button:Hide();
	MessageBox_Self_Text:SetText( strMessageString );
	MessageBox_Self_DragTitle:SetText("#gFF0FA0#gFF0FA0邪ng �")
	if( strMessageType == "Normal" ) then
		MessageBox_Self_OK_Button:Show();
		MessageBox_Self_Cancel_Button:Show();
	elseif( strMessageType == "OK" ) then
		MessageBox_Self_OK_Button:Show();
	elseif( strMessageType == "Cancel" ) then
		MessageBox_Self_Cancel_Button:Show();
	elseif( strMessageType == "NoButton" ) then
	elseif( strMessageType == "Hide" ) then
		this:Hide();
	end
	MessageBox_Self_UpdateRect();
end
function MessageBox_Self_City_UpdateFrame()
	--AxTrace(0,0,"MessageBox_Self_City_UpdateFrame:"..tostring(g_CityData[1]));
	--取消当前建设建筑物的确认信息
	if(g_CityData[1] == 0) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0H鼀 b� x鈟 d駈g hi畁 t読");
		local szName, bLevel, bId = City:GetCityManageInfo("CurBuilding");
		local szExist = City:GetBuildingInfo(bId, "exist");
		if(tonumber(szExist) > 0) then szExist = "Th錸g c"; else szExist = "Thi c鬾g"; end
		local szCurPro = tostring(City:GetCityManageInfo("CurProgress"));
		local szAttr = (City:GetBuildingInfo(bId, "condattrname"));

		local msg = "Bang hi畁 th秈 餫ng"..szExist..szName..", 疸 ho鄋 th鄋h ti猲 鸬 "..szCurPro..". N猽 ch d裻, ";
		msg = msg..szExist.."s� th b読, t c� ti猲 鸬 s� l� 0, kh鬾g ho鄋 l読 b c� ng鈔 l唼ng n鄌 c黙 Bang v� "..szAttr..", c醕 h� mu痭 k猼 th鷆 ";
		msg = msg..szExist.."kh鬾g?";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	--申请领地确认信息
	elseif(g_CityData[1] == 1) then
		local szPortName = City:GetPortInfo(g_CityData[2], "Name");
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Xin l鉵h 鸶a");
		--你确定要申请所在于AA的“BB”领地吗？这项行为需要消耗1000个金币。
		local msg = "#cFFF263C醕 h� quy猼 鸶nh ch鱪 #cFE7E82"..tostring(szPortName).."#cFFF263c黙#H"..g_CityData[3].."#cFFF263";
		msg = msg.."L鉵h 鸶a �? Mu痭 v c ti陁 hao 1000#-14 ho 1 Ki猲 Th鄋h L畁h B鄆.";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	--修建或升级建筑物
	elseif(g_CityData[1] == 2 or g_CityData[1] == 3) then
		local szName, bLevel, bId = City:GetCityManageInfo("CurBuilding");
		if(bLevel == -1 or bId == -1) then
			local szExist = "";
			if(g_CityData[1] == 2) then
				MessageBox_Self_DragTitle:SetText("#gFF0FA0X鈟 d駈g ki猲 tr鷆 m緄");
				szExist = "Thi c鬾g";
			else
				MessageBox_Self_DragTitle:SetText("#gFF0FA0N鈔g c ki猲 tr鷆");
				szExist = "Th錸g c";
			end

			local szName = (City:GetBuildingInfo(g_CityData[2], "name"));
			--建设条件
			local cd = {City:GetBuildingInfo(g_CityData[2], "condition")};
			--0.金钱
			local money = cd[1];
			local txt = "";
			if(0 ~= tonumber(money)) then
				txt = txt.."#{_MONEY"..tostring(money).."}";
			else
				txt = txt.."0#-02";
			end
			money = txt;
			--1.消耗值
			local szAttr = (City:GetBuildingInfo(g_CityData[2], "condattrname"));
			local szAttrVal = tostring(cd[4]);
			--2.任务数
			local mn = tostring(cd[2]);

			local msg = szExist..szName.." c ng鈔 l唼ng c黙 Bang "..money..", ti陁 hao "..szAttr..szAttrVal;
			msg = msg.." 餴琺, 鸢ng th秈 c鬾g b� "..mn.." nhi甿 v�, c醕 h� quy猼 鸶nh kh鬾g?";
			MessageBox_Self_Text:SetText(msg);
			MessageBox_Self_UpdateRect();
			this:Show();
		else
			City:DoConfirm(0);	--取消当前建筑的确认信息
		end
	--降级或拆毁建筑物
	elseif(g_CityData[1] == 4 or g_CityData[1] == 5) then
		local szExist = "";
		if(g_CityData[1] == 4) then
			MessageBox_Self_DragTitle:SetText("#gFF0FA0H� c ki猲 tr鷆");
			szExist = "H� c ";
		else
			MessageBox_Self_DragTitle:SetText("#gFF0FA0Ph� b� ki猲 tr鷆");
			szExist = "Ph� b� ";
		end

		local szName = (City:GetBuildingInfo(g_CityData[2], "name"));
		local szPreAttr = "";
		_,szPreAttr = City:GetBuildingInfo(g_CityData[2], "condattrname");
		local msg = szExist..szName.." s� l鄊 cho t醕 d鴑g v� ch裞 n錸g c黙 ki猲 tr鷆 gi鋗 b総, nh遪g kh鬾g ho鄋 tr� b c� ng鈔 l唼ng n鄌 c黙 Bang v� ";
		msg = msg..szPreAttr..", c醕 h� c� quy猼 鸶nh l鄊 nh� v kh鬾g?";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	--修改城市反展趋势六率值
	elseif(g_CityData[1] == 6) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0S豠 ch鎍 ph呓ng h呔ng ph醫 tri琻");
		local msg = "Ph呓ng h呔ng s豠 ch鎍 ph醫 tri琻 s� ti陁 hao Bang qu� 50#-02, c醕 h� mu痭 quy猼 鸶nh l鄊 nh� v kh鬾g?"
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	--取消研究的确认信息
	elseif(g_CityData[1] == 7) then
		local rName, _, rIdx = City:GetResearchInfo("CurResearch");
		local szCurPro = tostring(City:GetResearchInfo("ResearchProcess"));

		MessageBox_Self_DragTitle:SetText("#gFF0FA0Nghi阯 c製 k猼 th鷆");
		local msg = "Bang n鄖 hi畁 th秈 餫ng nghi阯 c製 "..rName..", 疸 ho鄋 th鄋h ti猲 鸬 "..szCurPro..". N猽 ch d裻, ";
		msg = msg.."Nghi阯 c製 s� th b読, t c� ti猲 鸬 s� l� 0, kh鬾g ho鄋 tr� b c� ng鈔 l唼ng c黙 Bang v� nh鎛g gi� tr� thu礳 t韓h, c醕 h� quy猼 鸶nh mu痭 k猼 th鷆 s� nghi阯 c製 hi畁 t読 kh鬾g?";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();		
		this:Show();
	--开始研究的确认信息
	elseif(g_CityData[1] == 8) then
		local rName = City:GetResearchInfo("CurResearch");
		if("" == rName) then
			local bIdx = tonumber(g_CityData[2]);
			local rIdx = tonumber(g_CityData[3]);
			MessageBox_Self_DragTitle:SetText("#gFF0FA0Nghi阯 c製 pha ch� thu痗 theo 鸾n");
			local szResearchName = City:GetResearchInfo("ResearchName", bIdx, rIdx);
			--建设条件
			local cd = {City:GetResearchInfo("ResearchCondition", bIdx, rIdx)};
			--0.金钱
			local money = cd[1];
			local txt = "";
			if(0 ~= tonumber(money)) then
				txt = txt.."#{_MONEY"..tostring(money).."}";
			else
				txt = txt.."0#-02";
			end
			money = txt;
			--1.所需值
			local szAttr = City:GetResearchInfo("RCAttrName", bIdx, rIdx);
			local szAttrVal = tostring(cd[4]);
			--2.任务数
			local mn = tostring(cd[2]);
			local msg = "Nghi阯 c製 "..szResearchName.." c ng鈔 l唼ng c黙 Bang "..money..", ti陁 hao ";
			msg = msg..szAttr..szAttrVal..", 鸢ng th秈 c鬾g b� nhi甿 v�"..mn.." nhi甿 v�, c醕 h� quy猼 鸶nh kh鬾g?";
			MessageBox_Self_Text:SetText(msg);
			MessageBox_Self_UpdateRect();
			this:Show();
		else
			City:DoConfirm(7);	--取消当前研究的确认信息
		end
	--创建商业路线的确认信息
	elseif(g_CityData[1] == 9) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0S醤g l giao th呓ng");
		local msg = "S� hi畊 c黙 thao t醕 n鄖 l� "..tostring(g_CityData[2])..". Th鄋h l鈖 tuy猲 疬秐g th呓ng m読 c黙 Bang, ch� c 2 b阯 c鵱g th鄋h l tuy猲 疬秐g th呓ng m読, tuy猲 疬秐g m緄 c� hi畊 l馽, c醕 h� quy猼 鸶nh mu痭 th鄋h l kh鬾g?";
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	--取消商业路线的确认信息
	elseif(g_CityData[1] == 10) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0H鼀 b� giao th呓ng");
		local dt = {City:GetCityRoadInfo("RoadDetail", g_CityData[2])};
		local msg = "";
		if(dt[4]) then
			msg = "Thao t醕 n鄖 s� l鄊 cho b眓 bang v� bang h礽 鸠i t醕 鸾n ph呓ng k猼 th鷆 h鄋h vi th呓ng m読 n鄖, c醕 h� quy猼 鸶nh mu痭 ti猵 t鴆 ti猲 h鄋h thao t醕 kh鬾g?";
		else
			msg = "Thao t醕 n鄖 c� ph鋓 s� l鄊 cho b眓 bang v� bang h礽 鸠i t醕 ti猵 t鴆 c� kh� n錸g c鵱g nhau x鈟 d駈g tuy猲 疬秐g th呓ng m読 n鄖, c醕 h� quy猼 鸶nh mu痭 ti猵 t鴆 ti猲 h鄋h thao t醕 kh鬾g?";
		end
		MessageBox_Self_Text:SetText(msg);
		MessageBox_Self_UpdateRect();
		this:Show();
	end
end

function MessageBox_Self_City_OK_Clicked()
	if(g_CityData[1] == 0) then
		local nBuildingId;
		_,_,nBuildingId = City:GetCityManageInfo("CurBuilding");
		City:DoBuilding(nBuildingId, "cancelup");
	elseif(g_CityData[1] == 1) then
		City:CreateCity(g_CityData[2],g_CityData[3]);
	elseif(g_CityData[1] == 2) then
		City:DoBuilding(g_CityData[2], "create");
	elseif(g_CityData[1] == 3) then
		City:DoBuilding(g_CityData[2], "up");
	elseif(g_CityData[1] == 4) then
		City:DoBuilding(g_CityData[2], "down");
	elseif(g_CityData[1] == 5) then
		City:DoBuilding(g_CityData[2], "destory");
	elseif(g_CityData[1] == 6) then
		local k;
		local valTab = {};
		for k = 2, 8 do
			valTab[k-1] = tonumber(g_CityData[k]);
		end
		City:FixCityTrend(
												valTab[1],valTab[2],valTab[3],valTab[4],
												valTab[5],valTab[6],valTab[7],valTab[8]
										 );
	elseif(g_CityData[1] == 7) then
		local rName, bIdx, rIdx = City:GetResearchInfo("CurResearch");
		City:DoResearch(bIdx, rIdx, "cancelresearch");
	elseif(g_CityData[1] == 8) then
		City:DoResearch(tonumber(g_CityData[2]), tonumber(g_CityData[3]), "research");
	elseif(g_CityData[1] == 9) then
		City:DoCityRoad("create", g_CityData[2]);
	elseif(g_CityData[1] == 10) then
		City:DoCityRoad("cancel", g_CityData[2]);
	end
	g_CityData = {};
end

function MessageBox_Self_City_Cancel_Clicked()
	g_CityData = {};
end


--===============================================
-- UpdateFrame
--===============================================
function MessageBox_Self_UpdateFrameEx()

	if( g_FrameInfo==FrameInfoList.SAVE_STALL_INFO) then
		
		MessageBox_Self_DragTitle:SetText("#gFF0FA0B鋙 l遳 v� tr� c豠 h鄋g");
		local szInfo;
		szInfo = "#{INTERFACE_XML_681}";
		MessageBox_Self_Text:SetText(szInfo);
		this:Show();
	-- add by zchw
	elseif (g_FrameInfo == FrameInfoList.CONFIRM_REMOVE_STALL) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Thu h鄋g");
		local szInfo;
		szInfo = "Bg h鎢 x醕 nh mu痭 thu h鄋g kh鬾g ?";
		MessageBox_Self_Text:SetText(szInfo);
		this:Show();
	-- zchw for pet procreate
	elseif (g_FrameInfo == FrameInfoList.PET_PROCREATE_PROMPT) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Ch� �");
		MessageBox_Self_Text:SetText("#{PET_FANZHI_20080313_01}");
		this:Show();
	elseif(g_FrameInfo == FrameInfoList.YUANBAO_BUY_ITEM) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Mua v ph ");
		local szInfo;
		szInfo = "Mua"..g_CityData[3].." c hao ph� "..tostring(g_CityData[2]).." nguy阯 b鋙, c醕 h� x醕 nh kh鬾g ?";
		MessageBox_Self_Text:SetText(szInfo);
		this:Show();
	elseif(g_FrameInfo == FrameInfoList.COMMISION_BUY) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Mua v ph ");
		local szInfo;
		szInfo = "Mua"..CommisionBuyData[1].." c hao ph� "..CommisionBuyData[2]..", c醕 h� x醕 nh kh鬾g ?";
		MessageBox_Self_Text:SetText(szInfo);
		this:Show();
		
	end

end

--===============================================
-- UpdateTitle
--===============================================
function UpdateTitle()
    --因为在MessageBox_Self_UpdateFrame函数中,"upvalue"严重超员,增加了这个函数用来更改msgbox的标题
    if ( PVPFLAG.FREEFORALL == g_FrameInfo ) then
        MessageBox_Self_DragTitle:SetText("#gFF0FA0Thay 鸨i PK");
    elseif ( PVPFLAG.FREEFORTEAM == g_FrameInfo ) then
        MessageBox_Self_DragTitle:SetText("#gFF0FA0Thay 鸨i PK");
    elseif ( PVPFLAG.FREEFORGUILD == g_FrameInfo ) then
        MessageBox_Self_DragTitle:SetText("#gFF0FA0Thay 鸨i PK");
    elseif ( PVPFLAG.MAKESUREPVPCHALLENGE == g_FrameInfo ) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0X醕 nh tuy阯 chi猲");
	end
	MessageBox_Self_UpdateRect();

end

--===============================================
-- UpdateFrame
--===============================================
function MessageBox_Self_UpdateFrame()

	MessageBox_Self_DragTitle:SetText("#gFF0FA0");
	UpdateTitle()

	if g_FrameInfo == FrameInfoList.GEM_COMBINED_CONFIRM then
		this : Show()
		MessageBox_Self_Text : SetText( GemCombinedData[7] )
		MessageBox_Self_UpdateRect();
		return
	end

	if(g_FrameInfo == FrameInfoList.STALL_RENT_FRAME) then
		--提示本的费用
		local nPosTax = StallSale:GetPosTax();
		local nTradeTax = StallSale:GetTradeTax();

		local nGoldCoin;
		local nSilverCoin;
		local nCopperCoin;

		nGoldCoin, nSilverCoin, nCopperCoin = Bank:TransformCoin(nPosTax);

		local szMoneyPosTax = "";
		if(nGoldCoin ~= 0)   then
		 	szMoneyPosTax = tostring(nGoldCoin) .. "#-14";
		end
		if(nSilverCoin ~= 0)   then
		 	szMoneyPosTax = szMoneyPosTax .. tostring(nSilverCoin) .. "#-15";
		end
		if(nCopperCoin ~= 0)   then
			szMoneyPosTax = szMoneyPosTax .. tostring(nCopperCoin) .. "#-16";
		end

		local nCoinType = StallSale:GetStallType()
		if (nCoinType == 1) then --元宝摆摊
			local szInfo = "#{YBBT_081031_1}".. szMoneyPosTax .."#{YBBT_081031_2}1#{YBBT_081031_3}";
			MessageBox_Self_Text:SetText(szInfo);
		else
			local szInfo = "#{YBBT_081031_4}".. szMoneyPosTax .."#{YBBT_081031_5}".. tostring(nTradeTax) .."#{YBBT_081031_6}";
			MessageBox_Self_Text:SetText(szInfo);
		end

	elseif(g_FrameInfo == FrameInfoList.DISCARD_ITEM_FRAME) then
		--通知解除锁定
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Ti陁 h鼀 v ph");
		local szStr = "C醕 h� th l騨g mu痭 ti陁 h鼀 ".. argDISCARD_ITEM_FRAME0 .."?"
		MessageBox_Self_Text:SetText(szStr);

	elseif(g_FrameInfo == FrameInfoList.CANNT_DISCARD_ITEM) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Ti陁 h鼀 v ph");
		local szStr = argCANNT_DISCARD_ITEM0.."锈y l� v ph nhi甿 v�, kh鬾g 疬㧟 ti陁 h鼀";
		MessageBox_Self_Text:SetText(szStr);
		
	elseif(g_FrameInfo == FrameInfoList.LOCK_ITEM_CONFIRM_FRAME) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Kho�");
		local szStr = "#cff0000 Ch� �! #r#YV� b鋙 v� s� an to鄋 c黙 t鄆 kho鋘 c醕 h�, n阯 th叨ng s� d鴑g ch裞 n錸g kh骯 鸶nh v ph ho tr鈔 th�, 鸢ng th秈 m瞚 l mu痭 gi鋓 kh骯 c thi猼 瘙i h猼 #G3 ng鄖#W m緄 c� th� gi鋓 kh骯 疬㧟, c醕 h� c� 鸢ng � x醕 nh kh骯 鸶nh kh鬾g?";
		MessageBox_Self_Text:SetText(szStr);

	elseif(g_FrameInfo == FrameInfoList.FRAME_AFFIRM_SHOW) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0T� b� nhi甿 v�");
		local szStr = "#cFFF263C醕 h� th l騨g mu痭 t� b� #Rnhi甿 v�: "..argFRAME_AFFIRM_SHOW0.."#cFFF263 kh鬾g?";
		MessageBox_Self_Text:SetText(szStr);

	elseif(g_FrameInfo == FrameInfoList.GUILD_CREATE_CONFIRM) then
		-- 帮会成立需玩家确认
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Th鄋h l Bang h礽");
		local szStr = "C醕 h� x醕 nh s醤g l" .. argCREATE_CONFIRM0 .. " bang h礽 kh鬾g?";
		MessageBox_Self_Text:SetText(szStr);
	elseif(g_FrameInfo == FrameInfoList.GUILD_DESTORY_CONFIRM) then
	  MessageBox_Self_DragTitle:SetText("#gFF0FA0Gi鋓 t醤");
		local szStr = "C醕 h� x醕 nh h鼀 b�" .. argDESTORY_CONFIRM0 .. " bang h礽 kh鬾g?";
		MessageBox_Self_Text:SetText(szStr);
	elseif(g_FrameInfo == FrameInfoList.GUILD_QUIT_CONFIRM) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0R鷗 lui bang h礽");
		local szStr = "C醕 h� x醕 nh r鷗 lui" .. argQUIT_CONFIRM0 .. " bang h礽 kh鬾g?";
		MessageBox_Self_Text:SetText(szStr);
	elseif(g_FrameInfo == FrameInfoList.GUILD_LEAGUE_QUIT_CONFIRM) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0R秈 b� 邪ng Minh ");
		local szStr = "C醕 h� x醕 nh r鷗 lui" .. argQUIT_LEAGUE_CONFIRM0 .. "邪ng Minh kh鬾g ?";
		MessageBox_Self_Text:SetText(szStr);
	elseif(g_FrameInfo == FrameInfoList.GUILD_LEAGUE_CREATE_CONFIRM) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Thi猼 l 邪ng Minh");
		local szStr = "#{TM_20080331_09}#{_EXCHG1000000}#{TM_20080331_02}";
		MessageBox_Self_Text:SetText(szStr);
	elseif(g_FrameInfo == FrameInfoList.NET_CLOSE_MESSAGE) then
		MessageBox_Self_Text:SetText(argNET_CLOSE0);
	elseif(g_FrameInfo == FrameInfoList.PET_FREE_CONFIRM) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Ph髇g sinh tr鈔 th�");
		local petname = Pet:GetPetList_Appoint(Pet_Number) ;
		local strname, pettype = Pet:GetName(Pet_Number);
		local szStr = "C� mu痭 x醕 nh ph髇g sinh ["..petname.."]("..pettype..")?" ;
		MessageBox_Self_Text:SetText(szStr);

	elseif(g_FrameInfo == FrameInfoList.PS_RENAME_MESSAGE)  then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0S豠 鸨i t阯 c豠 h鄋g");
		--玩家商店更名需要的金钱数字
		local nGoldCoin;
		local nSilverCoin;
		local nCopperCoin;

		nGoldCoin, nSilverCoin, nCopperCoin = Bank:TransformCoin(g_nData);

		local szMoney = "";
		if(nGoldCoin ~= 0)   then
		 	szMoney = tostring(nGoldCoin) .. "#-02";
		end
		if(nSilverCoin ~= 0)   then
		 	szMoney = szMoney .. tostring(nSilverCoin) .. "#-03";
		end
		if(nCopperCoin ~= 0)   then
			szMoney = szMoney .. tostring(nCopperCoin) .. "#-04";
		end

		local szInfo = "S豠 鸨i t阯 gian h鄋g c chi tr� ph� kim t� 2".."#-02".. "* ch� s� th呓ng nghi畃, ch� s� th呓ng nghi畃 hi畁 t読 l� ".. PlayerShop:GetCommercialFactor().."C chi ra"..szMoney..", c醕 h� mu痭 quy猼 鸶nh s豠 鸨i kh鬾g?"
		MessageBox_Self_Text:SetText(szInfo);

		this:Show()

	elseif(g_FrameInfo == FrameInfoList.PS_READ_MESSAGE)    then
		--玩家商店更更改商店说明需要的金钱数字
		MessageBox_Self_DragTitle:SetText("#gFF0FA0斜i gi緄 thi畊");
		local nGoldCoin;
		local nSilverCoin;
		local nCopperCoin;

		nGoldCoin, nSilverCoin, nCopperCoin = Bank:TransformCoin(g_nData);

		local szMoney = "";
		if(nGoldCoin ~= 0)   then
		 	szMoney = tostring(nGoldCoin) .. "#-02";
		end
		if(nSilverCoin ~= 0)   then
		 	szMoney = szMoney .. tostring(nSilverCoin) .. "#-03";
		end
		if(nCopperCoin ~= 0)   then
			szMoney = szMoney .. tostring(nCopperCoin) .. "#-04";
		end

		local szInfo = "S豠 鸨i gian h鄋g v� mi陁 t� c chi tr� ph� B鷗 m馽".."50#-03".. "* ch� s� th呓ng nghi畃, ch� s� th呓ng nghi畃 hi畁 t読 l� ".. PlayerShop:GetCommercialFactor().."C chi ra"..szMoney..", c醕 h� mu痭 quy猼 鸶nh s豠 鸨i kh鬾g?"
		MessageBox_Self_Text:SetText(szInfo);

		this:Show()

	elseif(g_FrameInfo == FrameInfoList.PS_ADD_BASE_MONEY)    then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0N誴 ti玭 v鄌");
		local nGoldCoin;
		local nSilverCoin;
		local nCopperCoin;

		nGoldCoin, nSilverCoin, nCopperCoin = Bank:TransformCoin(g_nData);

		local szMoney = "";
		if(nGoldCoin ~= 0)   then
		 	szMoney = tostring(nGoldCoin) .. "#-02";
		end
		if(nSilverCoin ~= 0)   then
		 	szMoney = szMoney .. tostring(nSilverCoin) .. "#-03";
		end
		if(nCopperCoin ~= 0)   then
			szMoney = szMoney .. tostring(nCopperCoin) .. "#-04";
		end

		nGoldCoin, nSilverCoin, nCopperCoin = Bank:TransformCoin(g_nData1);

		local szMoney1 = "";
		if(nGoldCoin ~= 0)   then
		 	szMoney1 = tostring(nGoldCoin) .. "#-02";
		end
		if(nSilverCoin ~= 0)   then
		 	szMoney1 = szMoney1 .. tostring(nSilverCoin) .. "#-03";
		end
		if(nCopperCoin ~= 0)   then
			szMoney1 = szMoney1 .. tostring(nCopperCoin) .. "#-04";
		end

		local szInfo = "C醕 h� s� n誴 v鄌" .. szMoney .. ", h� th痭g s� thu c黙 c醕 h� 3% thu� 馥u t�, c醕 h� s� c ph鋓 chi ngo鄆 " .. szMoney1 .. ", c醕 h� quy猼 鸶nh n誴 v鄌 kh鬾g?";

		MessageBox_Self_Text:SetText(szInfo);

	elseif(g_FrameInfo == FrameInfoList.PS_ADD_GAIN_MONEY)    then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0 Nh v鄌 ti玭 l㱮 nhu");
		local nGoldCoin;
		local nSilverCoin;
		local nCopperCoin;

		nGoldCoin, nSilverCoin, nCopperCoin = Bank:TransformCoin(g_nData);

		local szMoney = "";
		if(nGoldCoin ~= 0)   then
		 	szMoney = tostring(nGoldCoin) .. "#-02";
		end
		if(nSilverCoin ~= 0)   then
		 	szMoney = szMoney .. tostring(nSilverCoin) .. "#-03";
		end
		if(nCopperCoin ~= 0)   then
			szMoney = szMoney .. tostring(nCopperCoin) .. "#-04";
		end

		nGoldCoin, nSilverCoin, nCopperCoin = Bank:TransformCoin(g_nData1);

		local szMoney1 = "";
		if(nGoldCoin ~= 0)   then
		 	szMoney1 = tostring(nGoldCoin) .. "#-02";
		end
		if(nSilverCoin ~= 0)   then
		 	szMoney1 = szMoney1 .. tostring(nSilverCoin) .. "#-03";
		end
		if(nCopperCoin ~= 0)   then
			szMoney1 = szMoney1 .. tostring(nCopperCoin) .. "#-04";
		end

		local szInfo = "C醕 h� s� n誴 v鄌" .. szMoney .. ", h� th痭g s� thu c黙 c醕 h� 3% thu� 馥u t�, c醕 h� s� c ph鋓 chi ngo鄆 " .. szMoney1 .. ", c醕 h� quy猼 鸶nh n誴 v鄌 kh鬾g?";

		MessageBox_Self_Text:SetText(szInfo);

	

	elseif(g_FrameInfo == FrameInfoList.PS_DEC_GAIN_MONEY)    then

	elseif(g_FrameInfo == FrameInfoList.SERVER_CONTROL)    then
		Server_Script_Function = Get_XParam_STR(0);
		Server_Script_ID = Get_XParam_INT(0);
		Server_Return_1 = Get_XParam_INT(1);
		Server_Return_2 = Get_XParam_INT(2);

		MessageBox_Self_Text:SetText(Get_XParam_STR(1));

	elseif(g_FrameInfo == FrameInfoList.PS_ADD_STALL)   then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0M� r祅g qu h鄋g");
		local nGoldCoin;
		local nSilverCoin;
		local nCopperCoin;

		nGoldCoin, nSilverCoin, nCopperCoin = Bank:TransformCoin(g_nData);

		local szMoney = "";
		if(nGoldCoin ~= 0)   then
		 	szMoney = tostring(nGoldCoin) .. "#-02";
		end
		if(nSilverCoin ~= 0)   then
		 	szMoney = szMoney .. tostring(nSilverCoin) .. "#-03";
		end
		if(nCopperCoin ~= 0)   then
			szMoney = szMoney .. tostring(nCopperCoin) .. "#-04";
		end

		local szInfo = "M� r祅g qu h鄋g c chi ra 30#-02*ch� s� th呓ng nghi畃*2*103%, ch� s� th呓ng nghi畃 hi畁 th秈 l�".. PlayerShop:GetCommercialFactor() ..", c chi ra" .. szMoney .. ", c醕 h� mu痭 quy猼 鸶nh m� r祅g kh鬾g?"

		MessageBox_Self_Text:SetText(szInfo);

	elseif(g_FrameInfo == FrameInfoList.PS_DEL_STALL)   then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Gi鋗 b総 qu h鄋g");
		MessageBox_Self_Text:SetText("Sau khi thu gi鋗 qu h鄋g, s� h鄋g h骯 c黙 c醕 h� b鄖 ra b醤 trong qu h鄋g c鹡g s� b� h� th痭g thu h癷. C醕 h� c� x醕 鸶nh mu痭 l鄊 nh� v kh鬾g ?");

	elseif(g_FrameInfo == FrameInfoList.PS_INFO_PANCHU)  then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Chuy琻 ra kh鰅 c豠 h鄋g");
		local nGoldCoin;
		local nSilverCoin;
		local nCopperCoin;

		nGoldCoin, nSilverCoin, nCopperCoin = Bank:TransformCoin(g_szData);

		local szMoney = "";
		if(nGoldCoin ~= 0)   then
		 	szMoney = tostring(nGoldCoin) .. "#-02";
		end
		if(nSilverCoin ~= 0)   then
		 	szMoney = szMoney .. tostring(nSilverCoin) .. "#-03";
		end
		if(nCopperCoin ~= 0)   then
			szMoney = szMoney .. tostring(nCopperCoin) .. "#-04";
		end

		local szInfo = "Chuy琻 ra kh鰅 c豠 h鄋g c chi ra 15#-02*ch� s� th呓ng nghi畃, ch� s� th呓ng nghi畃 hi畁 t読 l� ".. PlayerShop:GetCommercialFactor() ..", c chi ra" .. szMoney .. ", c醕 h� quy猼 鸶nh chuy琻 ra kh鰅 c豠 h鄋g kh鬾g?"
		MessageBox_Self_Text:SetText(szInfo);

	elseif(g_FrameInfo == FrameInfoList.PS_INFO_PANRU)  then   --盘入

		MessageBox_Self_DragTitle:SetText("#gFF0FA0Chuy琻 v鄌 c豠 h鄋g");
		local nGoldCoin;
		local nSilverCoin;
		local nCopperCoin;

		nGoldCoin, nSilverCoin, nCopperCoin = Bank:TransformCoin(g_szData);

		local szMoney = "";
		if(nGoldCoin ~= 0)   then
		 	szMoney = tostring(nGoldCoin) .. "#-02";
		end
		if(nSilverCoin ~= 0)   then
		 	szMoney = szMoney .. tostring(nSilverCoin) .. "#-03";
		end
		if(nCopperCoin ~= 0)   then
			szMoney = szMoney .. tostring(nCopperCoin) .. "#-04";
		end

		local szInfo = "H鼀 b� chuy琻 ra qu h鄋g c chi ra 5#-02*ch� s� th呓ng nghi畃, ch� s� th呓ng nghi畃 hi畁 t読 l� ".. PlayerShop:GetCommercialFactor() ..", c chi ra" .. szMoney .. ", C醕 h� x醕 nh chuy琻 v鄌 c豠 ti甿 sao?"

		MessageBox_Self_Text:SetText(szInfo);

	elseif( g_FrameInfo == FrameInfoList.PS_INFO_MODIFY_TYPE ) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0斜i lo読 h靚h c豠 h鄋g");
		local nGoldCoin;
		local nSilverCoin;
		local nCopperCoin;

		nGoldCoin, nSilverCoin, nCopperCoin = Bank:TransformCoin(g_szData);
		local szMoney = "";
		if(nGoldCoin ~= 0)   then
		 	szMoney = tostring(nGoldCoin) .. "#-02";
		end
		if(nSilverCoin ~= 0)   then
		 	szMoney = szMoney .. tostring(nSilverCoin) .. "#-03";
		end
		if(nCopperCoin ~= 0)   then
			szMoney = szMoney .. tostring(nCopperCoin) .. "#-04";
		end

		local szInfo = "S豠 鸨i lo読 h靚h c豠 h鄋g c chi ra ph� d鱪?5#-02 *ch� s� th呓ng nghi畃, ch� s� th呓ng nghi畃 hi畁 th秈 l�".. PlayerShop:GetCommercialFactor() ..", c chi ra" .. szMoney .. ", c醕 h� mu痭 quy猼 鸶nh s豠 鸨i kh鬾g?"

		MessageBox_Self_Text:SetText(szInfo);
	elseif( g_FrameInfo == FrameInfoList.DELETE_FRIEND_MESSAGE ) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0 h鼀 b� x醕 nh");
		local szInfo;
		local relationtype = DataPool:GetFriend(g_currentList,g_currentIndex, "RELATION_TYPE" )
		if relationtype == 7 then
			szInfo = "#cFFF263C醕 h� quy猼 鸶nh mu痭 h鼀 b� ".."#R"..DataPool:GetFriend(g_currentList,g_currentIndex, "NAME"  ) .."#cFFF263".."kh鬾g ? Sau khi x骯 b� s� kh鬾g th� c鵱g 鸠i ph呓ng tham gia b c� ho誸 鸬ng s� 鸢 n鄌.";
		else
			szInfo = "#cFFF263C醕 h� quy猼 鸶nh mu痭 h鼀 b� ".."#R"..DataPool:GetFriend(g_currentList,g_currentIndex, "NAME"  ) .."#cFFF263".." kh鬾g?";
		end
		MessageBox_Self_Text:SetText(szInfo);
	elseif( g_FrameInfo == FrameInfoList.CITY_CONFIRM ) then
		MessageBox_Self_City_UpdateFrame();
	elseif( g_FrameInfo == FrameInfoList.PET_SYNC_CONFIRM ) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0Tr鈔 th� h瞡 h䅟");
		local msg = "C醕 h� quy猼 鸶nh mu痭 s�";
		MessageBox_Self_Text:SetText(msg);
	elseif( g_FrameInfo == FrameInfoList.EXCHANGE_BANGGONG ) then
		MessageBox_Self_DragTitle:SetText("#gFF0FA0斜i Bang C痭g B鄆");
	elseif( g_FrameInfo == FrameInfoList.PUT_GUILDMONEY ) then
		MessageBox_Self_DragTitle:SetText("#{BPZJ_0801014_020}");
	end

	MessageBox_Self_UpdateFrameEx();
	MessageBox_Self_UpdateRect();	
	this:Show();
end

--===============================================
-- 点击确定（IDOK）
--===============================================
function MessageBox_Self_OK_Clicked_Ex()
    AxTrace( 0, 0, "MessageBox_OnOKClick" )
	if( g_FrameInfo == FrameInfoList.FREEFORALL ) then --同意开启个人混战
        AxTrace( 0, 0, "FrameInfoList.FREEFORALL" )
        Player:ChangePVPMode( 1 );
    end
    if( g_FrameInfo == FrameInfoList.FREEFORTEAM ) then --同意开启队伍混战
        AxTrace( 0, 0, "FrameInfoList.FREEFORTEAM" )
        Player:ChangePVPMode( 3 );
    end
    if( g_FrameInfo == FrameInfoList.FREEFORGUILD ) then  --同意开启帮派混战
        AxTrace( 0, 0, "FrameInfoList.FREEFORGUILD" )
        Player:ChangePVPMode( 4 );
    end
    if( g_FrameInfo == FrameInfoList.MAKESUREPVPCHALLENGE ) then  --确认宣战
        AxTrace( 0, 0, "FrameInfoList.MAKESUREPVPCHALLENGE" )
        Player:PVP_Challenge( 2 );     --2为宣战确认对话框确认
    end
    
    if(g_FrameInfo == FrameInfoList.CHANGEPROTECTTIME)then
	if(g_ChangeTiemArg1 ~= nil)then
		SendSetProtectTimeMsg(g_ChangeTiemArg1);
		g_ChangeTiemArg1 =nil;
	end
    end
    if( PVPFLAG.ACCEPTDUEL == g_FrameInfo ) then
        DuelAccept( tostring( PVPFLAG.DuelName ),tostring( PVPFLAG.DuelGUID ), 1 )
    end


	if( g_FrameInfo == FrameInfoList.SAVE_STALL_INFO ) then
		StallSale:CloseStall("ok");
	-- add by zchw	
		StallSale:CloseStallMessage();
	elseif g_FrameInfo == FrameInfoList.CONFIRM_REMOVE_STALL then
		StallSale:CloseStall("ask");
	-- zchw for pet procreate
	elseif g_FrameInfo == FrameInfoList.PET_PROCREATE_PROMPT then
		PushEvent(462, 0); --PETPROCREATE_KEY_STATE 
		Pet:ConfirmPetProcreate(1);
		
	elseif  g_FrameInfo == FrameInfoList.QUIT_GAME  then
		EnterQuitWait(0);
		--QuitApplication("quit");
	elseif(g_FrameInfo == FrameInfoList.PS_DEL_STALL)    then
		PlayerShop:ChangeShopNum("del_ok");
	elseif(g_FrameInfo == FrameInfoList.PS_INFO_PANCHU)    then
		PlayerShop:Transfer("apply", "sale", g_nData);
	elseif(g_FrameInfo == FrameInfoList.PS_INFO_PANRU)    then
		PlayerShop:Transfer("apply", "back", g_nData);
	elseif( g_FrameInfo == FrameInfoList.PS_INFO_MODIFY_TYPE ) then
		PlayerShop:ModifySubType("ps_type_ok", tonumber(g_nData));
	elseif( g_FrameInfo == FrameInfoList.DELETE_FRIEND_MESSAGE ) then
		DataPool:DelFriend( g_currentList, g_currentIndex );
	elseif( g_FrameInfo == FrameInfoList.CITY_CONFIRM ) then
		MessageBox_Self_City_OK_Clicked();
	elseif( g_FrameInfo == FrameInfoList.PET_SYNC_CONFIRM ) then
		MessageBox_Self_PetSyn_OK_Clicked();
	elseif(g_FrameInfo ==FrameInfoList.GUILD_DEMIS_CONFIRM) then
		Guild:DemisGuildOK();
	elseif(g_FrameInfo ==FrameInfoList.GUILD_LEAGUE_QUIT_CONFIRM) then
		GuildLeague:Quit();
	elseif(g_FrameInfo ==FrameInfoList.GUILD_LEAGUE_CREATE_CONFIRM) then
		local r=GuildLeague:Create(argCREATE_LEAGUE_CONFIRM0,argCREATE_LEAGUE_CONFIRM1)
		if r==-1 then
			PushDebugMessage("#{TM_20080311_05}")
		elseif r==-2 then
			PushDebugMessage("#{TM_20080311_07}")	
		end
	elseif(g_FrameInfo == FrameInfoList.YUANBAO_BUY_ITEM) then
		NpcShop:BulkBuyItem(g_CityData[1],1);
	elseif(g_FrameInfo == FrameInfoList.COMMISION_BUY) then
		CommisionShop:OnBuyConfrimed();
	end
	if( FrameInfoList.Player_Give_Rose == g_FrameInfo ) then
		Player:UseRose(tonumber(g_RoseArg1),tonumber(g_RoseArg2),tonumber(g_RoseArg3),tonumber(g_RoseArg4))
	end

	if(g_FrameInfo == FrameInfoList.RECYCLE_DEL_ITEM) then
		if(Recycle_Type<0 or Recycle_CurSelectItem<0) then
			return
		end
		PlayerShop:SendCancelRecItemMsg(Recycle_Type,Recycle_CurSelectItem);
		Recycle_Type =-1;
		Recycle_CurSelectItem = -1;
	end

	if(g_FrameInfo == FrameInfoList.OPEN_IS_SELL_TO_RECSHOP) then
		if(Recycle_Bag_idx<0 or Recycle_Shop_idx<0) then
			return
		end
		PlayerShop:SendSellItem2RecycleShopMsg(Recycle_Bag_idx,Recycle_Shop_idx);
		Recycle_Bag_idx =-1;
		Recycle_Shop_idx = -1;
	end
	if(g_FrameInfo == FrameInfoList.CONFIRM_STENGTH) then
		if(Stength_Equip_Idx<0 or Stength_Item_Idx<0) then
			return
		end
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("FinishEnhance");
			Set_XSCRIPT_ScriptID(809262);
			Set_XSCRIPT_Parameter(0,tonumber(Stength_Equip_Idx));
			Set_XSCRIPT_Parameter(1,tonumber(Stength_Item_Idx));
			Set_XSCRIPT_ParamCount(2);
		Send_XSCRIPT();
		Stength_Equip_Idx =-1;
		Stength_Item_Idx = -1;
	end
	if(g_FrameInfo == FrameInfoList.EXCHANGE_BANGGONG) then
		if(BangGong_Value < 0) then
			return
		end
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("BanggongExchange");
			Set_XSCRIPT_ScriptID(805009);
			Set_XSCRIPT_Parameter(0,BangGong_Value);
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
		BangGong_Value =-1;
	end
	if(g_FrameInfo == FrameInfoList.PUT_GUILDMONEY) then
		if(GuildMoney_Value < 0) then
			return
		end
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("PutGuildMoney");
			Set_XSCRIPT_ScriptID(805012);
			Set_XSCRIPT_Parameter(0,GuildMoney_Value);
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
		GuildMoney_Value =-1;
	end
	if(g_FrameInfo == FrameInfoList.CONFIRM_RE_IDENTIFY) then
		if(RID_Equip_Idx<0) then
			return
		end
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("FinishReAdjust");
			Set_XSCRIPT_ScriptID(809261);
			Set_XSCRIPT_Parameter(0,tonumber(RID_Equip_Idx));
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
		RID_Equip_Idx =-1;
	end
	if(g_FrameInfo == FrameInfoList.KICK_MEMBER_MSGBOX) then
		if(Member_Idx < 0) then
			return
		end
		Guild:SureKickGuild(tonumber(Member_Idx));
		Member_Idx =-1;
		Member_Name = "";
	end
	
	if (g_FrameInfo == FrameInfoList.TLZ_CONFIRM_SETPOS) then
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("SetPosition");
			Set_XSCRIPT_ScriptID(330001);
			Set_XSCRIPT_Parameter(0, Client_ItemIndex);
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
	end
	
end

function MessageBox_OnOKClick()
	if( strMessageData == "EquipBind" ) then -- 绑定
		EquipItem( tonumber( strMessageArgs ),tonumber(strMessageArgs_2) );
	end
	this:Hide();
end
--===============================================
-- 点击确定（IDOK）
--===============================================
function MessageBox_Self_OK_Clicked()
	
	if g_FrameInfo == FrameInfoList.SAFEBOX_LOCK_CONFIRM then
		SafeBox("reallock");
		this : Hide()
		return
	end

	if g_FrameInfo == FrameInfoList.SAFEBOX_UNLOCK_CONFIRM then
		SafeBox("realunlock");
		this : Hide()
		return
	end
	
	if g_FrameInfo == FrameInfoList.CITY_RANAME_CONFIRM then
		Guild : SendCityRnameMsg( g_arg_circ )
		this : Hide()
		return
	end

	if g_FrameInfo == FrameInfoList.CHAR_RANAME_CONFIRM then
		Target : SendCharRnameMsg( g_arg_chrc )
		this : Hide()
		return
	end	
	
	if g_FrameInfo == FrameInfoList.GEM_COMBINED_CONFIRM then
		LifeAbility : Do_Combine( GemCombinedData[1], GemCombinedData[2],
			GemCombinedData[3], GemCombinedData[4],
			GemCombinedData[5], GemCombinedData[6], 1 )
		this : Hide()
		return
	end
	
	if g_FrameInfo == FrameInfoList.ENCHASE_CONFIRM then
		LifeAbility : Do_Enchase( EnchaseData[1], EnchaseData[2],EnchaseData[3], EnchaseData[4])
		this:Hide()
		return
	end

-- add:lby20080527确认4镶嵌ENCHASE_FOUR_CONFIRM
	if g_FrameInfo == FrameInfoList.ENCHASE_FOUR_CONFIRM then
		LifeAbility : Do_Enchase_Four( EnchaseData[1], EnchaseData[2],EnchaseData[3], EnchaseData[4])
		this:Hide()
		return
	end

	-- 宠物学习技能确认：两个手动技能学习
	if g_FrameInfo == FrameInfoList.PET_SKILL_STUDY_CONFIRM then
		Pet:ConfirmPetSkillStudy()
		this:Hide()
		return
	end

--	if g_FrameInfo == FrameInfoList.CARVE_CONFIRM then
--	  Clear_XSCRIPT();
--		Set_XSCRIPT_Function_Name(CarveData[1]);
--		Set_XSCRIPT_ScriptID(CarveData[2]);
--		Set_XSCRIPT_Parameter(0,CarveData[3]);
--		Set_XSCRIPT_Parameter(1,CarveData[4]);
--		Set_XSCRIPT_ParamCount(CarveData[5]);
--	  Send_XSCRIPT();
--		this:Hide()
--		return
--	end
	

	if(g_FrameInfo == FrameInfoList.STALL_RENT_FRAME) then
		--通知服务器决定开始在这里摆摊
		StallSale:AgreeBeginStall();

	elseif(g_FrameInfo == FrameInfoList.DISCARD_ITEM_FRAME) then
		--通知销毁物品
		DiscardItem();

	elseif(g_FrameInfo == FrameInfoList.CANNT_DISCARD_ITEM) then
		--任务物品不能销毁
		g_InitiativeClose = 1;
		this:Hide();
	
	elseif(g_FrameInfo == FrameInfoList.LOCK_ITEM_CONFIRM_FRAME) then
		--通知加锁物品
		LockAfterConfirm();

	elseif(g_FrameInfo == FrameInfoList.FRAME_AFFIRM_SHOW) then
		--放弃任务
		if(Quest_Number > -1) then
			QuestFrameMissionAbnegate(Quest_Number);
		end
		g_InitiativeClose = 1;
		this:Hide();


	elseif(g_FrameInfo == FrameInfoList.GUILD_CREATE_CONFIRM) then
		-- 帮会成立需玩家确认
		Guild:CreateGuildConfirm(1);
		this:Hide();
	elseif(g_FrameInfo == FrameInfoList.GUILD_DESTORY_CONFIRM) then
		-- 帮会成立需玩家确认
		Guild:CreateGuildConfirm(2);
		this:Hide();
	elseif(g_FrameInfo == FrameInfoList.GUILD_QUIT_CONFIRM) then
		-- 帮会成立需玩家确认
		Guild:CreateGuildConfirm(3);
		this:Hide();

	elseif(g_FrameInfo == FrameInfoList.NET_CLOSE_MESSAGE) then
		QuitApplication("quit");
		this:Hide();

	elseif(g_FrameInfo == FrameInfoList.PET_FREE_CONFIRM) then
		Pet : Go_Free(Pet_Number);
		this:Hide();

	elseif(g_FrameInfo == FrameInfoList.PS_RENAME_MESSAGE)  then
		--玩家商店更名需要的金钱数字
		PlayerShop:Modify("name_ok",g_szData);

	elseif(g_FrameInfo == FrameInfoList.PS_READ_MESSAGE)    then
		--玩家商店更更改商店说明需要的金钱数字
		PlayerShop:Modify("ad_ok",g_szData);

	elseif(g_FrameInfo == FrameInfoList.PS_ADD_BASE_MONEY)    then
		PlayerShop:ApplyMoney("immitbase_ok", g_nData);

	elseif(g_FrameInfo == FrameInfoList.PS_ADD_GAIN_MONEY)    then
		PlayerShop:ApplyMoney("immit_ok", g_nData);

	elseif(g_FrameInfo == FrameInfoList.SERVER_CONTROL)    then
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name(Server_Script_Function);
			Set_XSCRIPT_ScriptID(Server_Script_ID);
			Set_XSCRIPT_Parameter(0,Server_Return_1);
			Set_XSCRIPT_Parameter(1,Server_Return_2);
			Set_XSCRIPT_ParamCount(2);
		Send_XSCRIPT();

	elseif(g_FrameInfo == FrameInfoList.PS_ADD_STALL)    then
		PlayerShop:ChangeShopNum("add_ok");
	end
	
	if( g_FrameInfo == FrameInfoList.EQUIP_ITEM ) then
		MessageBox_OnOKClick();
		return;
	end
	
	-- 确认解散队伍			add by WTT	20090212
	if g_FrameInfo == FrameInfoList.DISMISS_TEAM then
		Player:ConfirmDismissTeam()
		this:Hide()
		return
	end

	MessageBox_Self_OK_Clicked_Ex();
	this:Hide();
end

function MessageBox_Self_PetSyn_OK_Clicked()
	Pet:Syn_Do(g_CityData[1], g_CityData[2]);
	g_CityData = {};
end
--===============================================
-- 放弃摆摊(IDCONCEL)
--===============================================
function MessageBox_Self_Cancel_Clicked(bClick)
	if( 1 == bClick ) then
		--AxTrace( 0, 0, bClick )
		if( PVPFLAG.ACCEPTDUEL == g_FrameInfo ) then
			DuelAccept( tostring( PVPFLAG.DuelName ), tostring( PVPFLAG.DuelGUID ), 0 )
		end
    end

	if ( g_FrameInfo == FrameInfoList.DISCARD_ITEM_FRAME ) then
		--通知解除锁定
		DiscardItemCancelLocked();

    elseif ( g_FrameInfo == FrameInfoList.LOCK_ITEM_CONFIRM_FRAME ) then
		--通知解除加锁
		CancelLockAfterConfirm();

	elseif ( g_FrameInfo == FrameInfoList.GUILD_CREATE_CONFIRM ) then
		Guild:CreateGuildConfirm(0);
	elseif ( g_FrameInfo == FrameInfoList.GUILD_DESTORY_CONFIRM ) then
		Guild:CreateGuildConfirm(0);
	elseif ( g_FrameInfo == FrameInfoList.GUILD_QUIT_CONFIRM ) then
		Guild:CreateGuildConfirm(0);

	elseif(g_FrameInfo == FrameInfoList.NET_CLOSE_MESSAGE) then
		QuitApplication("quit");
	elseif( g_FrameInfo == FrameInfoList.CITY_CONFIRM ) then
		MessageBox_Self_City_Cancel_Clicked();
	elseif(g_FrameInfo == FrameInfoList.YUANBAO_BUY_ITEM) then
		g_CityData = {};
	-- add by zchw
	elseif g_FrameInfo == FrameInfoList.CONFIRM_REMOVE_STALL then
		this:Hide();
	-- zchw for pet procreate
	elseif g_FrameInfo == FrameInfoList.PET_PROCREATE_PROMPT then
		if bClick == 1 then
			PushEvent(462, 1); --PETPROCREATE_KEY_STATE
		end
		this:Hide();
	elseif( g_FrameInfo == FrameInfoList.SAVE_STALL_INFO ) then
		if bClick == 1 then
			StallSale:CloseStall("cancel");
			-- add by zchw
			StallSale:CloseStallMessage();
		end
		-- add by zchw
		StallSale:CloseStallMessage();
	elseif( g_FrameInfo == FrameInfoList.PET_SYNC_CONFIRM ) then
		g_CityData = {};
--	elseif( g_FrameInfo == FrameInfoList.SERVER_CONTROL ) then
--		Clear_XSCRIPT();
--			Set_XSCRIPT_Function_Name(Server_Script_Function);
--			Set_XSCRIPT_ScriptID(Server_Script_ID);
--			Set_XSCRIPT_Parameter(0,Server_Return_1);
--			Set_XSCRIPT_Parameter(1,-1);
--			Set_XSCRIPT_ParamCount(2);
--		Send_XSCRIPT();
	elseif(g_FrameInfo == FrameInfoList.OPEN_IS_SELL_TO_RECSHOP) then
		if(Recycle_Bag_idx ~=nil and tonumber(Recycle_Bag_idx)>0) then
			PlayerShop:CancelSellItem2RecycleShop(Recycle_Bag_idx);
		end
	end

	this:Hide();


end

function MessageBox_Self_Help()
	if( g_FrameInfo == FrameInfoList.NET_CLOSE_MESSAGE ) then
		Helper:GotoHelper( "61" );
	else
		Helper:GotoHelper("*MessageBox_Self");
	end
end