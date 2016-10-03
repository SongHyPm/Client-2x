-- ��������

--************************************************************************
--MisDescBegin

-- �ű���
x050010_g_ScriptId = 050010

-- �����
x050010_g_MissionId = 396					-- 395 - 399

--��m�t c�i����to� � ID
x050010_g_MissionIdPre = 395

-- M�c ti�u nhi�m v�npc
x050010_g_Name = "D߽ng V�n Qu�ng"

--�������
x050010_g_MissionKind = 3

--��ng c�p nhi�m v� 
x050010_g_MissionLevel = 10000

-- �����ı�����
x050010_g_MissionName = "San b�ng nh�t ph�m �߶ng"
x050010_g_MissionInfo = "    T�t, t�m l�ng t�n trung b�o qu�c th�t ��ng kh�m ph�c. Gi� d�n c�c h� �i th�m chi�n khu"			--��������
x050010_g_MissionTarget = "    K�ch s�t �n t� Nh�t Ph�m �߶ng cao th� v� �u m�c. "						-- M�c ti�u nhi�m v�
x050010_g_ContinueInfo = "    Tr�n ng߶i c�c h� hi�n kh�ng c� l�nh b�i, giao t� t� ��u n�i �n?"				--δHo�n t�t nhi�m v�to� � npc�Ի�
x050010_g_MissionComplete = "    R�t t�t r�t t�t, v� qu�c c�ng s�c, t�i h� s� giao tr�ng tr�ch c�a s� vi�c. "				--Ho�n t�t nhi�m v�npc˵to� � ��

x050010_g_IsMissionOkFail = 0				-- 0��: ��ǰ������ng�����(0δ��ɣ�1���)
x050010_g_Param_sceneid = 1					-- 1��: ��ǰ��������to� � ������

-- ������

--MisDescEnd
--************************************************************************

x050010_g_ControlScript = 050009

x050010_g_NumText_Main = 1				-- ����m�t Ʒ�ø�������
x050010_g_NumText_SubmitBooty = 2		-- ��m�t Ʒ������
x050010_g_NumText_Question = 3			-- ���������ʲô��

x050010_g_CopySceneMap = "bianguan_1.nav"
x050010_g_CopySceneArea = "bianguan_1_area.ini"

x050010_g_CopySceneType = FUBEN_BIANGUAN	--��������,����T�i ScriptGlobal.lua����
x050010_g_LimitMembers = 1					--���Խ�����to� � ��С��������
x050010_g_TickTime = 5						--�ص��ű�to� � ʱ��ʱ��(��λ:  gi�y/��)
x050010_g_LimitTotalHoldTime = 240			--�������Դ��to� � ʱ��(��λ: ����),�����ʱ�䵽��,�����񽫻�th�t b�i
x050010_g_CloseTick = 3						--�����ر�ǰ����ʱ(��λ: ����)
x050010_g_NoUserTime = 300					--������û���˺���Լ�������to� � ʱ��(��λ:  gi�y)

x050010_g_Fuben_X = 29
x050010_g_Fuben_Z = 49

x050010_g_BackInfo = { sceneId = 8, x = 252, z = 146 }

x050010_g_MonsterGroupID = 1
x050010_g_BossGroupID = 2					--C�n ɱ��to� � Bossto� � GroupID

x050010_g_CopySceneInfo = {}
x050010_g_CopySceneInfo[1] = { odds = 65, bossScore = 3, monsterScore = 1, bootyOdds = 30 }
x050010_g_CopySceneInfo[2] = { odds = 85, bossScore = 5, monsterScore = 1, bootyOdds = 50 }
x050010_g_CopySceneInfo[3] = { odds = 95, bossScore = 7, monsterScore = 1, bootyOdds = 70 }
x050010_g_CopySceneInfo[4] = { odds = 100, bossScore = 10, monsterScore = 1, bootyOdds = 100 }

x050010_g_Booty = 40004302

x050010_g_StdExpTbl = {
	30, 36, 42, 48, 54, 60, 66, 72, 78, 101, 108, 115, 122, 130,
	137, 144, 151, 158, 166, 202, 210, 218, 227, 235, 244, 252,
	260, 269, 277, 326, 336, 346, 355, 365, 374, 384, 394, 403,
	413, 475, 486, 497, 508, 518, 529, 540, 551, 562, 572, 648,
	660, 672, 684, 696, 708, 720, 732, 744, 756, 845, 858, 871,
	884, 898, 911, 924, 937, 950, 964, 1066, 1080, 1094, 1109,
	1123, 1138, 1152, 1166, 1181, 1195, 1310, 1326, 1342, 1357,
	1373, 1388, 1404, 1420, 1435, 1451, 1579, 1596, 1613, 1630,
	1646, 1663, 1680, 1697, 1714, 1730, 1872, 1890, 1908, 1926,
	1944, 1962, 1980, 1998, 2016, 2034, 2189, 2208, 2227, 2246,
	2266, 2285, 2304, 2323, 2342, 2362, 2530,
}

--**********************************
--������ں���
--**********************************
function x050010_OnDefaultEvent( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x050010_g_Name then		--�жϸ�npc��ng����ng��Ӧ����to� � npc
		return
	end

	if GetNumText() == x050010_g_NumText_Main then
		x050010_AskEnterCopyScene( sceneId, selfId, targetId )
	elseif GetNumText() == x050010_g_NumText_SubmitBooty then
		x050010_SubmitBooty( sceneId, selfId, targetId )
	elseif GetNumText() == x050010_g_NumText_Question then
		x050010_AnswerQuestion( sceneId, selfId, targetId )
	else
		return
	end
end

--**********************************
--����������
--**********************************
function x050010_AskEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050010_g_MissionIdPre ) <= 0 then			-- û������
		return
	end

	-- ȡ �i�m��Ҹ���to� � ��������(�����Լ�)
	local i, nearteammembercount, member
	local members = {}
	local validmembercount = 0
	if LuaFnHasTeam( sceneId, selfId ) ~= 0 then
		if LuaFnIsTeamLeader( sceneId, selfId ) ~= 0 then					-- ��ng�ӳ�
			nearteammembercount = GetNearTeamCount( sceneId, selfId )
			for i=0, nearteammembercount-1 do
				member = GetNearTeamMember( sceneId, selfId, i )
				if IsHaveMission( sceneId, member, x050010_g_MissionIdPre ) > 0
				 and GetMissionCount( sceneId, selfId ) < 20 then			-- ������
					validmembercount = validmembercount + 1
					members[validmembercount] = member
				end
			end
		else																-- еi vi�n 
			x050010_NotifyFailBox( sceneId, selfId, targetId, "    Xin m�i �i tr߷ng c�a Nh�m t�i t�m ta" )
			return
		end
	end

	if validmembercount < x050010_g_LimitMembers then
		x050010_NotifyFailBox( sceneId, selfId, targetId, "    Th� �ch r�t m�nh, c�c h� 1 th�n s� kh� chi�n th�ng, ch� �t c�ng c�n" ..
						x050010_g_LimitMembers .. "Ng߶i, ta m�i ti�n c�c ng߽i" )
		return
	else
		x050010_NotifyFailBox( sceneId, selfId, targetId, "    T�t, t�m l�ng t�n trung b�o qu�c th�t ��ng kh�m ph�c. Gi� d�n c�c h� �i th�m chi�n khu" )
	end

	-- ����֮ǰto� � �����������
	local misIndex
	local mylevel = 0
	for i = 1, validmembercount do
		if IsHaveMission( sceneId, members[i], x050010_g_MissionId ) == 0 then				-- û������
			AddMission( sceneId, members[i], x050010_g_MissionId, x050010_g_ScriptId, 1, 0, 0 )		-- kill��area��item
		end

		misIndex = GetMissionIndexByID( sceneId, members[i], x050010_g_MissionId )
		SetMissionByIndex( sceneId, members[i], misIndex, x050010_g_IsMissionOkFail, 0 )	-- ������Ϊδ���
		SetMissionByIndex( sceneId, members[i], misIndex, x050010_g_Param_sceneid, -1 )		-- ����������Ϊ -1

		if mylevel < GetLevel( sceneId, members[i] ) then							--  �i�m�����c�p��
			mylevel = GetLevel( sceneId, members[i] )
		end
	end

	-- ��������
	local subCopySceneType = random( 100 )
	for i = 1, 4 do
		if subCopySceneType <= x050010_g_CopySceneInfo[i].odds then
			subCopySceneType = i
			break
		end
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x050010_g_CopySceneMap )						--��ͼ��ng����ѡȡto� � ,���ұ���T�i Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050010_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x050010_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x050010_g_CopySceneType )				--���ø�������,���ｫ0������to� � ��������Ϊ999,���ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, 1, x050010_g_ScriptId )					--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--���ø����رձ�־, 0����,1�ر�
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param( sceneId, 6, subCopySceneType )				--���渱���������ͺ�
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--ɱ��Bossto� � ����

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, x050010_g_CopySceneArea )

	local monsterINI = "bianguan_" .. subCopySceneType .. "_monster_" .. iniLevel .. ".ini"
	LuaFnSetSceneLoad_Monster( sceneId, monsterINI )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --c�p���,CopyScene_LevelGap T�i  scene.lua �и�ֵ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	if bRetSceneID > 0 then
		x050010_NotifyFailTips( sceneId, selfId, "D�ch chuy�n th�nh c�ng!" )
	else
		x050010_NotifyFailTips( sceneId, selfId, "S� l��ng b�n sao �� �n gi�i h�n, � ngh� l�t n�a th� l�i!" )
	end
end

--**********************************
--��������
--**********************************
function x050010_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050010_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050010_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050010_g_Param_sceneid )

	DelMission( sceneId, selfId, x050010_g_MissionId )

	if sceneId == copyscene then
		x050010_NotifyFailTips( sceneId, selfId, "Nhi�m v� th�t b�i!" )
		x050010_Exit( sceneId, selfId )
	end
end

--**********************************
--��m�t Ʒ������
--**********************************
function x050010_SubmitBooty( sceneId, selfId, targetId )
	local nItemNum = GetItemCount( sceneId, selfId, x050010_g_Booty )

	if nItemNum < 1 then
		x050010_NotifyFailBox( sceneId, selfId, targetId, x050010_g_ContinueInfo )
		return
	end

	--  �i�m��������Kinh nghi�mΪƥ��õ�c�p������Kinh nghi�m*1.5��
	local exp = x050010_g_StdExpTbl[ GetLevel( sceneId, selfId ) ]
	if not exp then
		exp = 1
	end

	exp = exp * 1.5

	LuaFnDelAvailableItem( sceneId, selfId, x050010_g_Booty, 1 )
	AddExp( sceneId, selfId, exp )

	x050010_NotifyFailBox( sceneId, selfId, targetId, x050010_g_MissionComplete )

	local baoshi_lv1={	50101001,50101002,50102001,50102002,50102003,
						50102004,50103001,50104002,50111001,50111002,
						50112001,50112002,50112003,50112004,50113001,
						50113002,50113003,50113004,50113005,50114001,}
	local baoshiname_lv1={	"Mi�u Nh�n Th�ch (c�p 1)","H� Nh�n Th�ch (c�p 1)","Ho�ng Tinh Th�ch (c�p 1)","Lam Tinh Th�ch (c�p 1)","H�ng Tinh Th�ch (c�p 1)",
							"L�c Tinh Th�ch (c�p 1)","T� Ng�c (c�p 1)","Bi�n Th�ch (c�p 1)","Th�chL�u Th�ch (c�p 1)","Ti�m Tinh Th�ch (c�p 1)",
							"Ho�ng Ng�c (c�p 1)","H�o Th�ch (c�p 1)","Nguy�t Quang Th�ch (c�p 1)","B�ch T� (c�p 1)","Ho�ng B�o Th�ch (c�p 1)",
							"Lam B�o Th�ch (c�p 1)","L�c B�o Th�ch (c�p 1)","H�ng B�o Th�ch (c�p 1)","H�c B�o Th�ch (c�p 1)","T� M�u L�c (c�p 1)",}
							
	local baoshi_lv2={	50201001,50201002,50202001,50202002,50202003,
						50202004,50203001,50204002,50211001,50211002,
						50212001,50212002,50212003,50212004,50213001,
						50213002,50213003,50213004,50213005,50214001,}
	local baoshiname_lv2={	"Mi�u Nh�n Th�ch (c�p 2)","H� Nh�n Th�ch (c�p 2)","Ho�ng Tinh Th�ch (c�p 2)","Lam Tinh Th�ch (c�p 2)","H�ng Tinh Th�ch (c�p 2)",
							"L�c Tinh Th�ch (c�p 2)","T� Ng�c (c�p 2)","Bi�n Th�ch (c�p 2)","Th�ch L�u Th�ch (c�p 2)","Ti�m Tinh Th�ch (c�p 2)",
							"Ho�ng Ng�c (c�p 2)","H�o Th�ch (c�p 2)","Nguy�t Quang Th�ch (c�p 2)","B�ch T� (c�p 2)","Ho�ng B�o Th�ch (c�p 2)",
							"Lam B�o Th�ch (c�p 2)","L�c B�o Th�ch (c�p 2)","H�ng B�o Th�ch (c�p 2)","H�c B�o Th�ch (c�p 2)","T� M�u L�c (c�p 2)",}
							
	local jianding={30508041,30508051,30507041,30507051,30506041,30506051}
	local jiandingname={"Gi�m иnh Ph� 5","Gi�m иnh Ph� 6","Gi�m иnh Th� 5","Gi�m иnh Th� 6","Gi�m иnh Binh 5","Gi�m иnh Binh 6"}

	local yirong={	30501007,30501008,30501009,30501010,30501011,
					30501012,30501013,30501014,30501015,30501016,}
	local yirongname={	"D�ch Dung �an","D�ch Dung �an","D�ch Dung �an","D�ch Dung �an","D�ch Dung �an",
						"D�ch Dung �an","D�ch Dung �an","D�ch Dung �an","D�ch Dung �an","D�ch Dung �an",}
						
	local lihua={30505023,30505024,30505025,30505026,}
	local lihuaname={"Ph�o hoa c� ch� Trung","Ph�o hoa c� ch� Thu","Ph�o hoa c� ch� Kho�i","Ph�o hoa c� ch� L�c",}

	local rdvalue = random( 10000 )
	local itemSN, itemName
	if rdvalue < 10 then	-- 0~0.1%
		local tp = random( 20 )
		itemSN=baoshi_lv2[tp]
		itemName=baoshiname_lv2[tp]
	elseif rdvalue < 10+100 then	--0.1%~1.1%
		itemSN=20307001
		itemName="Nhi�m Ph�t T�"
	elseif rdvalue < 10+100+300 then 	--1.1%~4.1%
		local tp = random( 20 )
		itemSN=baoshi_lv1[tp]
		itemName=baoshiname_lv1[tp]
	elseif rdvalue < 10+100+300+500 then 	--4.1%~9.1%
		itemSN=30503011
		itemName="Tr�n th� ho�n �ng quy�n tr�c"
	elseif rdvalue < 10+100+300+500+500 then 	--9.1~14.1%
		local tp = random( 6 )
		itemSN=jianding[tp]
		itemName=jiandingname[tp]
	elseif rdvalue < 10+100+300+500+500+700 then 	--14.1%~21.1%
		local tp = random( 10 )
		itemSN=yirong[tp]
		itemName=yirongname[tp]
	elseif rdvalue < 10+100+300+500+500+700+1000 then 	--21.1%~31.1%
		local tp = random( 4 )
		itemSN=lihua[tp]
		itemName=lihuaname[tp]
	else
		return
	end

	-- ����������������Ʒ
	--local itemSN, itemName, _, bBroadCast = GetOneMissionBonusItem( 26 )
	if itemSN > -1 then
		TryRecieveItem( sceneId, selfId, itemSN, QUALITY_MUST_BE_CHANGE )					-- �Ų��¾�û����
	end

	local strText = GetName( sceneId, selfId ) .. "Khi #Ygiao nh�t ph�m �߶ng#W cho D߽ng V�n Qu�ng" ..
					", may m�n ��t ���c ban th߷ng #Rc�a tri�u ��nh" .. itemName .. "."
	BroadMsgByChatPipe( sceneId, selfId, strText, 4 )
end

--**********************************
--������������
--**********************************
function x050010_AnswerQuestion( sceneId, selfId, targetId )
	local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
	local strText = "    �i�m t�ch c�c hi�n nay c�a ng߽i l�" .. score .. "�i�m, ng߽i c� th� s� d�ng �i�m t�ch l�y trung thu" ..
					"�i t�m L�c D߽ng-Kh߽ng L� (127, 154) c�n 100 �i�m, T� Ch�u-Bao Th� Vinh (" ..
					"190, 168) c�n 200 �i�m, ��i L�-в T� Тng (109, 170) c�n 50" ..
					"0 �i�m �i l�y nguy�n li�u n�u n߾ng, l�i �i t�m Nh�c Th߶ng Vi�n (193, 148) T� Ch�u chuy�n" ..
					"Ъn T�y H� � �i v�t ph�m trung thu �c bi�t"
	x050010_NotifyFailBox( sceneId, selfId, targetId, strText )
end

--**********************************
--�о��¼�
--**********************************
function x050010_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050010_g_Name then						--�жϸ�npc��ng����ng��Ӧ����to� � npc
		return
	end

	if IsHaveMission( sceneId, selfId, x050010_g_MissionIdPre ) <= 0 then		-- û������
		return
	end

	if CallScriptFunction( x050010_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) == 0 then
		return
	end

	AddNumText( sceneId, x050010_g_ScriptId, "�� �y l�i cu�c x�m nh�p c�a cao th� v�o nh�t ph�m �߶ng", -1, x050010_g_NumText_Main )
	AddNumText( sceneId, x050010_g_ScriptId, "Giao l�nh b�i nh�t ph�m �߶ng", -1, x050010_g_NumText_SubmitBooty )
	AddNumText( sceneId, x050010_g_ScriptId, "�i�m t�ch c�c trung thu c� t�c d�ng g�", -1, x050010_g_NumText_Question )
end

--**********************************
--�����¼�
--**********************************
function x050010_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )				-- ���ø�����ڳ�����
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then											-- �Ҳ��������
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then		-- �����޷�ִ���߼�to� � ״̬
		return
	end

	--ȡ �i�m��Ҹ���to� � ��������(�����Լ�)
	local i, nearteammembercount, member
	local members = {}
	local validmembercount = 0

	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId )
	for i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )
		if IsHaveMission( sceneId, member, x050010_g_MissionId ) > 0 then		-- ������
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	if validmembercount < x050010_g_LimitMembers then
		x050010_NotifyFailTips( sceneId, leaderObjId, "S� ng߶i trong �i ng� c�a c�c h� kh�ng ��" )
		return
	end

	local misIndex
	for i = 1, validmembercount do
		misIndex = GetMissionIndexByID( sceneId, members[i], x050010_g_MissionId )

		if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- ���ڿ���ִ���߼�to� � ״̬
			--������to� � ��1����������Ϊ����to� � ������
			SetMissionByIndex( sceneId, members[i], misIndex, x050010_g_Param_sceneid, destsceneId )
	--		SetMissionEvent( sceneId, members[i], x050010_g_MissionId, 0 )			-- ����ɱ���¼�
			NewWorld( sceneId, members[i], destsceneId, x050010_g_Fuben_X, x050010_g_Fuben_Z )
		end
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x050010_OnPlayerEnter( sceneId, selfId )
	--��� gi�y����󸴻� �i�mλ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", x050010_g_BackInfo.sceneId, x050010_g_BackInfo.x, x050010_g_BackInfo.z )
end

--**********************************
--ɱ����������
--**********************************
function x050010_OnKillObject( sceneId, selfId, objdataId, objId )						--������˼: �����š����objId�������λ�úš�����objId
	if IsHaveMission( sceneId, selfId, x050010_g_MissionId ) == 0 then
		return
	end

	-- ɱ�� Boss ����Ӯ
	local SceneType = LuaFnGetCopySceneData_Param( sceneId, 6 )
	local CopySceneInfo = x050010_g_CopySceneInfo[SceneType]
	if not CopySceneInfo then
		return
	end

	--��ng����ng��C�n to� � ����
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050010_g_CopySceneType then
		return
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--��������Ѿ����óɹر�״̬,��ɱ����Ч
		return
	end

	local score, gainScore
	local gameWin = 0

	--ȡ �i�mɱ������to� � GroupID
	local GroupID = GetMonsterGroupID( sceneId, objId )
	if x050010_g_MonsterGroupID == GroupID then
		gainScore = CopySceneInfo.monsterScore
	elseif x050010_g_BossGroupID == GroupID then
		gainScore = CopySceneInfo.bossScore
		gameWin = 1
	end

	--ȡ �i�m��ǰ������to� � ����
	local i, humanObjId
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local strText = "Anh ��t ���c �i�m t�ch c�c trung thu" .. gainScore .. "�i�m"
	local strText2 = "C�c h� th�nh c�ng ��nh lui cu�c t�p k�ch l�n n�y c�a cao th� nh�t ph�m �߶ng"
	for i = 0, num - 1 do
		humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )					--ȡ �i�m��ǰ��������to� � objId

		if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then						--��T�i ����to� � �����˲���
			score = GetMissionData( sceneId, humanObjId, MD_MIDAUTUMN_SCORE )
			score = score + gainScore
			SetMissionData( sceneId, humanObjId, MD_MIDAUTUMN_SCORE, score )
			x050010_NotifyFailTips( sceneId, humanObjId, strText )
			Msg2Player( sceneId, humanObjId, strText, MSG2PLAYER_PARA )

			if gameWin == 1 then
				Msg2Player( sceneId, humanObjId, strText2, MSG2PLAYER_PARA )
				if random( 100 ) <= CopySceneInfo.bootyOdds then
					AddMonsterDropItem( sceneId, objId, humanObjId, x050010_g_Booty )
				end
			end
		end
	end

	if gameWin == 1 then
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )							--���ø����رձ�־, 0����,1�ر�
	end
end

--**********************************
--�����T�i �����������¼�
--**********************************
function x050010_OnHumanDie( sceneId, selfId, killerId )
	if IsHaveMission( sceneId, selfId, x050010_g_MissionId ) > 0 then
		DelMission( sceneId, selfId, x050010_g_MissionId )								-- ɾ��������
	end
end

--**********************************
--�뿪����
--**********************************
function x050010_Exit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050010_g_MissionId ) > 0 then
	--	local misIndex = GetMissionIndexByID( sceneId, selfId, x050010_g_MissionId )
	--	ResetMissionEvent( sceneId, selfId, x050010_g_MissionId, 0 )					-- ������ɱ���¼�
		DelMission( sceneId, selfId, x050010_g_MissionId )								-- ɾ��������
	end

	NewWorld( sceneId, selfId, x050010_g_BackInfo.sceneId, x050010_g_BackInfo.x, x050010_g_BackInfo.z )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x050010_OnCopySceneTimer( sceneId, nowTime )
	--����ʱ�Ӷ�ȡ������
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--ȡ �i�m�Ѿ�ִ��to� � ��ʱ����
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--������to� � ��ʱ�����ô���

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	if leaveFlag == 1 then															--C�n �뿪
		--�뿪����ʱ��to� � ��ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x050010_g_CloseTick then										--����ʱ�䵽,��Ҷ���ȥ��
			--����ǰ����������to� � �����˴��ͻ�ԭ������ʱ��to� � ����
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050010_Exit( sceneId, mems[i] )
				end
			end
		else
			--֪ͨ��ǰ����������to� � ������,�����رյ���ʱ��
			local strText = format( "C�c h� s� r�i kh�i n�i n�y trong v�ng %d gi�y n�a", ( x050010_g_CloseTick - leaveTickCount ) * x050010_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050010_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050010_g_LimitTotalHoldTime then									--������ʱ�����Ƶ���
		--�˴����ø���������ʱ������to� � ���,��ʱ�䵽����...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x050010_NotifyFailTips( sceneId, mems[i], "Nhi�m v� �� qu� gi�, tho�t kh�i b�i c�nh" )
				x050010_Exit( sceneId, mems[i] )
			end
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		if GetMonsterCount( sceneId ) < 1 then
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
		end
	end
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x050010_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--��Ŀ��Ϣ��ʾ
--**********************************
function x050010_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
