--说明，在这个lua里头，只能添加来自其他玩家的消息会直接在
--      玩家的界面中直接弹出要求确认对话框的情况

--1、系统提示
--2、拉人技能
--3、队员邀请某人加入队伍请你（队长）同意
--4、队长邀请进入组队跟随模式


g_InitiativeClose = 0;

local g_FrameInfo
local STALL_RENT_FRAME			= 1;
local DISCARD_ITEM_FRAME		= 2;
local CANNT_DISCARD_ITEM		= 3;
local TEAM_ASKJOIN					= 4;	--有人邀请你加入队伍
local TEAM_MEMBERINVERT			= 5;	--队员邀请某人加入队伍请求你同意
local TEAM_SOMEASK					= 6;	--某人申请加入队伍
local TEAM_FOLLOW		 				= 7;	--进入组队跟随模式
local FRAME_AFFIRM_SHOW 		= 8;	--进入放弃任务确认模式
local GUILD_CREATE_CONFIRM	= 9; 	--帮会创建确认模式
local SYSTEM_TIP_INFO 			= 10; --系统提示对话框模式
local GUILD_QUIT_CONFIRM 		= 11; --帮会退出确认模式
local GUILD_DESTORY_CONFIRM = 12; --帮会删除确认模式
local CALL_OF								= 13;	--拉人
local INVITE_RIDE						= 14;  --请求双骑
local Quest_Number;

--===============================================
-- OnLoad()
--===============================================
function MessageBox_Other_PreLoad()

	this:RegisterEvent("OPEN_SYSTEM_TIP_INFO_DLG");
	--this:RegisterEvent("OPEN_CALLOF_PLAYER");
		
	-- 有人邀请你加入队伍
	this:RegisterEvent("SHOW_TEAM_YES_NO");
	-- 队员邀请某人加入队伍请你同意.
	--this:RegisterEvent("TEAM_MEMBER_INVITE");
	-- 某人申请加入队伍.
	this:RegisterEvent("TEAM_APPLY");
	-- 队长邀请进入组队跟随模式
	this:RegisterEvent("TEAM_FOLLOW_INVITE");
	
	this:RegisterEvent("RECIVE_RIDE");
end

function MessageBox_Other_OnLoad()
	-- 隐藏中间的按钮
	MessageBox_Other_Info_Button:Hide();
		
end

--===============================================
-- OnEvent()
--===============================================
function MessageBox_Other_OnEvent(event)

	-- 人有邀请你加入队伍
	if ( event == "SHOW_TEAM_YES_NO" ) then

		g_FrameInfo = TEAM_ASKJOIN;
		MessageBox_Other_Text:SetText(arg0.."Xin m秈 c醕 h� gia nh nh髆");
		this:Show();
		MessageBox_Other_Show_single_Info( 0 );
		g_InitiativeClose = 0;

	-- 队员邀请某人加入队伍请你同意
	elseif ( event == "TEAM_MEMBER_INVITE" ) then

		g_FrameInfo = TEAM_MEMBERINVERT;
		MessageBox_Other_Text:SetText(arg0.."Xin m秈 " .. arg1 .. "Gia nh nh髆, 鸢ng � kh鬾g?");
		this:Show();
		MessageBox_Other_Show_single_Info( 0 );
		g_InitiativeClose = 0;

	-- 某人申请加入队伍
	elseif ( event == "TEAM_APPLY" ) then

		g_FrameInfo = TEAM_SOMEASK;
		MessageBox_Other_Text:SetText(arg0.."M秈 gia nh nh髆, 鸢ng � kh鬾g?");
		this:Show();
		MessageBox_Other_Show_single_Info( 0 );
		g_InitiativeClose = 0;

	-- 队长邀请进入组队跟随模式
	elseif ( event == "TEAM_FOLLOW_INVITE" ) then

		g_FrameInfo = TEAM_FOLLOW;
		AxTrace( 0, 0, "械i tr叻ng m秈 gia nh m� h靚h 鸬i t鵼 t鵱g" );
		MessageBox_Other_Text:SetText(arg0.." hy v鱪g c醕 h� c鵱g nh髆, 鸢ng � kh鬾g?");
		this:Show();
		MessageBox_Other_Show_single_Info( 0 );
		g_InitiativeClose = 0;

	-- 提示系统信息。
	elseif( event == "OPEN_SYSTEM_TIP_INFO_DLG" ) then
	
		-- 显示系统信息。
		MessageBox_Other_Show_single_Info(1);
		MessageBox_Other_Text:SetText(tostring(arg0));
		this:Show();
		
	elseif( event == "OPEN_CALLOF_PLAYER" )   then 
		g_FrameInfo = CALL_OF;
		local szName = arg0;
		
		MessageBox_Other_Text:SetText(szName .. "K閛 b課, 鸢ng � kh鬾g?");
		this:Show();
		MessageBox_Other_Show_single_Info( 0 );
		g_InitiativeClose = 0;
	elseif( event == "RECIVE_RIDE" ) then
		g_FrameInfo = INVITE_RIDE;
		local szName = arg0;
		MessageBox_Other_Text:SetText(szName .. "M秈 c醕 h� c鵱g c咿i");	
		this:Show();
		MessageBox_Other_Show_single_Info( 0 );
		g_InitiativeClose = 0;
	end
	
	MessageBox_Other_UpdateFrame();

end

--===============================================
-- UpdateFrame
--===============================================
function MessageBox_Other_UpdateFrame()
	
	local nWidth, nHeight = MessageBox_Other_Text:GetWindowSize();
	local nTitleHeight = 36;
	local nBottomHeight = 75;
	nWindowHeight = nTitleHeight + nBottomHeight + nHeight;
	MessageBox_Other_Frame:SetProperty( "AbsoluteHeight", tostring( nWindowHeight ) );
end

--===============================================
-- 点击确定（IDOK）
--===============================================
function MessageBox_Other_OK_Clicked()
	
	if(g_FrameInfo == TEAM_ASKJOIN) then
		--0 人有邀请你加入队伍
		Player:AgreeJoinTeam();
		g_InitiativeClose = 1;
		this:Hide();

	elseif(g_FrameInfo == TEAM_MEMBERINVERT) then
		--1 某人申请加入队伍
		Player:SendAgreeJoinTeam_TeamMemberInvite();
		g_InitiativeClose = 1;
		this:Hide();

	elseif(g_FrameInfo == TEAM_SOMEASK) then
		--处理申请加入队伍
		Player:SendAgreeJoinTeam_Apply();
		g_InitiativeClose = 1;
		this:Hide(); 

	elseif(g_FrameInfo == TEAM_FOLLOW) then
		--队长邀请进入组队跟随模式
		Player:SendAgreeTeamFollow();
		g_InitiativeClose = 1;
		this:Hide();

	elseif(g_FrameInfo == CALL_OF)  then
		Friend:CallOf("ok");
		this:Hide();
	elseif( g_FrameInfo == INVITE_RIDE ) then
		AcceptRide(1);
		this:Hide();
	end
	
	this:Hide();
	g_FrameInfo = 0;
end

--===============================================
-- 放弃摆摊(IDCONCEL)
--===============================================
function MessageBox_Other_Cancel_Clicked()
	
	-- 隐藏消息按钮2006－3－27
	MessageBox_Other_Show_single_Info(0);
	
	if(g_InitiativeClose == 1)  then
		return;
	end

	if ( g_FrameInfo == TEAM_ASKJOIN ) then 
		--通知解除锁定
		Player:RejectJoinTeam();

	elseif ( g_FrameInfo == TEAM_MEMBERINVERT ) then 
		--处理有人邀请你加入队伍
		Player:SendRejectJoinTeam_TeamMemberInvite();

	elseif ( g_FrameInfo == TEAM_SOMEASK ) then 
		--处理申请加入队伍
		Player:SendRejectJoinTeam_Apply();

	elseif ( g_FrameInfo == TEAM_FOLLOW ) then 
		--队长邀请进入组队跟随模式
		Player:SendRefuseTeamFollow();
		
	elseif(g_FrameInfo == CALL_OF)  then
		Friend:CallOf("cancel");
	
	elseif( g_FrameInfo == INVITE_RIDE ) then
		AcceptRide(0);
		this:Hide();
	
	end
	

	this:Hide();
	g_FrameInfo = 0;
	
end



--------------------------------------------------------------------------------------------------------
--
-- 单一提示信息
--
function MessageBox_Other_Info_Clicked()

	-- 关闭信息对话框。
	MessageBox_Other_Show_single_Info(0);
	this:Hide();
end


function MessageBox_Other_Show_single_Info(bShow)

	if(1 == bShow) then
		MessageBox_Other_OK_Button:SetText( "Duy畉" );
		MessageBox_Other_Cancel_Button:SetText( "Hu�" );
		MessageBox_Other_OK_Button:Hide();
		MessageBox_Other_Info_Button:Show();
		MessageBox_Other_Cancel_Button:Hide();
		
	elseif(0 == bShow) then
		MessageBox_Other_OK_Button:SetText( "邪ng �" );
		MessageBox_Other_Cancel_Button:SetText( "C� tuy畉" );
		MessageBox_Other_OK_Button:Show();
		MessageBox_Other_Info_Button:Hide();
		MessageBox_Other_Cancel_Button:Show();
	end;


end;
