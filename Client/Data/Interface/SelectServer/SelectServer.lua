-------------------------------------------------------------------------------------------------------------
--
-- 全局变量
--
local g_LastServer = -1;
local g_LastArea   = -1;
local g_LastServerName = "";
local CriticalSpeed1 =250
local CriticalSpeed2 =500
local CriticalSpeed3 =1000

local CriticalSpeed =200; 
local CurPage = 0
local NetSpeed ={"#e010101T痗 鸬: #c4CFA4CT痶","#e010101T痗 鸬: #c4CFA4CB r祅","#e010101T痗 鸬: Ch遖 bi猼", "#e010101T痗 鸬 m課g: #cff0000T ngh╪" }
local PageSize = 12

-- 区域按钮的个数
local LOGIN_SERVER_AREA_COUNT = 24;
--目前有效的区域按钮个数，由于界面改动太大，怕以后有人又反悔，加这个变量，主要是不想去掉翻页代码。
local EFFECT_LOGIN_SERVER_AREA_COUNT = 12; 
-- 公测区域按钮的个数
local LOGIN_SERVER_TESTAREA_COUNT = 4;
-- 区域按钮
local g_BnArea = {};

-- 公测区域按钮
local g_BntestArea = {};

-- 当前选择的区域
local g_iCurSelArea = 0;
-- login server 客户端索引
local g_AreaIndex ={};
-- login server 名字
local g_AreaName = {};
-- login server 名字
local g_AreaDis = {};
-- testlogin server 客户端索引
local g_testAreaIndex ={};
-- login server 名字
local g_testAreaName = {};
-- login server 名字
local g_testAreaDis = {};
-- 当前选择的区域名字
local g_iCurSelAreaName;

--区域tips
local g_AreaTip = {};
local g_testAreaTip = {};

-- 选择的网络接入商
local g_iNetProvide = 0;					-- 0 : 电信
								-- 1 : 网通
								-- 2 : 其他
								-- 3：默认


--记载默认网络接入商。
local default_iNetProvide	=	1;

local g_idBackSound = -1;

-- 选择代理	tongxi ,注释掉
--local g_UseProxy = 0;
-- 记载推荐服务器的个数
local indexForCommendable = 1;
------------------------------------------------------------------------------
--
-- login server 信息
--

-- login server 的个数
--local LOGIN_SERVER_COUNT = 55;    -- modify by zchw 45-->55
local LOGIN_SERVER_COUNT = 45;    

local COMMENDABLE_LOGIN_SERVER_COUNT = 9;

-- login server 按钮
local g_BnLoginServer = {};
-- login server 状态
local g_LoginServerStatus = {};
-- login server 名字
local g_LoginServerName = {};
-- login server 推荐等级
local g_LoginServerCommendableLevel = {};
-- login server 是否新开
local g_LoginServerIsNew = {};



-- 推荐服务器按钮
local g_CommendableBnLoginServer = {};
-- 推荐服务器名字
local g_CommendableLoginServerName = {};
-- 推荐服务器Index
local g_CommendableLoginServerServerIndex = {};
-- 推荐服务器区域Index
local g_CommendableLoginServerAreaIndex = {};
-- 推荐服务器推荐等级
local g_CommendableLoginServerCommendableLevel = {};
-- 推荐服务器是否新服
local g_CommendableLoginServerIsNew = {};
-- 推荐服务器 状态
local g_CommendableLoginServerStatus = {};



-------------------------------------------------------------------------------
--
-- 其他信息
--

-- 当前选择的login server
local g_iCurSelLoginServer = -1;
-- 当前选择的推荐login server index
local g_iCurComSelLoginServer = -1;

-- 区域的个数
local g_iCurAreaCount = 0;
--公测区域个数
local g_iCurTestAreaCount = 0;

local g_FirstLogin = 1;


local StatMax = 10;

-------------------------------------------------------------------------------------------------------------
--
-- 函数区.
--
--

-- 注册onLoad事件
function LoginSelectServer_PreLoad()
	-- 打开选择服务器界面
	this:RegisterEvent("GAMELOGIN_OPEN_SELECT_SERVER");

	-- 选择区域
	this:RegisterEvent("GAMELOGIN_CLOSE_SELECT_SERVER");

	-- 打开选择服务器界面
	this:RegisterEvent("GAMELOGIN_SELECT_AREA");

	-- 选择login
	this:RegisterEvent("GAMELOGIN_SELECT_LOGINSERVER");

	-- 选择是否使用代理
	this:RegisterEvent("GAMELOGIN_SELECT_USEPROXY");

	-- 注册选择一个login server事件
	this:RegisterEvent("GAMELOGIN_SELECT_LOGIN_SERVER");

	-- 玩家进入场景
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	--ping结果
	this:RegisterEvent("PING_RESAULT");
	--上次登录的服务器
	this:RegisterEvent("GAMELOGIN_LASTSELECT_AREA_AND_SERVER");
	
end

function LoginSelectServer_OnLoad()
	
	-- 得到区域按钮
	g_BnArea[1] = SelectServer_Subarea1;
	g_BnArea[2] = SelectServer_Subarea2;
	g_BnArea[3] = SelectServer_Subarea3;
	g_BnArea[4] = SelectServer_Subarea4;
	g_BnArea[5] = SelectServer_Subarea5;
	g_BnArea[6] = SelectServer_Subarea6;
	g_BnArea[7] = SelectServer_Subarea7;
	g_BnArea[8] = SelectServer_Subarea8;
	g_BnArea[9] = SelectServer_Subarea9;
	g_BnArea[10] = SelectServer_Subarea10;
	g_BnArea[11] = SelectServer_Subarea11;
	g_BnArea[12] = SelectServer_Subarea12;

	g_BnArea[13] = SelectServer_Subarea13;
	g_BnArea[14] = SelectServer_Subarea14;
	g_BnArea[15] = SelectServer_Subarea15;
	g_BnArea[16] = SelectServer_Subarea16;
	g_BnArea[17] = SelectServer_Subarea17;
	g_BnArea[18] = SelectServer_Subarea18;
	g_BnArea[19] = SelectServer_Subarea19;
	g_BnArea[20] = SelectServer_Subarea20;
	g_BnArea[21] = SelectServer_Subarea21;
	g_BnArea[22] = SelectServer_Subarea22;
	g_BnArea[23] = SelectServer_Subarea23;
	g_BnArea[24] = SelectServer_Subarea24;
	
	g_BntestArea[1] = SelectServer2_Subarea1;
	g_BntestArea[2] = SelectServer2_Subarea2;
	g_BntestArea[3] = SelectServer2_Subarea3;
	g_BntestArea[4] = SelectServer2_Subarea4;
	--g_BntestArea[5] = SelectServer2_Subarea5;
	--得到推荐服务器列表
	g_CommendableBnLoginServer[1] = SelectServer_Commendable_Subarea1;
	g_CommendableBnLoginServer[2] = SelectServer_Commendable_Subarea2;
	g_CommendableBnLoginServer[3] = SelectServer_Commendable_Subarea3;
	g_CommendableBnLoginServer[4] = SelectServer_Commendable_Subarea4;
	g_CommendableBnLoginServer[5] = SelectServer_Commendable_Subarea5;
	g_CommendableBnLoginServer[6] = SelectServer_Commendable_Subarea6;
	g_CommendableBnLoginServer[7] = SelectServer_Commendable_Subarea7;
	g_CommendableBnLoginServer[8] = SelectServer_Commendable_Subarea8;
	g_CommendableBnLoginServer[9] = SelectServer_Commendable_Subarea9;	

	
	local i;
	for i = 1, LOGIN_SERVER_AREA_COUNT do
		
	 	g_BnArea[i]:SetProperty("CheckMode", "1");
		
		g_AreaName[i] = "";
		g_AreaDis[i] = "";
		g_AreaTip[i] = "";
		g_testAreaTip[i] = "";
	end
	
	for i = 1,COMMENDABLE_LOGIN_SERVER_COUNT do
	 	-- Login server 按钮
		
	 	g_CommendableBnLoginServer[i]:SetProperty("CheckMode", "1");
		-- login server 名字
		g_CommendableLoginServerName[i] = "";
		--login server index
		g_CommendableLoginServerIndex[i]=-1;
	end
	-- 得到服务器按钮
	g_BnLoginServer[1] = SelectServer_Server1;
	g_BnLoginServer[2] = SelectServer_Server2;
	g_BnLoginServer[3] = SelectServer_Server3;
	g_BnLoginServer[4] = SelectServer_Server4;
	g_BnLoginServer[5] = SelectServer_Server5;
	g_BnLoginServer[6] = SelectServer_Server6;
	g_BnLoginServer[7] = SelectServer_Server7;
	g_BnLoginServer[8] = SelectServer_Server8;
	g_BnLoginServer[9] = SelectServer_Server9;
	g_BnLoginServer[10] = SelectServer_Server10;

	g_BnLoginServer[11] = SelectServer_Server11;
	g_BnLoginServer[12] = SelectServer_Server12;
	g_BnLoginServer[13] = SelectServer_Server13;
	g_BnLoginServer[14] = SelectServer_Server14;
	g_BnLoginServer[15] = SelectServer_Server15;
	g_BnLoginServer[16] = SelectServer_Server16;
	g_BnLoginServer[17] = SelectServer_Server17;
	g_BnLoginServer[18] = SelectServer_Server18;
	g_BnLoginServer[19] = SelectServer_Server19;
	g_BnLoginServer[20] = SelectServer_Server20;
	--
	g_BnLoginServer[21] = SelectServer_Server21;
	g_BnLoginServer[22] = SelectServer_Server22;
	g_BnLoginServer[23] = SelectServer_Server23;
	g_BnLoginServer[24] = SelectServer_Server24;
	g_BnLoginServer[25] = SelectServer_Server25;
	g_BnLoginServer[26] = SelectServer_Server26;
	g_BnLoginServer[27] = SelectServer_Server27;
	g_BnLoginServer[28] = SelectServer_Server28;
	g_BnLoginServer[29] = SelectServer_Server29;
	g_BnLoginServer[30] = SelectServer_Server30;
	g_BnLoginServer[31] = SelectServer_Server31;
	g_BnLoginServer[32] = SelectServer_Server32;
	g_BnLoginServer[33] = SelectServer_Server33;
	g_BnLoginServer[34] = SelectServer_Server34;
	g_BnLoginServer[35] = SelectServer_Server35;
  --
	g_BnLoginServer[36] = SelectServer_Server36;
	g_BnLoginServer[37] = SelectServer_Server37;
	g_BnLoginServer[38] = SelectServer_Server38;
	g_BnLoginServer[39] = SelectServer_Server39;
	g_BnLoginServer[40] = SelectServer_Server40;
	g_BnLoginServer[41] = SelectServer_Server41;
	g_BnLoginServer[42] = SelectServer_Server42;
	g_BnLoginServer[43] = SelectServer_Server43;
	g_BnLoginServer[44] = SelectServer_Server44;
	g_BnLoginServer[45] = SelectServer_Server45;
	--
	---- add by zchw
	--g_BnLoginServer[46] = SelectServer_Server46;
	--g_BnLoginServer[47] = SelectServer_Server47;
	--g_BnLoginServer[48] = SelectServer_Server48;
	--g_BnLoginServer[49] = SelectServer_Server49;
	--g_BnLoginServer[50] = SelectServer_Server50;
	--g_BnLoginServer[51] = SelectServer_Server51;
	--g_BnLoginServer[52] = SelectServer_Server52;
	--g_BnLoginServer[53] = SelectServer_Server53;
	--g_BnLoginServer[54] = SelectServer_Server54;
	--g_BnLoginServer[55] = SelectServer_Server55;
	
		
	for i = 1, LOGIN_SERVER_COUNT do
	 	-- Login server 按钮
	 	g_BnLoginServer[i]:SetProperty("CheckMode", "1");

		-- login server 状态
		g_LoginServerStatus[i] = 0;

		-- login server 名字
		g_LoginServerName[i] = "";
		
		g_LoginServerCommendableLevel[i]="";
	end
	-- 隐藏所有推荐服务器
	HideAllCommendableBn();	
	-- 得到服务器信息
	LoginSelectServer_GetServerInfo();

	-- 得到推荐的服务器

	-- 典型提供商
	SelectServer_Line1:SetProperty("CheckMode", "1");
	SelectServer_Line2:SetProperty("CheckMode", "1");
	SelectServer_Line3:SetProperty("CheckMode", "1");
	SelectServer_Line4:SetProperty("CheckMode", "1");

	-- 网络服务商按钮.
	SelectServer_Line1:SetText("衖畁 t韓");
	SelectServer_Line2:SetText("M課g internet");
	SelectServer_Line3:SetText("M課g gi醥 d鴆");

	--童喜 添加默认按钮
	SelectServer_Line4:SetText("M 鸶nh");

	local strNormalColor = "#cFFF263";
	SelectServer_Help_Text1:SetText(	strNormalColor.."#e010101#cff0000婿: 啸y#cffffff" );
	SelectServer_Help_Text2:SetText(	strNormalColor.."#e010101#cECE58DNh誸: T痶#cffffff" );
	SelectServer_Help_Text3:SetText(	strNormalColor.."#e010101#c959595X醡: B鋙 d咿ng#cffffff" );
	SelectServer_Help_Text4:SetText(	strNormalColor.."#e010101#cff8a00Da cam: S 馥y#cffffff" );
	SelectServer_Help_Text5:SetText(	strNormalColor.."#e010101#c4CFA4CXanh l�: C馽 t痶#cffffff" );


	-- 打开界面
	SelectServer_Frame:SetProperty("AlwaysOnTop", "True");

	-- 先隐藏所有按钮。
	HideAreaBn();
	-- 先隐藏所有按钮。
	HideTestAreaBn();


end

function HideAllCommendableBn()
	for i = 1,COMMENDABLE_LOGIN_SERVER_COUNT do
		g_CommendableBnLoginServer[i]:Hide();
	end;
end
--是否自动把选择的服务器序号变成0，防止.txt文件有大的变动
local autoZero = 0;
-- OnEvent
function LoginSelectServer_OnEvent(event)

	if( event == "GAMELOGIN_OPEN_SELECT_SERVER" ) then

		this:Show();

		-- 显示存在的区域按钮。
		ShowAreaBn();
		ShowTestAreaBn();
		--显示上下翻页
		UpdateUpAddDownButton();

		-- 播放背景音乐
		if(g_idBackSound == -1) then
			g_idBackSound = Sound:PlaySound(113, true);
		end
		
		--if( 1 == g_FirstLogin ) then
           -- GameProduceLogin:ShowMessageBox( "    目前只开放了一台网通服务器用于测试，如果您是电信的用户，请在服务器选择界面的右边选择“电信”进行登录，这样才能使用互联互通功能以保证您的连接速度。", "OK", "1" );
		    --g_FirstLogin = 0
		--end
		
		return;
	end


	-- 关闭界面
	if( event == "GAMELOGIN_CLOSE_SELECT_SERVER") then

		this:Hide();
		return;
	end

	-- 选择一个login server
	if( event == "GAMELOGIN_SELECT_LOGIN_SERVER") then
		local num = tonumber(arg0);
		for aindex = 1,g_iCurAreaCount do 
			if(num == g_AreaIndex[aindex]) then
				CurPage = math.floor((aindex-1)/PageSize);
				ShowPage();
				SelectServer_SelectAreaServer(aindex - CurPage*PageSize -1);
				SelectServer_SelectLoginServer(tonumber(arg1),1);
			return;
			end	
		end
		for bindex = 1,g_iCurTestAreaCount do
			if(num == g_testAreaIndex[bindex]) then
				SelectServer_SelectTestAreaServer(bindex-1);
				SelectServer_SelectLoginServer(tonumber(arg1),1);
				return;
			end
		end
		return;
	end

	-- 选择区域
	if( event == "GAMELOGIN_SELECT_AREA") then
		autoZero = 0;

		local num = tonumber(arg0);
		for aindex = 1,g_iCurAreaCount do 
			if(num == g_AreaIndex[aindex]) then
				CurPage = math.floor((aindex-1)/PageSize);
				ShowPage();
				SelectServer_SelectAreaServer(aindex - CurPage*PageSize -1);
				return;
			end	
		end
		for bindex = 1,g_iCurTestAreaCount do
			if(num == g_testAreaIndex[bindex]) then
				SelectServer_SelectTestAreaServer(bindex-1);
				return;
			end
		end
		--完全没有找到，说明文件有了大的变化
		CurPage = 0;
		autoZero = 1;
		SelectServer_SelectAreaServer(1 - CurPage*PageSize -1);
		return;
	end;

	-- 选择login
	if( event == "GAMELOGIN_SELECT_LOGINSERVER") then
		if ( g_BnLoginServer[tonumber(arg0)+1]:GetProperty("Disabled")=="False") then
			if(autoZero == 0 )then
				SelectServer_SelectLoginServer(tonumber(arg0),0);	
			else
				SelectServer_SelectLoginServer(0,0);	
				autoZero = 0;
			end	
		end;
		return;
	end;

	-- 使用代理
	--童喜
	if( event == "GAMELOGIN_SELECT_USEPROXY" ) then
		if tonumber(arg0) == 1 then
			--SelectServer_Deputize:SetCheck(1)
			SelectServer_SelectLine2();
		elseif tonumber(arg0) == 0 then
			--SelectServer_Deputize:SetCheck(0)
			SelectServer_SelectLine1();
		elseif tonumber(arg0) == 2 then
			SelectServer_SelectLine3();
		else
			SelectServer_SelectLine4();
		end
	
		return;
	end;
	
	-- 进入场景，停止背景音乐
	if( event == "PLAYER_ENTERING_WORLD") then
		if(g_idBackSound ~= -1) then
			Sound:StopSound(g_idBackSound);
			g_idBackSound = -1;
		end
	end
	--ping结果
	if(event == "PING_RESAULT")then
		local num = tonumber(arg0)
		if(num ~=nil)then
			if(num>=0)then
				if(num<=CriticalSpeed)then
					SelectServer_Text2:SetText(NetSpeed[1]);
				elseif( num<=CriticalSpeed2 ) then
				    SelectServer_Text2:SetText(NetSpeed[2]);
				elseif( num<=CriticalSpeed3 ) then
				    SelectServer_Text2:SetText(NetSpeed[4]);
				else
				    SelectServer_Text2:SetText(NetSpeed[3]);
				--else
				--	SelectServer_Text2:SetText(NetSpeed[2]);
				end
				SelectServer_Text2:SetToolTip("K閛 d鄆 th秈 gian m課g: "..num);
			else
				SelectServer_Text2:SetText(NetSpeed[3]);			
				SelectServer_Text2:SetToolTip("K閛 d鄆 th秈 gian m課g: ch遖 bi猼");			
			end
		end
	end

	--上次登录服务器
	if( event == "GAMELOGIN_LASTSELECT_AREA_AND_SERVER") then
		local numArea =-1;
		local numServer = -1;
		if(arg0~=nil)then
			numArea = tonumber(arg0);
			g_LastArea = numArea
		end
		if(arg1~=nil)then
			numServer = tonumber(arg1);
			g_LastServer = numServer
		end
		if(numArea ~= -1 and numServer~=-1)then
			local have = 0;
			for aindex = 1,g_iCurAreaCount do 
				if(numArea == g_AreaIndex[aindex]) then
					have = 1;
					break;
				end	
			end
			for bindex = 1,g_iCurTestAreaCount do
				if(numArea == g_testAreaIndex[bindex]) then
					have = 1;
					break;
				end
			end
			if(have == 1)then
				local tmpServerName= GameProduceLogin:GetAreaLoginServerInfo(numArea, numServer);
				g_LastServerName = tmpServerName;
				SelectServer_Server_Last:SetText(tmpServerName);
				SelectServer_Server_Last:Enable();
				if(g_iCurSelArea == g_LastArea and g_LastServer ==g_iCurSelLoginServer)then
					SelectServer_Server_Last:SetCheck(1);
				end
			else
				SelectServer_Server_Last:SetText("Kh鬾g");
				SelectServer_Server_Last:Disable();
			end
		else
			SelectServer_Server_Last:SetText("Kh鬾g");
			SelectServer_Server_Last:Disable();
		end
		return;
	end;
	

end

function SelectServer_SelectLastServer()
	if(g_LastArea ~=-1 and g_LastServer ~= -1)then
		for aindex = 1,g_iCurAreaCount do 
			if(g_LastArea == g_AreaIndex[aindex]) then
				CurPage = math.floor((aindex-1)/PageSize);
				ShowPage();
				SelectServer_SelectAreaServer(aindex - CurPage*PageSize -1);
				SelectServer_SelectLoginServer(g_LastServer,1);
				return;
			end	
		end
		for bindex = 1,g_iCurTestAreaCount do
			if(g_LastArea == g_testAreaIndex[bindex]) then
				SelectServer_SelectTestAreaServer(bindex-1);
				SelectServer_SelectLoginServer(g_LastServer,1);
				return;
			end
		end

	end
end

--------------------------------------------------------------------------------------------------------------
--
-- 得到服务器信息
--

function LoginSelectServer_GetServerInfo()

	 	local iCurAreaCount = GameProduceLogin:GetServerAreaCount();
	 	local strAreaName = "Kh鬾g c� m醳 ch� ph鴆 v�";
		local iLoginServerCount = -1;
		local ServerName;
		local ServerStatus;
		--推荐等级
		local RecommendLevel; 
		local IsNew;
		indexForCommendable = 0;
		local testindex = 0;
		local nomalindex =0;
		local tuijian=0;
	 	for index = 0, iCurAreaCount - 1 do
			tuijian =0;
			if(testindex>=LOGIN_SERVER_TESTAREA_COUNT and nomalindex>=EFFECT_LOGIN_SERVER_AREA_COUNT) then
				break;
			end
			local areaname = GameProduceLogin:GetServerAreaName(index);
	 		-- 得到区域名字.
			local i = string.find(areaname,"-");
			if(i~=nil and i<string.len(areaname)) then
				if(string.sub(areaname,1,i-1)=="M課g internet" and testindex<LOGIN_SERVER_TESTAREA_COUNT)then
					testindex = testindex +1;
					g_testAreaName[testindex] = string.sub(areaname,i+1);
					g_testAreaDis[testindex] = GameProduceLogin:GetServerAreaDis(index);
					g_testAreaIndex[testindex] = index;
					tuijian = 1;
					g_testAreaTip[testindex] = GameProduceLogin:GetServerAreaDis(index);
				elseif(string.sub(areaname,1,i-1)=="C鬾g tr" and nomalindex< EFFECT_LOGIN_SERVER_AREA_COUNT) then
					nomalindex = nomalindex +1;
	 				g_AreaName[nomalindex] = string.sub(areaname,i+1);
					g_AreaDis[nomalindex] = GameProduceLogin:GetServerAreaDis(index);
					g_AreaIndex[nomalindex] = index;
					tuijian = 1;
					g_AreaTip[nomalindex] = GameProduceLogin:GetServerAreaDis(index);
				end
			elseif(nomalindex< EFFECT_LOGIN_SERVER_AREA_COUNT) then
				nomalindex = nomalindex +1;
	 			g_AreaName[nomalindex] = GameProduceLogin:GetServerAreaName(index);
				g_AreaDis[nomalindex] = GameProduceLogin:GetServerAreaDis(index);
				g_AreaIndex[nomalindex] = index;
				tuijian = 1;
				g_AreaTip[nomalindex] = GameProduceLogin:GetServerAreaDis(index);
			end;
	 		-- 设置名字.
			iLoginServerCount = GameProduceLogin:GetAreaLoginServerCount(index);
			if(iLoginServerCount > LOGIN_SERVER_COUNT) then
				iLoginServerCount=LOGIN_SERVER_COUNT;
			end
			--得到推荐服务器列表
			if(tuijian==1)then 
				for i=0,iLoginServerCount-1 do
					if(indexForCommendable>=COMMENDABLE_LOGIN_SERVER_COUNT) then
							break;
					end;
					ServerName,
					ServerStatus,
					--ServerID,
					--AreaID,
					RecommendLevel,
					IsNew
						= GameProduceLogin:GetAreaLoginServerInfo(index, i);
						-- 推荐服务器id
					if(RecommendLevel>0 and indexForCommendable <COMMENDABLE_LOGIN_SERVER_COUNT and ServerStatus ~= StatMax) then
						indexForCommendable = indexForCommendable + 1;
						g_CommendableLoginServerName[indexForCommendable] = ServerName;
						g_CommendableLoginServerServerIndex[indexForCommendable] = i;
						g_CommendableLoginServerAreaIndex[indexForCommendable] = index;
						g_CommendableLoginServerCommendableLevel[indexForCommendable] = RecommendLevel;
						g_CommendableLoginServerIsNew[indexForCommendable] = IsNew;
						g_CommendableLoginServerStatus[indexForCommendable] = ServerStatus;

					end;			
				end
			end;
	 	end
		if(indexForCommendable>=1)then
			SortCommendableLoginServer();
			
			local strName="";
			for i = 1,indexForCommendable do
				g_CommendableBnLoginServer[i]:Show();
				local tmpAreaName = GameProduceLogin:GetServerAreaName(g_CommendableLoginServerAreaIndex[i]);
				local _i = string.find(tmpAreaName,"-");
				if(_i~=nil and _i<string.len(tmpAreaName)) then
					if(string.sub(tmpAreaName,1,_i-1)=="C鬾g tr" or string.sub(tmpAreaName,1,_i-1)=="M課g internet")then
						tmpAreaName = string.sub(tmpAreaName,_i+1);
					end
				end
				strName =tmpAreaName.."-"..g_CommendableLoginServerName[i];								
				if(g_CommendableLoginServerIsNew[i]~=0)then
					strName =strName.."(M緄)";
				end
				if(0 == g_CommendableLoginServerStatus[i]) then
					strName = "#cff0000#e010101"..strName.."#cffffff";
				elseif(1 == g_CommendableLoginServerStatus[i]) then

					strName = "#cff8a00#e010101"..strName.."#cffffff";
				elseif(2 == g_CommendableLoginServerStatus[i]) then

					strName = "#cECE58D#e010101"..strName.."#cffffff";
				elseif(3 == g_CommendableLoginServerStatus[i]) then

					strName = "#c4CFA4C#e010101"..strName.."#cffffff";
				else

					strName = "#c959595#e010101"..strName.."#cffffff";
					g_CommendableBnLoginServer[i]:Disable();
				end				
			
				g_CommendableBnLoginServer[i]:SetText(strName);
				g_CommendableBnLoginServer[i]:SetCheck(0);
			end;
		end;
		g_iCurAreaCount =nomalindex ;
		g_iCurTestAreaCount = testindex;
end

--排序列，从小到大
function SortCommendableLoginServer()

	local TotalCount = indexForCommendable;
	local tmp ;
	local p=0;
	for j = 1 , TotalCount -1 do
		for i=1, TotalCount-j do
			if(g_CommendableLoginServerCommendableLevel[i]>g_CommendableLoginServerCommendableLevel[i+1]) then
				tmp = g_CommendableLoginServerCommendableLevel[i];
				g_CommendableLoginServerCommendableLevel[i] = g_CommendableLoginServerCommendableLevel[i+1];
				g_CommendableLoginServerCommendableLevel[i+1] = tmp;

				tmp = g_CommendableLoginServerName[i];
				g_CommendableLoginServerName[i] = g_CommendableLoginServerName[i+1];
				g_CommendableLoginServerName[i+1] = tmp;			
				
				tmp = g_CommendableLoginServerServerIndex[i];
				g_CommendableLoginServerServerIndex[i] = g_CommendableLoginServerServerIndex[i+1];
				g_CommendableLoginServerServerIndex[i+1] = tmp;	

				tmp = g_CommendableLoginServerAreaIndex[i];
				g_CommendableLoginServerAreaIndex[i] = g_CommendableLoginServerAreaIndex[i+1];
				g_CommendableLoginServerAreaIndex[i+1] = tmp;	

				tmp = g_CommendableLoginServerIsNew[i];
				g_CommendableLoginServerIsNew[i] = g_CommendableLoginServerIsNew[i+1];
				g_CommendableLoginServerIsNew[i+1] = tmp;	
				
				tmp = g_CommendableLoginServerStatus[i];
				g_CommendableLoginServerStatus[i] = g_CommendableLoginServerStatus[i+1];
				g_CommendableLoginServerStatus[i+1] = tmp;
			end
		end;
	end;
end;
--------------------------------------------------------------------------------------------------------------
--
-- 选择一个公测区域
--
function SelectServer_SelectTestAreaServer(index)
	-- 记录当前选择的区域索引.	
	g_iCurSelArea = g_testAreaIndex[index+1];

	-- 设置选择的名字
	g_iCurSelAreaName = g_testAreaName[index+1];

	-- 设置按钮选中状态.
	g_BntestArea[index+1]:SetCheck(1);

	-- 隐藏区域按钮.
	SelectServer_HideLoginServerBn();

	-- 得到login server的信息
	local iLoginServerCount = GameProduceLogin:GetAreaLoginServerCount(g_iCurSelArea);

	if(iLoginServerCount > LOGIN_SERVER_COUNT) then
		iLoginServerCount=LOGIN_SERVER_COUNT;
	end
	for indexLoginServer = 0, iLoginServerCount - 1 do	
		SelectServer_GetAndShowLoginServer(indexLoginServer);
	end
	for iArea = 1, g_iCurAreaCount do	
		g_BnArea[iArea]:SetCheck(0);
	end
	DisableSelect();
end
--------------------------------------------------------------------------------------------------------------
--
-- 选择一个区域
--
function SelectServer_SelectAreaServer(index)

	-- 记录当前选择的区域索引.	
	g_iCurSelArea = g_AreaIndex[index+CurPage*PageSize+1];

	-- 设置选择的名字
	g_iCurSelAreaName = g_AreaName[index+CurPage*PageSize+1];

	-- 设置按钮选中状态.
	g_BnArea[index+1]:SetCheck(1);

	-- 隐藏区域按钮.
	SelectServer_HideLoginServerBn();

	-- 得到login server的信息
	local iLoginServerCount = GameProduceLogin:GetAreaLoginServerCount(g_iCurSelArea);

	if(iLoginServerCount > LOGIN_SERVER_COUNT) then
		iLoginServerCount=LOGIN_SERVER_COUNT;
	end
	for indexLoginServer = 0, iLoginServerCount - 1 do	
		SelectServer_GetAndShowLoginServer(indexLoginServer);
	end
	for itestArea = 1, g_iCurTestAreaCount do	
		g_BntestArea[itestArea]:SetCheck(0);
	end
	DisableSelect();
end

function DisableSelect()
		g_iCurSelLoginServer =-1;
		g_iCurComSelLoginServer = -1;
		for i = 1,indexForCommendable do
				g_CommendableBnLoginServer[i]:SetCheck(0)		
		end;
		NotFlashAll();
		SelectServer_Text2:SetToolTip("");
		SelectServer_Text1:SetText("");
		SelectServer_Text2:SetText("");
		SelectServer_Text3:SetText("");
		--SelectServer_Accept:Disable();
end
--function EnableSelect()
--		SelectServer_Accept:Enable();
--end
--------------------------------------------------------------------------------------------------------------
--
-- 从推荐列表里选择一个login server
--
--------------------------------------------------------------------------------------------------------------
function Commendable_SelectLoginServer(index)
	-- 设置按钮选中状态.
	if(g_CommendableBnLoginServer[index]:GetProperty("Disabled")=="True") then
		return;
	end
	
	g_iCurComSelLoginServer = index;

	g_CommendableBnLoginServer[index]:SetCheck(1);

	local strLoginServerStatus = "???";
	
	if(0 == g_CommendableLoginServerStatus[index]) then

		strLoginServerStatus = "#e010101#cff0000啸y#cffffff";
	elseif(1 == g_CommendableLoginServerStatus[index]) then

		strLoginServerStatus = "#e010101#cff8a00S 馥y#cffffff";
	elseif(2 == g_CommendableLoginServerStatus[index]) then

		strLoginServerStatus = "#e010101#cECE58DT痶#cffffff";
	elseif(3 == g_CommendableLoginServerStatus[index]) then

		strLoginServerStatus = "#e010101#c4CFA4CC馽 t痶#cffffff";
	else

		strLoginServerStatus = "#e010101#c959595B鋙 d咿ng#cffffff";
	end
	
	i = g_CommendableLoginServerAreaIndex[index]
	SelectServer_ShowServerInfo(g_AreaName[i+1].."  "..g_CommendableLoginServerName[index], "", strLoginServerStatus);
	--同时更新下面的服务器和server
	g_iCurSelArea = g_CommendableLoginServerAreaIndex[index];
	for aindex = 1,g_iCurAreaCount do 
		if(g_iCurSelArea == g_AreaIndex[aindex]) then
			AxTrace(0,2,"5" )
			CurPage = math.floor((aindex-1)/PageSize);
			ShowPage();
			SelectServer_SelectAreaServer(aindex - CurPage*PageSize -1);
			SelectServer_SelectLoginServer(g_CommendableLoginServerServerIndex[index],1);
			return;
		end	
	end
	for bindex = 1,g_iCurTestAreaCount do
		if(g_iCurSelArea == g_testAreaIndex[bindex]) then
			SelectServer_SelectTestAreaServer(bindex-1);
			SelectServer_SelectLoginServer(g_CommendableLoginServerServerIndex[index],1);
			return;
		end
	end
end;
--
-- 选择一个login server
--
function SelectServer_SelectLoginServer(index,flash)
	if(g_BnLoginServer[index+1]:GetProperty("Disabled")=="True") then
		return;
	end
	
	GameProduceLogin:SetPingServer(g_iCurSelArea,index);
	--EnableSelect();
	-- 记录当前选择的login server
	g_iCurSelLoginServer = index;

	if(g_LastServer == g_iCurSelLoginServer and g_LastArea == g_iCurSelArea)then
		SelectServer_Server_Last:SetCheck(1);
	else
		SelectServer_Server_Last:SetCheck(0);
	end
	
	if(flash==1)then
		g_BnLoginServer[index+1]:FlashMe(1);
	else
		NotFlashAll();
	end
	-- 设置按钮选中状态.
	g_BnLoginServer[index+1]:SetCheck(1);
	local strLoginServerStatus = "???";

	if(0 == g_LoginServerStatus[index+1]) then

		strLoginServerStatus = "#e010101#cff0000啸y#cffffff";
	elseif(1 == g_LoginServerStatus[index+1]) then

		strLoginServerStatus = "#e010101#c9E5705S 馥y#cffffff";
	elseif(2 == g_LoginServerStatus[index+1]) then

		strLoginServerStatus = "#e010101#cECE58DT痶#cffffff";
	elseif(3 == g_LoginServerStatus[index+1]) then

		strLoginServerStatus = "#e010101#c4CFA4CC馽 t痶#cffffff";
	else

		strLoginServerStatus = "#e010101#c959595B鋙 d咿ng#cffffff";
	end

	-- 设置信息
	SelectServer_ShowServerInfo(g_iCurSelAreaName.."  "..g_LoginServerName[index+1], "", strLoginServerStatus);

	--更新推荐服务器
	local tmpNum = 0
	--if(g_LoginServerCommendableLevel[index+1]>0) then
		for i = 1,indexForCommendable do
			if(g_CommendableLoginServerAreaIndex[i] == g_iCurSelArea and g_CommendableLoginServerServerIndex[i] == g_iCurSelLoginServer)then
				g_iCurComSelLoginServer = i;
				g_CommendableBnLoginServer[i]:SetCheck(1)
			else
				tmpNum = tmpNum+1;
				g_CommendableBnLoginServer[i]:SetCheck(0)	
			end;			
		end;
		if tmpNum>=indexForCommendable then
			g_iCurComSelLoginServer = -1
		end;
	--else 
	--	g_iCurComSelLoginServer = -1;
	--end;

end

function NotFlashAll()
	for i=1,LOGIN_SERVER_COUNT do
		g_BnLoginServer[i]:FlashMe(0);
		g_BnLoginServer[i]:SetCheck(0);
	end
end
--------------------------------------------------------------------------------------------------------------
--
-- 得到一个login server信息并显示
--
function SelectServer_GetAndShowLoginServer(index)

	g_LoginServerName[index+1]
	,g_LoginServerStatus[index+1]
	,g_LoginServerCommendableLevel[index+1]
	,g_LoginServerIsNew[index+1]
	= GameProduceLogin:GetAreaLoginServerInfo(g_iCurSelArea, index);
	g_BnLoginServer[index+1]:Enable();
	g_BnLoginServer[index+1]:Show();
	if(g_LoginServerStatus[index+1] == StatMax) then
		g_BnLoginServer[index+1]:Hide();
		return;
	end
	local strName = g_LoginServerName[index+1];

	if(g_LoginServerIsNew[index+1]==1)then
		strName = strName.."(M緄)";
	end;

	if(0 == g_LoginServerStatus[index+1]) then

		strName = "#cff0000#e010101"..strName.."#cffffff";
	elseif(1 == g_LoginServerStatus[index+1]) then

		strName = "#cff8a00#e010101"..strName.."#cffffff";
	elseif(2 == g_LoginServerStatus[index+1]) then

		strName = "#cECE58D#e010101"..strName.."#cffffff";
	elseif(3 == g_LoginServerStatus[index+1]) then

		strName = "#c4CFA4C#e010101"..strName.."#cffffff";
	else

		strName = "#c959595#e010101"..strName.."#cffffff";
		g_BnLoginServer[index+1]:Disable();
	end

	g_BnLoginServer[index+1]:SetText(strName);
	
	

end

--------------------------------------------------------------------------------------------------------------
--
-- 隐藏login server 按钮
--
function SelectServer_HideLoginServerBn()

	local index;
	for index = 1, LOGIN_SERVER_COUNT  do
 		g_BnLoginServer[index]:Hide();
 	end

end

--------------------------------------------------------------------------------------------------------------
--
-- 隐藏login server 按钮
--
function SelectServer_ShowServerInfo(ServerName, NetStatus, ServerStatus)
	SelectServer_Text2:SetToolTip("");
	SelectServer_Text1:SetText("#e010101M醳 ch�: #cFFFF00"..ServerName);
	SelectServer_Text2:SetText(NetStatus);
	SelectServer_Text3:SetText("#e010101Tr課g th醝: "..ServerStatus);

end

---------------------------------------------------------------------------------------------------------------
--
--  确定选择一个服务器
--
function SelectServer_SelectOk()

	-- 连接到login server
	--童喜，不使用代理,传入服务器供应商
	AxTrace(0,2,"g_iCurSelArea="..g_iCurSelArea )
	AxTrace(0,2,"g_iCurComSelLoginServer ="..g_iCurComSelLoginServer )
	AxTrace(0,2,"g_iCurSelLoginServer ="..g_iCurSelLoginServer )
	AxTrace(0,2,"\n")
	GameProduceLogin:SelectLoginServer(g_iCurSelArea, g_iCurSelLoginServer, g_iNetProvide);
	return;
end

---------------------------------------------------------------------------------------------------------------
--
--   自动选择一个服务器
--
function SelectServer_SelectAuto()
	GameProduceLogin:AutoSelLoginServer(g_iNetProvide);
end

---------------------------------------------------------------------------------------------------------------
--
--   退出游戏
--
function SelectServer_Exit()
	QuitApplication("quit");
end


---------------------------------------------------------------------------------------------------------------
--
-- 选择电信
--
function SelectServer_SelectLine1()

	-- 选择电信
	g_iNetProvide = 0;

	-- 选中电信
	SelectServer_Line1:SetCheck(1);
	SelectServer_Line2:SetCheck(0);
	SelectServer_Line3:SetCheck(0);

	--tongxi
	SelectServer_Line4:SetCheck(0)

end


---------------------------------------------------------------------------------------------------------------
--
-- 选择网通
--
function SelectServer_SelectLine2()

	-- 选择网通
	g_iNetProvide = 1;

	-- 选中网通
	SelectServer_Line1:SetCheck(0);
	SelectServer_Line2:SetCheck(1);
	SelectServer_Line3:SetCheck(0);

	--tongxi
	SelectServer_Line4:SetCheck(0);
end


---------------------------------------------------------------------------------------------------------------
--
-- 其他
--
function SelectServer_SelectLine3()

	-- 选择其他
	g_iNetProvide = 2;

	-- 选中其他
	SelectServer_Line1:SetCheck(0);
	SelectServer_Line2:SetCheck(0);
	SelectServer_Line3:SetCheck(1);
	--tongxi
	SelectServer_Line4:SetCheck(0);
end


---------------------------------------------------------------------------------------------------------------
--
-- 默认 tongxi
--
function SelectServer_SelectLine4()

	-- 选择默认
	g_iNetProvide = 3;

	-- 选中其他
	SelectServer_Line1:SetCheck(0);
	SelectServer_Line2:SetCheck(0);
	SelectServer_Line3:SetCheck(0);
	--tongxi
	SelectServer_Line4:SetCheck(1);
end

---------------------------------------------------------------------------------------------------------------
--
-- 鼠标进入推荐服务器
--
function Commendable_LoginServer_MouseEnter(index)

	SelectServer_Info:SetText(g_CommendableLoginServerName[index]..tostring(" M醳 ch� ph鴆 v�"));
end

---------------------------------------------------------------------------------------------------------------
--
-- 鼠标进入区域按钮
--
function SelectServer_LoginServer_MouseEnter(index)

	SelectServer_Info:SetText(g_LoginServerName[index+1]..tostring(" M醳 ch� ph鴆 v�"));
end

---------------------------------------------------------------------------------------------------------------
--
-- 鼠标进入区域按钮
--
function SelectServer_LastServer_MouseEnter()
	if(g_LastServerName~="") then
		SelectServer_Info:SetText(g_LastServerName..tostring(" M醳 ch� ph鴆 v�"));
	else
		SelectServer_Info:SetText("");
	end
end
---------------------------------------------------------------------------------------------------------------
--
-- 鼠标离开区域按钮
--
function SelectServer_LastServer_MouseLeave()

	SelectServer_Info:SetText("");
end
---------------------------------------------------------------------------------------------------------------
--
-- 鼠标离开区域按钮
--
function SelectServer_LoginServer_MouseLeave(index)

	SelectServer_Info:SetText("");
end
---------------------------------------------------------------------------------------------------------------
--
-- 鼠标公测区域 按钮
--
function SelectServer_TestArea_MouseEnter(index)

	SelectServer_Info:SetText(g_testAreaDis[index+1]);
end


---------------------------------------------------------------------------------------------------------------
--
-- 鼠标离开公测区域 按钮
--
function SelectServer_TestArea_MouseLeave(index)

	SelectServer_Info:SetText("");
end;


---------------------------------------------------------------------------------------------------------------
--
-- 鼠标进入login server 按钮
--
function SelectServer_Area_MouseEnter(index)

	SelectServer_Info:SetText(g_AreaDis[index+1]);
end


---------------------------------------------------------------------------------------------------------------
--
-- 鼠标离开login server 按钮
--
function SelectServer_Area_MouseLeave(index)

	SelectServer_Info:SetText("");
end;


function SelectServer_Accept_MouseEnter()

	SelectServer_Info:SetText("Nh v鄌 s� c� th� v鄌 c醕 c鴐 m醳 ch� 疸 ch鱪.");
end;

function SelectServer_MouseLeave()

	SelectServer_Info:SetText("");
end;

function SelectServer_Automatic_MouseEnter()

	SelectServer_Info:SetText("Gi鷓 疝 c醕 h� l馻 ch鱪 b� m醳 ph鴆 v� t痶 nh.");
end;


function SelectServer_Cancel_MouseEnter()

	SelectServer_Info:SetText("R秈 kh鰅 Thi阯 Long B醫 B�.");
end;



function SelectServer_MouseEnter_Line(index)

	if(1 == index) then

		SelectServer_Info:SetText("N猽 l� ti猵 nh 餴畁 t韓, m秈 ch鱪 餴琺 d呔i c鵱g \"L馻 ch鱪 t� 鸬ng\"");
		return;
	end

	if(2 == index) then

		SelectServer_Info:SetText("N猽 l� ti猵 nh mang internet, m秈 ch鱪 餴琺 d呔i c鵱g \"L馻 ch鱪 t� 鸬ng\"");
		return;
	end

	if(3 == index) then

		SelectServer_Info:SetText("N猽 l� ti猵 nh m課g gi醥 d鴆, m秈 ch鱪 餴琺 d呔i c鵱g \"L馻 ch鱪 t� 鸬ng\"");
		return;
	end

	if(4 == index) then
		SelectServer_Info:SetText("Ti猵 nh nh ng, m秈 th� 鸬ng l馻 ch鱪 1 b� m醳 ph鴆 v�");
		return;
	end
end


function HideTestAreaBn()
	local index;
	--SelectServer2_Commendable_Text:Hide();
	for index = 1, LOGIN_SERVER_TESTAREA_COUNT  do
 		g_BntestArea[index]:Hide();
 	end
end
function HideAreaBn()
	local index;
	for index = 1, LOGIN_SERVER_AREA_COUNT  do
 		g_BnArea[index]:Hide();
 	end
end
function ShowTestAreaBn()
	local index;
	local index1 = 1;
	if g_iCurTestAreaCount<=0 then return; end
	--SelectServer2_Commendable_Text:Show();
	for index = 1,LOGIN_SERVER_TESTAREA_COUNT  do
 		if(index <= g_iCurTestAreaCount) then		
			g_BntestArea[index1]:SetText(g_testAreaName[index]);
			g_BntestArea[index1]:SetToolTip(g_testAreaTip[index]);
			g_BntestArea[index1]:Show();
 		end;
		index1 = index1+1
 	end
end

function ShowAreaBn()
	local index;
	local index1 = 1;
	AxTrace(3,3,"g_iCurAreaCount="..g_iCurAreaCount )
	for index = CurPage*PageSize+1, (CurPage+1)*PageSize do
			
 		if(index <= g_iCurAreaCount) then		
			g_BnArea[index1]:SetText(g_AreaName[index]);
			g_BnArea[index1]:SetToolTip(g_AreaTip[index]);
			g_BnArea[index1]:Show();
 		end;
		index1 = index1+1
 	end
end


-- 双击选择一个服务器。
function SelectServer_ConfirmSelectLine(index)
	AxTrace(0,2,"7" )
	-- 选中一个login server
	SelectServer_SelectLoginServer(index,0);

	-- 确认选择一个服务器
	SelectServer_SelectOk();

end;
-- 双击选择一个服务器。
function SelectServer_LastConfirmSelectLine()

	-- 选中一个login server
	SelectServer_SelectLastServer();

	-- 确认选择一个服务器
	SelectServer_SelectOk();

end;
-- 双击选择一个服务器。
function Commendable_ConfirmSelectLine(index)
	-- 选中一个login server
	Commendable_SelectLoginServer(index);

	-- 确认选择一个服务器
	SelectServer_SelectOk();

end;

function SelectServer_PageUp()
	CurPage = CurPage - 1
	ShowPage()
	SelectServer_SelectAreaServer(0);

end

function SelectServer_PageDown()
	CurPage = CurPage + 1
	ShowPage()
	SelectServer_SelectAreaServer(0);
end;

function ShowPage()
	--更新翻页按钮
	--UpdateUpAddDownButton();
	--hide all
	--HideAreaBn();
	--show 
	--ShowAreaBn();
end;
function UpdateUpAddDownButton()
	--SelectServer_Subarea_PageUp:Hide();
	--SelectServer_Subarea_PageDown:Hide();
	--if(g_iCurAreaCount-CurPage*PageSize>PageSize)then
	--	SelectServer_Subarea_PageDown:Show()
	--end
	--if(CurPage>0)then
	--	SelectServer_Subarea_PageUp:Show()
	--end
end;

--申请帐号
function SelectServer_AccountReg()
--    GameProduceLogin:StartAccountReg()
  --GameProduceLogin:OpenURL( "http://www.tinhkiem.us/" )
end

--帐号充值
function SelectServer_AccountChongZhi()
	--if(Variable:GetVariable("System_CodePage") == "1258") then
   -- GameProduceLogin:OpenURL( "http://www.tinhkiem.us/" )
  --elseif(Variable:GetVariable("System_CodePage") == "950") then --台湾
  --  GameProduceLogin:OpenURL( "http://www.tinhkiem.us/" )
	--else
   -- GameProduceLogin:OpenURL( "http://www.tinhkiem.us/" )
 -- end
end

function SelectServer_shangyibu_click()
	GameProduceLogin:GoToCampaignDlg();
end