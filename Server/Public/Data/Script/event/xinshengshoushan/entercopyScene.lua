--�����䵺��ڶԻ��ű�
--

x808121_g_scriptId = 808121

x808121_tipinbox = 1
x808121_g_limitMembers = 3        --��������
x808121_g_Low_Level = 85           --��c�p����
x808121_g_Low_Level_xinfa = 50           --�ķ�����
x808121_g_NoUserTime = 3              --������û���˺���Լ�������to� � ʱ��(��λ:  gi�y),��֪��C�i n�y ֵ�Բ���?
x808121_g_tickDiffTime = 1              --�ص��ű�to� � ʱ��ʱ��(��λ:  gi�y/��)
x808121_g_CopySceneType = FUBEN_XINSHENGSHOUSHAN        --��������,����T�i ScriptGlobal.lua����

x808121_g_FubenTbl =
{
	FubenName = "�����䵺",
	MapFile = "petisland_3.nav",
	monsterId = 3290,
	bossId = 3893,  --��������
	AreaFile = "petisland_3_area.ini", 
	MonsterFile = "petisland_3_monster.ini",
	Fuben_start_x = 94,
	Fuben_start_z = 77,
}

x808121_monster_chufeng = {ID = 13281, Aitype = 0, AiscriptId = 0, scriptId = 808121, name = "�������"}     --����
x808121_monster_leilin = {ID = 13280, Aitype = 0, AiscriptId = 0, scriptId = 808121, name = "��������"}      --����
x808121_monster_xudaoshenshou = {ID = 13286, Aitype = 0, AiscriptId = 136, scriptId = 808121, name = "��������"}   --��������
x808121_monster_feitianmao = {ID = 13287, Aitype = 0, AiscriptId = 270, scriptId = 808121, name = "V� иch Phi Thi�n Mi�u"}   --V� иch Phi Thi�n Mi�u
x808121_monster_xiaozhuzhu = {ID = 13282, Aitype = 0, AiscriptId = 212, scriptId = 808121, name = "С����"}   --С����
x808121_monster_xiaohuhu = {ID = 13284, Aitype = 0, AiscriptId = 215, scriptId = 808121, name = "С����"}   --С����
x808121_monster_xiaoyingying = {ID = 13285, Aitype = 0, AiscriptId = 214, scriptId = 808121, name = "Сӥӥ"}   --Сӥӥ
x808121_monster_xiaogougou = {ID = 13283, Aitype = 0, AiscriptId = 213, scriptId = 808121, name = "С����"}   --С����
x808121_monster_groupId = 1

x808121_monster_First_num = 15
x808121_monster_Second_num = 15
x808121_monster_Third_num = 15
x808121_monster_Fourth_num = 15
x808121_monster_boss_num = 6
 
x808121_gFirst_MonstersTbl =   --��m�t ��������
{
{x = 127, z = 85}, {x = 126, z = 90}, {x = 130, z = 90}, {x = 137, z = 77}, {x = 137, z = 81}, {x = 141, z = 80}, {x = 149, z = 86}, {x = 152, z = 82}, {x = 140, z = 101}, 
{x = 157, z = 101}, {x = 134, z = 107}, {x = 145, z = 103}, {x = 154, z = 106}, {x = 147, z = 108}, {x = 160, z = 88}
}
x808121_gSecond_MonstersTbl =   --�ڶ���������
{
{x = 179, z = 86}, {x = 176, z = 89}, {x = 183, z = 100}, {x = 177, z = 95}, {x = 183, z = 92}, {x = 191, z = 122}, {x = 194, z = 128}, {x = 161, z = 108}, {x = 176, z = 116}, 
{x = 152, z = 119}, {x = 162, z = 124}, {x = 163, z = 132}, {x = 175, z = 135}, {x = 178, z = 128}, {x = 170, z = 127}
}
x808121_gThird_MonstersTbl =    --������������
{
{x = 193, z = 153}, {x = 188, z = 163}, {x = 195, z = 163}, {x = 201, z = 163}, {x = 200, z = 170}, {x = 194, z = 171}, {x = 171, z = 146}, {x = 174, z = 150}, {x = 159, z = 156}, 
{x = 162, z = 159}, {x = 157, z = 162}, {x = 149, z = 153}, {x = 147, z = 147}, {x = 152, z = 157}, {x = 161, z = 145}
}
x808121_gFourth_MonstersTbl =    --������������
{
{x = 137, z = 157}, {x = 130, z = 158}, {x = 140, z = 163}, {x = 124, z = 144}, {x = 121, z = 137}, {x = 126, z = 129}, {x = 141, z = 137}, {x = 138, z = 141}, {x = 101, z = 155}, 
{x = 108, z = 161}, {x = 111, z = 163}, {x = 109, z = 173}, {x = 107, z = 169}, {x = 133, z = 146}, {x = 128, z = 136}
}
x808121_gFourth_hudaoshenshouTbl =
{startx = 153, startz = 182, PatrolId = 0}

x808121_gFourth_feitianmaoTbl =
{startx = 155, startz = 150, PatrolId = 1}

x808121_gFourth_xiaozuzuTbl =
{startx = 155, startz = 150, PatrolId = 2}
x808121_gFourth_xiaohuhuTbl =
{startx = 155, startz = 150, PatrolId = 3}
x808121_gFourth_xiaoyingyingTbl =
{startx = 155, startz = 150, PatrolId = 4}
x808121_gFourth_xiaogougouTbl =
{startx = 155, startz = 150, PatrolId = 5}

--����
 -- �������
x808121_g_RandNum = 10000

 -- ����to� � ���ʱ��,3 ph�t
x808121_g_Lifecycle = 180000

--**********************************
--������ں���....
--**********************************
function x808121_OnDefaultEvent( sceneId, selfId, targetId )

--**********************************
--NPC�Ի�
--**********************************
	BeginEvent( sceneId )
		AddText(sceneId, "Thi�n ni�n k� th��Ѿ�����T�i ����to� � ���䵺��,ȥm�t � gi�y���to� � ��ɰ�!")
		AddNumText( sceneId, x808121_g_scriptId, "entercopyScene 1", 6, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end


function x808121_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	
	if GetNumText() == 1 then
		local nCheckRet = x808121_CheckCanEnterScene(sceneId, selfId, targetId, eventId)
		local strOutmsg = "";
		if (nCheckRet == 1) then
			strOutmsg = "��Khi�u chi�n����,Ng߽i c�n m�t ֧3�˻�3������to� � ����.";
		elseif (nCheckRet == 2) then
			strOutmsg = "Ng߽i kh�ng ph�i l� �ӳ�,����C�a ng߽i �ӳ�������.";
		elseif (nCheckRet == 3) then
			strOutmsg = "��Khi�u chi�n����,Ng߽i c�n m�t ֧3�˻�3������to� � ����."           --��������
		elseif (nCheckRet == 4) then
			strOutmsg = "Th�nh vi�n trong �i ng� �г�Ա��T�i ����.";
		elseif (nCheckRet == 5 or nCheckRet == 6) then
			strOutmsg = "�Բ���,Th�nh vi�n trong �i ng� �г�ԱCh�a ����������.\n"           --5,6m�t ����ng����ʾ
			
			local nearMemberCount = GetNearTeamCount(sceneId, selfId);
			local sceneMemId = 0;
			local memName = "";
			
			local strOutMsgTemp = {}
			for i = 0, nearMemberCount - 1 do
				sceneMemId = GetNearTeamMember(sceneId, selfId, i)
				memName = GetName(sceneId, sceneMemId);
				strOutMsgTemp[i] = "#c3c3cff"..memName.."#W"
				if sceneMemId and sceneMemId >= 0 then			
					if (GetLevel(sceneId, sceneMemId) < x808121_g_Low_Level) then
						strOutMsgTemp[i] = strOutMsgTemp[i]..":\n  ��c�pҪ��"..tostring(x808121_g_Low_Level).."    #cff0000Ch�a ��#W\n"
					else
						strOutMsgTemp[i] = strOutMsgTemp[i]..":\n  ��c�pҪ��"..tostring(x808121_g_Low_Level).."    #c00ff00Th�a m�n#W\n"
					end
					if (0 == x808121_CheckAllXinfaLevel(sceneId, sceneMemId)) then
						strOutMsgTemp[i] = strOutMsgTemp[i].."  �ķ�Ҫ��"..tostring(x808121_g_Low_Level_xinfa).."    #cff0000Ch�a ��#W\n"
					else
						strOutMsgTemp[i] = strOutMsgTemp[i].."  �ķ�Ҫ��"..tostring(x808121_g_Low_Level_xinfa).."    #c00ff00Th�a m�n#W\n"
					end
				else
					strOutMsgTemp[i] = strOutMsgTemp[i]..memName..":�޷���ȷ��ȡ��Ա��ng c�p t�m ph�p ����."
				end
			end
			
			BeginEvent( sceneId )
				AddText(sceneId, strOutmsg)
				for i = 0, nearMemberCount - 1 do
					AddText(sceneId, strOutMsgTemp[i])
				end
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )	
			
			return
		end			

		if (nCheckRet > 0 and nCheckRet < 5) then
			if (x808121_tipinbox == 1) then
				BeginEvent( sceneId )
		   			AddText(sceneId, strOutmsg)
		   		EndEvent( sceneId )
		  		DispatchEventList( sceneId, selfId, targetId )	
			else
				x808121_NotifyFailTips(sceneId, selfId, strOutmsg);
			end
			return
		end
		
		--���Խ��븱����
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);
		x808121_MakeCopyScene(sceneId, selfId, targetId, nearMemberCount)	

	end

end


--**********************************
--�����ng��Th�a m�n���븱��to� � Ҫ��

--�����ng��Th�a m�n���븱��to� � Ҫ��
--Tr� v�ֵ� �i�m�: 1     û���
--            2     ����ng�ӳ�
--            3     ��������
--            4     еi vi�n ��T�i ����
--            5     �ӳ���c�p�ķ�����
--            6     еi vi�n ��c�p�ķ�����
--            7
--            0       Th�a m�n
--**********************************
function x808121_CheckCanEnterScene(sceneId, selfId, targetId, eventId)
	
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		return 1
	end
	
	if LuaFnIsTeamLeader(sceneId, selfId) == 0 then
		return  2
	end
	
	local teamMemberCount = GetTeamMemberCount(sceneId, selfId);
	if not teamMemberCount or teamMemberCount < x808121_g_limitMembers then
		return  3
	end
	
	local nearMemberCount = GetNearTeamCount(sceneId, selfId);
	if not nearMemberCount or teamMemberCount ~= nearMemberCount then
		return 4
	end
	
	
	-- ���ӳ�to� � ��c�p��ng��Th�a m�nҪ��
	if (GetLevel(sceneId, selfId) < x808121_g_Low_Level or 0 == x808121_CheckAllXinfaLevel(sceneId, selfId)) then
		return 5
	end
	
	-- ͳ����ng����еi vi�n Ch�a ����c�p�ķ�Ҫ��
	local bHave = 0
	for i = 0, nearMemberCount - 1 do
		local sceneMemId = GetNearTeamMember(sceneId, selfId, i)
		if sceneMemId and sceneMemId >= 0 then			
			if (GetLevel(sceneId, sceneMemId) < x808121_g_Low_Level) then
				bHave = 1
			end
			if (0 == x808121_CheckAllXinfaLevel(sceneId, sceneMemId)) then
				bHave = 1
			end
		end
	end
	
	if(bHave == 1)then
		return 6;
	end
	 
--����Th�a m�n��~~~
	return 0;
end



--**********************************
--��������
--nearmembercount: еi vi�n c�i��
--**********************************
function x808121_MakeCopyScene(sceneId, selfId, targetId, nearmembercount)

	local x
	local z
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	local leaderguid = LuaFnObjId2Guid(sceneId, selfId);
	LuaFnSetSceneLoad_Map(sceneId, x808121_g_FubenTbl.MapFile);										--��ͼ��ng����ѡȡto� � ,���ұ���T�i Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x808121_g_NoUserTime * 1000);
	LuaFnSetCopySceneData_Timer(sceneId, x808121_g_tickDiffTime * 1000);
	
	--��ʼ�����и�������
	for i=0, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	LuaFnSetCopySceneData_Param(sceneId, 0, x808121_g_CopySceneType);					--���ø�������,���ｫ0������to� � ��������Ϊ999,���ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x808121_g_scriptId);						--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);											--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);										--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, x);											--��ڵ�ַ
	LuaFnSetCopySceneData_Param(sceneId, 5, z);											
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId, selfId));				--��������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0);											--ɱ������to� � ����
	LuaFnSetCopySceneData_Param(sceneId, 8, x808121_g_FubenTbl.monsterId )	--С��ID....
	LuaFnSetCopySceneData_Param(sceneId, 9, x808121_g_FubenTbl.bossId )		--BOSSID....
	LuaFnSetCopySceneData_Param(sceneId, 11, 0 )				--ɱ�������....
	LuaFnSetCopySceneData_Param(sceneId, 12, 0 )				--step....
	LuaFnSetCopySceneData_Param(sceneId, 13, 0 )				--ɱboss����
	
	LuaFnSetSceneLoad_Area( sceneId, x808121_g_FubenTbl.AreaFile )
	LuaFnSetSceneLoad_Monster( sceneId, x808121_g_FubenTbl.MonsterFile )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D�ch chuy�n th�nh c�ng!");
			--ɾ��NPC
			LuaFnDeleteMonster(sceneId, targetId)
		else
			AddText(sceneId,"S� l��ng b�n sao �� �n gi�i h�n, � ngh� l�t n�a th� l�i!");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����˳�����
--**********************************
function x808121_PlayerExit(sceneId, selfId)

	if selfId then
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--ȡ �i�m������ڳ�����
		local x = LuaFnGetCopySceneData_Param(sceneId, 4);
		local z = LuaFnGetCopySceneData_Param(sceneId, 5);
		
		--����ǰ����������to� � �����˴��ͻ�ԭ������ʱ��to� � ����
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
				if memId == selfId then
					NewWorld(sceneId, memId, oldsceneId, x, z);
				end
			end
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x808121_OnCopySceneReady(sceneId, destsceneId)
	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);		--���ø�����ڳ�����
	local leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId);
	local leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	local day = GetDayTime();

	if LuaFnIsCanDoScriptLogic(sceneId, leaderObjId) ~= 1 then
		return 
	end

	--ȡ �i�m��Ҹ���to� � ��������(�����Լ�)
	local nearMemberCount = GetNearTeamCount(sceneId, leaderObjId) ;
	local memId;
	for	i = 0, nearMemberCount - 1 do
		memId = GetNearTeamMember(sceneId, leaderObjId, i);
		if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
			NewWorld(sceneId, memId, destsceneId, x808121_g_FubenTbl.Fuben_start_x, x808121_g_FubenTbl.Fuben_start_z);
		end
		--�ͳ����T�i ����C�n 
	end
	
	--ͳ��,�ӳ����˶����˽�ȥ(�����а����ӳ�)
	CreateCopySceneAudit(sceneId, leaderObjId, nearMemberCount)
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x808121_OnPlayerEnter(sceneId, selfId)
	--��� gi�y����󸴻� �i�mλ��	
	SetPlayerDefaultReliveInfo(sceneId, selfId, "%10", -1, "0", sceneId, x808121_g_FubenTbl.Fuben_start_x, x808121_g_FubenTbl.Fuben_start_z);  --���� �i�m����T�i �ս���to� � �ط�
	local teamLeaderFlag = LuaFnIsTeamLeader(sceneId, selfId);
	if teamLeaderFlag and teamLeaderFlag == 1 then
		LuaFnSetTeamExpAllotMode(sceneId, selfId, 0);      --ƽ������ģʽ
	end
end

--**********************************
--�����T�i �����������¼�
--**********************************
function x808121_OnHumanDie(sceneId, selfId, killerId)
end

--**********************************
--����������ʱ���¼�
--**********************************
function x808121_OnCopySceneTimer(sceneId, nowTime)

	--����ʱ�Ӷ�ȡ������
	local nStep = LuaFnGetCopySceneData_Param(sceneId, 12 )
	local curTickCount = LuaFnGetCopySceneData_Param(sceneId, 2);		--ȡ �i�m�Ѿ�ִ��to� � ��ʱ����
	
	--�׶ο���
	if (nStep == 0) then        --�����ոտ�ʼ
		LuaFnSetCopySceneData_Param(sceneId, 12, 1 )	
		
		LuaFnSetSceneWeather(sceneId, 19, 39*60*1000 );   --����
		
		--��ʾ��Ϣ
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 then
 				x808121_NotifyFailTips(sceneId, memId, "Thi�n ni�n k� th�: �����Ѿ����ٵ�����to� � ���䵺��.");
 			end
		end		
		
		--���ֵ�m�t ����
		for i, MonsterPos in x808121_gFirst_MonstersTbl do
			objId = LuaFnCreateMonster( sceneId, x808121_monster_leilin.ID, MonsterPos.x, MonsterPos.z, x808121_monster_leilin.Aitype, x808121_monster_leilin.AiscriptId , x808121_monster_leilin.scriptId )			
		end
		
		--������boss,��������,
		objId = LuaFnCreateMonster( sceneId, x808121_monster_xudaoshenshou.ID, x808121_gFourth_hudaoshenshouTbl.startx, x808121_gFourth_hudaoshenshouTbl.startz, x808121_monster_xudaoshenshou.Aitype, x808121_monster_xudaoshenshou.AiscriptId , x808121_monster_xudaoshenshou.scriptId )			
		SetPatrolId(sceneId, objId, x808121_gFourth_hudaoshenshouTbl.PatrolId )
		--V� иch Phi Thi�n Mi�u
		objId = LuaFnCreateMonster( sceneId, x808121_monster_feitianmao.ID, x808121_gFourth_feitianmaoTbl.startx, x808121_gFourth_feitianmaoTbl.startz, x808121_monster_feitianmao.Aitype, x808121_monster_feitianmao.AiscriptId , x808121_monster_feitianmao.scriptId )			
		SetCharacterTitle(sceneId, objId, "���䵺�켩�ӳ�")
		SetMonsterGroupID(sceneId, objId, x808121_monster_groupId);	--ÿ���������ͬm�t c�iGroupID,���������ǿ��Ի�����Ԯ
		SetPatrolId(sceneId, objId, x808121_gFourth_feitianmaoTbl.PatrolId )
		objId = LuaFnCreateMonster( sceneId, x808121_monster_xiaozhuzhu.ID, x808121_gFourth_xiaozuzuTbl.startx, x808121_gFourth_xiaozuzuTbl.startz, x808121_monster_xiaozhuzhu.Aitype, x808121_monster_xiaozhuzhu.AiscriptId , x808121_monster_xiaozhuzhu.scriptId )			
		SetMonsterGroupID(sceneId, objId, x808121_monster_groupId);
		SetPatrolId(sceneId, objId, x808121_gFourth_xiaozuzuTbl.PatrolId )
		objId = LuaFnCreateMonster( sceneId, x808121_monster_xiaohuhu.ID, x808121_gFourth_xiaohuhuTbl.startx, x808121_gFourth_xiaohuhuTbl.startz, x808121_monster_xiaohuhu.Aitype, x808121_monster_xiaohuhu.AiscriptId , x808121_monster_xiaohuhu.scriptId )			
		SetMonsterGroupID(sceneId, objId, x808121_monster_groupId);
		SetPatrolId(sceneId, objId, x808121_gFourth_xiaohuhuTbl.PatrolId )
		objId = LuaFnCreateMonster( sceneId, x808121_monster_xiaoyingying.ID, x808121_gFourth_xiaoyingyingTbl.startx, x808121_gFourth_xiaoyingyingTbl.startz, x808121_monster_xiaoyingying.Aitype, x808121_monster_xiaoyingying.AiscriptId , x808121_monster_xiaoyingying.scriptId )			
		SetMonsterGroupID(sceneId, objId, x808121_monster_groupId);
		SetPatrolId(sceneId, objId, x808121_gFourth_xiaoyingyingTbl.PatrolId )
		objId = LuaFnCreateMonster( sceneId, x808121_monster_xiaogougou.ID, x808121_gFourth_xiaogougouTbl.startx, x808121_gFourth_xiaogougouTbl.startz, x808121_monster_xiaogougou.Aitype, x808121_monster_xiaogougou.AiscriptId , x808121_monster_xiaogougou.scriptId )			
		SetMonsterGroupID(sceneId, objId, x808121_monster_groupId);
		SetPatrolId(sceneId, objId, x808121_gFourth_xiaogougouTbl.PatrolId )
		
	elseif (nStep == 4) then     --��������
		curTickCount	= 2340
		LuaFnSetCopySceneData_Param(sceneId, 2, curTickCount);--������to� � ��ʱ�����ô���
		LuaFnSetCopySceneData_Param(sceneId, 12, 5 )   --���뵹��ʱ��	
	end
	
	--ʱ�����
	local strOutMsg = ""
	--�ڶ������߼�
	if (curTickCount >=240 and curTickCount <= 300) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		
		if(curTickCount == 240) then
			strOutMsg = "Thi�n ni�n k� th�: ���ｫ��60 gi�y����."
		elseif(curTickCount == 270) then
			strOutMsg = "Thi�n ni�n k� th�: ���ｫ��30 gi�y����."
		elseif(curTickCount == 290) then
			strOutMsg = "Thi�n ni�n k� th�: ���ｫ��10 gi�y����."
		elseif(curTickCount == 295) then
			strOutMsg = "Thi�n ni�n k� th�: ���ｫ��5 gi�y����."
		elseif(curTickCount == 300) then
			strOutMsg = "Thi�n ni�n k� th�: �����Ѿ����ٵ�����to� � ���䵺��."
			--���ֵڶ�����
			for i, MonsterPos in x808121_gSecond_MonstersTbl do
				objId = LuaFnCreateMonster( sceneId, x808121_monster_chufeng.ID, MonsterPos.x, MonsterPos.z, x808121_monster_chufeng.Aitype, x808121_monster_chufeng.AiscriptId , x808121_monster_chufeng.scriptId )			
			end
		end
		
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 then
 				x808121_NotifyFailTips(sceneId, memId, strOutMsg);
 			end
		end		
	
		--���������߼�
	elseif (curTickCount >=540 and curTickCount <= 600) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		
		if(curTickCount == 540) then
			strOutMsg = "Thi�n ni�n k� th�: ���뽫��60 gi�y����."
		elseif(curTickCount == 570) then
			strOutMsg = "Thi�n ni�n k� th�: ���뽫��30 gi�y����."
		elseif(curTickCount == 590) then
			strOutMsg = "Thi�n ni�n k� th�: ���뽫��10 gi�y����."
		elseif(curTickCount == 595) then
			strOutMsg = "Thi�n ni�n k� th�: ���뽫��5 gi�y����."
		elseif(curTickCount == 600) then
			strOutMsg = "Thi�n ni�n k� th�: �����Ѿ����ٵ�����to� � ���䵺��."
			--���ֵ�������
			for i, MonsterPos in x808121_gThird_MonstersTbl do
				objId = LuaFnCreateMonster( sceneId, x808121_monster_leilin.ID, MonsterPos.x, MonsterPos.z, x808121_monster_leilin.Aitype, x808121_monster_leilin.AiscriptId , x808121_monster_leilin.scriptId )			
			end
		end
		
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 then
 				x808121_NotifyFailTips(sceneId, memId, strOutMsg);
 			end
		end		

	
	--���������߼�
	elseif (curTickCount >=840 and curTickCount <= 900) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		
		if(curTickCount == 840) then
			strOutMsg = "Thi�n ni�n k� th�: ���ｫ��60 gi�y����."
		elseif(curTickCount == 870) then
			strOutMsg = "Thi�n ni�n k� th�: ���ｫ��30 gi�y����."
		elseif(curTickCount == 890) then
			strOutMsg = "Thi�n ni�n k� th�: ���ｫ��10 gi�y����."
		elseif(curTickCount == 895) then
			strOutMsg = "Thi�n ni�n k� th�: ���ｫ��5 gi�y����."
		elseif(curTickCount == 900) then
			strOutMsg = "Thi�n ni�n k� th�: �����Ѿ����ٵ�����to� � ���䵺��."
			--���ֵ�������
			for i, MonsterPos in x808121_gFourth_MonstersTbl do
				objId = LuaFnCreateMonster( sceneId, x808121_monster_chufeng.ID, MonsterPos.x, MonsterPos.z, x808121_monster_chufeng.Aitype, x808121_monster_chufeng.AiscriptId , x808121_monster_chufeng.scriptId )			
			end
		end
		
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 then
 				x808121_NotifyFailTips(sceneId, memId, strOutMsg);
 			end
		end		

	--40 ph�t����curTickCount == 2400)
	elseif (curTickCount >=2340) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		if (curTickCount == 2340) then
			strOutMsg = "C�c h� s� r�i kh�i n�i n�y trong v�ng 60 gi�y n�a."
		elseif(curTickCount == 2370) then
			strOutMsg = "C�c h� s� r�i kh�i n�i n�y trong v�ng 30 gi�y n�a."
		elseif(curTickCount == 2380) then
			strOutMsg = "C�c h� s� r�i kh�i n�i n�y trong v�ng 20 gi�y n�a."
		elseif(curTickCount == 2390) then
			strOutMsg = "C�c h� s� r�i kh�i n�i n�y trong v�ng 10 gi�y n�a."
		elseif(curTickCount == 2395) then
			strOutMsg = "C�c h� s� r�i kh�i n�i n�y trong v�ng 5 gi�y n�a."
		elseif(curTickCount >= 2400) then
			local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--ȡ �i�m������ڳ�����,׼������Ҵ���ȥ
			local x = LuaFnGetCopySceneData_Param(sceneId, 4);
			local z = LuaFnGetCopySceneData_Param(sceneId, 5);
		
			--����ǰ����������to� � �����˴��ͻ�ԭ������ʱ��to� � ����
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
			
			local memId;
			for	i = 0, membercount - 1 do
				memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
				if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
					NewWorld(sceneId, memId, oldsceneId, x, z);
				end
			end
			return
		end
		
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 then
 				x808121_NotifyFailTips(sceneId, memId, strOutMsg);
 			end
		end		
	end
	
	curTickCount = curTickCount + 1;
	LuaFnSetCopySceneData_Param(sceneId, 2, curTickCount);--������to� � ��ʱ�����ô���
	
end

--**********************************
--����������ɱ�˹�
--**********************************
function x808121_OnDie(sceneId, selfId, killerId)						-- ����ID, ��ɱto� � ObjId, ɱ��ObjId

	CallScriptFunction(501000, "OnDie", sceneId, selfId, killerId) 
	
	--������ngͳ�ƹ���
	local szName = GetName(sceneId, selfId)

	local AllMonsterNum = 0;
	--������ng��m�t ��,�ڶ���,������,��������,��6c�iboss(��c�i��boss,��c�iС..)
--	AllMonsterNum = x808121_gFirst_MonstersTbl.size + x808121_gSecond_MonstersTbl.size + x808121_gThird_MonstersTbl.size + x808121_gFourth_MonstersTbl.size  
	AllMonsterNum = x808121_monster_First_num + x808121_monster_Second_num + x808121_monster_Third_num + x808121_monster_Fourth_num + x808121_monster_boss_num
	
	local nKilledMonsterNum_feng = LuaFnGetCopySceneData_Param(sceneId, 7);											--ɱ����to� � ����
	local nKilledMonsterNum_long = LuaFnGetCopySceneData_Param(sceneId, 11);											--ɱ����to� � ����
	local nKilledMonsterNum_boss = LuaFnGetCopySceneData_Param(sceneId, 13);											--ɱ��bossto� � ����
	
	local strOutMsg = ""
	local AuditType = 0
	if (szName == x808121_monster_chufeng.name) then
		nKilledMonsterNum_feng = nKilledMonsterNum_feng + 1
		LuaFnSetCopySceneData_Param(sceneId, 7, nKilledMonsterNum_feng);
		strOutMsg = strOutMsg.."��Khi�u chi�nThi�n ni�n k� th�����: "..tostring(nKilledMonsterNum_feng).."/"..tostring(x808121_monster_Second_num + x808121_monster_Fourth_num)
		AuditType = 1
	elseif (szName == x808121_monster_leilin.name) then
		nKilledMonsterNum_long = nKilledMonsterNum_long + 1
		LuaFnSetCopySceneData_Param(sceneId, 11, nKilledMonsterNum_long);
		strOutMsg = strOutMsg.."��Khi�u chi�nThi�n ni�n k� th�����: "..tostring(nKilledMonsterNum_long).."/"..tostring(x808121_monster_Second_num + x808121_monster_Fourth_num)
		AuditType = 2
	elseif (szName == x808121_monster_xudaoshenshou.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ����������: 1/1."
		AuditType = 3
	elseif (szName == x808121_monster_feitianmao.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ��V� иch Phi Thi�n Mi�u: 1/1."
		AuditType = 4
	elseif (szName == x808121_monster_xiaozhuzhu.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ��С����: 1/1."
		AuditType = 5
	elseif (szName == x808121_monster_xiaohuhu.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ��С����: 1/1."
		AuditType = 5
	elseif (szName == x808121_monster_xiaoyingying.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ��Сӥӥ: 1/1."
		AuditType = 5
	elseif (szName == x808121_monster_xiaogougou.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ��С����: 1/1."
		AuditType = 5
	end
	
	local nAllKilled = nKilledMonsterNum_feng + nKilledMonsterNum_long + nKilledMonsterNum_boss
	local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
	for	i = 0, membercount - 1 do
		memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
		if LuaFnIsObjValid(sceneId, memId) == 1 then
 			x808121_NotifyFailTips(sceneId, memId, strOutMsg);
 		end
	end		

	if (nAllKilled >= AllMonsterNum) then
		LuaFnSetCopySceneData_Param(sceneId, 12, 4 )        --������
	end
end

--վT�i �뿪����to� � ��Ӱ����,׼��ȥ��L�u Lan
function x808121_OnEnterArea( sceneId, selfId )
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--ȡ �i�m������ڳ�����
		local x = LuaFnGetCopySceneData_Param(sceneId, 4);
		local z = LuaFnGetCopySceneData_Param(sceneId, 5);
		NewWorld(sceneId, selfId, oldsceneId, x, z);
end

function x808121_OnLeaveArea( sceneId, selfId )
end

function x808121_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId);
		AddText(sceneId, Tip);
	EndEvent(sceneId);
	DispatchMissionTips(sceneId, selfId);
end


function x808121_CheckAllXinfaLevel(sceneId, memId)
	local nMenpai = GetMenPai(sceneId, memId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, memId, nMenpai*6 + i)
		if nXinfaLevel < x808121_g_Low_Level_xinfa    then
			return 0
		end
	end
	return 1
end
