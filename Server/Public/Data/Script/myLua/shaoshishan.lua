--002952

-- ����ɽ����
-- ����С����ʱ����

--************************************************************************
--MisDescBegin
--�ű���
x002952_g_ScriptId = 002952
x002952_g_Name = "Huy�n T�"


--MisDescEnd
--************************************************************************
x002952_TIME_2000_01_03_ = 946828868

x002952_g_SceneData_1 = 8   -- ��¼����ˢ�ֵ��ڼ���

x002952_g_SceneData_3 = 9	-- 
x002952_g_SceneData_4 = 10	-- 
x002952_g_SceneData_5 = 11	-- 
x002952_g_SceneData_6 = 12	-- 

--x002952_g_SceneData_7 = 13	-- ��ҵ�c�p

x002952_g_SD_Monster_1 	 = 14			-- ��δʹ��
x002952_g_SD_Monster_1_T = 15			-- ��δʹ��


--x002952_g_SD_Monster_2 	 = 16
--x002952_g_SD_Monster_2_T = 17
--x002952_g_SD_Monster_3 	 = 18
--x002952_g_SD_Monster_3_T = 19

--x002952_g_KillMonsCount_Qincheng = 20
--x002952_g_KillMonsCount_Qinjia 	 = 21
--x002952_g_KillMonsCount_Lama		 = 22

-- �رո���to� � ʱ���¼
x002952_g_CloseTime = 25

-- ����th�t b�ito� � ���
x002952_g_MissionLost = 26

-- ����H� th�ng��ʾto� � ʱ��
x002952_g_SystemTipsTime = 28

--��������
x002952_g_CopySceneName = "Thi�u Th�t S�n"
x002952_g_CopySceneType = FUBEN_DAZHAN_SSS	--��������,����T�i ScriptGlobal.lua����
x002952_g_CopySceneMap = "cangjingge_80JQTZ.nav"
x002952_g_LimitMembers = 1				--���Խ�����to� � ��С��������
x002952_g_TickTime = 1						--�ص��ű�to� � ʱ��ʱ��(��λ:  gi�y/��)
x002952_g_DayTime = 3						--m�t ���ڿ��Խ��븱��to� � ����
x002952_g_LimitTotalHoldTime = 360--�������Դ��to� � ʱ��(��λ: ����),�����ʱ�䵽��,�����񽫻�th�t b�i
x002952_g_LimitTimeSuccess = 500	--����ʱ������(��λ: ����),�����ʱ�䵽��,�������
x002952_g_CloseTick = 3						--�����ر�ǰ����ʱ(��λ: ����)
x002952_g_NoUserTime = 300				--������û���˺���Լ�������to� � ʱ��(��λ:  gi�y)
x002952_g_DeadTrans = 0						--����ת��ģʽ,0: �����󻹿��Լ���T�i ����,1: ������ǿ���Ƴ�����
x002952_g_Fuben_X = 130						--���븱��to� � λ��X
x002952_g_Fuben_Z = 204						--���븱��to� � λ��Z
x002952_g_Back_X = 282							--Դ����λ��X
x002952_g_Back_Z = 228						--Դ����λ��Z
x002952_g_Back_SceneId = 2				--Դ����Id

--**********************************
--������ں���
--**********************************
function x002952_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			--AddText(sceneId,"#{yanziwu_info}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetName(sceneId, targetId) ~= x002952_g_Name  then
		return
	end

	-- �������to� � ���,������͵���ͬto� � ����
	-- 2,��������ng����ng�����
	if GetTeamSize(sceneId,selfId) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi�u chi�n Thi�u Th�t S�n");
			AddText(sceneId,"Ь tham gia c�n c� t� �i 3 ng߶i tr� l�n !");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 3,��������ng����ng�ӳ�
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi�u chi�n Thi�u Th�t S�n");
			AddText(sceneId,"C�c h� kh�ng ph�i nh�m tr߷ng, h�y g�i nh�m tr߷ng �n g�p ta.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 4,�����ng����ng�˶���λ��
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi�u chi�n Thi�u Th�t S�n");
			AddText(sceneId," Th�nh vi�n trong nh�m kh�ng � g�n ��y");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--5,��������ͷto� � ÿc�i�����ng����ng����60c�p��
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)

	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		if GetLevel(sceneId,nPlayerId) < 60  then
			BeginEvent(sceneId)
				AddText(sceneId,"#BKhi�u chi�n Thi�u Th�t S�n");
				AddText(sceneId,"C�n c�p � 60 � tham gia th� th�ch n�y. Trong �i c�a ng߽i, c� ng߶i ch�a �� c�p �.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return
		end
	end

	-- ÿ��ֻ��3��
	--MD_SSS_TIMES		=	246  -- ÿ���������ɽto� � ����
	--MD_PRE_SSS_TIME	=	247  -- ��m�t ��ȥ����ɽto� � ʱ��

	local strName = {}
	strName[1] = ""
	strName[2] = ""
	strName[3] = ""
	strName[4] = ""
	strName[5] = ""
	strName[6] = ""

	local nPlayerNum = GetNearTeamCount(sceneId,selfId)
	local bOk = 1
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		local nTimes = GetMissionData(sceneId,nPlayerId, MD_SSS_TIMES) 
		local nPreTime = GetMissionData(sceneId,nPlayerId, MD_PRE_SSS_TIME)
		local nCurTime = LuaFnGetCurrentTime()
		if (nCurTime - nPreTime  >= 3600*24)  or
			 (floor((nCurTime-x002952_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x002952_TIME_2000_01_03_)/(3600*24)))   then
			nTimes = 0
			nPreTime = nCurTime
			SetMissionData(sceneId, nPlayerId, MD_SSS_TIMES, nTimes)
			SetMissionData(sceneId, nPlayerId, MD_PRE_SSS_TIME, nPreTime)
		end
		
		if nTimes >= x002952_g_DayTime then
			bOk = 0
			strName[i+1] = GetName(sceneId, nPlayerId)
		end
		
	end
	local nCount = 0

	if bOk == 0  then
		local szAllName = ""
		for i=1, 6  do
			if strName[i] ~= ""  then
				if nCount == 0  then
					szAllName = strName[i]
				else
					szAllName = szAllName .. "," .. strName[i]
				end
				nCount = nCount+1
			end
		end
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi�u chi�n Thi�u Th�t S�n");
			AddText(sceneId,"Th�nh vi�n " .. szAllName .. " �� tham gia �� l��t th� th�ch trong ng�y.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	
	end
	
	-- ����to� � ���ͨ��,
	x002952_MakeCopyScene(sceneId, selfId)
	
end

--**********************************
--�о��¼�
--**********************************
function x002952_OnEnumerate( sceneId, selfId, targetId )
	-- ���T�i ������m�t c�iT�n�ж�
	if GetName(sceneId, targetId) == x002952_g_Name  then
		AddNumText( sceneId, x002952_g_ScriptId, "#GTh� th�ch #YThi�u Th�t S�n",10 ,-1  )
		AddNumText( sceneId, x002952_g_ScriptId, "V� Thi�u th�t s�n",8 ,1  )
	end
end

--**********************************
--���Ti�p th�����
--**********************************
function x002952_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ�������ng��Ҫ���븱��
--**********************************
function x002952_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--Ti�p th�
--**********************************
function x002952_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x002952_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x002952_MakeCopyScene( sceneId, selfId )
	
	-- ʹ��еi vi�n to� � ��c�p���������to� � ��c�p
	local param0 = 4;
	local param1 = 3;

	--���ս��
	local mylevel = 0;

	--��ʱ����
	local memId;
	local tempMemlevel = 0;
	local level0 = 0;
	local level1 = 0;
	local i;
	
	local nearmembercount = GetNearTeamCount(sceneId,selfId)
	for	i = 0, nearmembercount - 1 do
		memId = GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, memId);
		level0 = level0 + (tempMemlevel ^ param0);
		level1 = level1 + (tempMemlevel ^ param1);
	end
	
	if level1 == 0 then
		mylevel = 0
	else
		mylevel = level0/level1;
	end
	
	if nearmembercount == -1  then  --û�ж���
		mylevel = GetLevel(sceneId, selfId)
	end
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "cangjingge_80JQTZ.nav"); --��ͼ��ng����ѡȡto� � ,���ұ���T�i Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x002952_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x002952_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x002952_g_CopySceneType);--���ø�������,���ｫ0������to� � ��������Ϊ999,���ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x002952_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);		--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);	--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);		--���ø����رձ�־, 0����,1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);		--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --��������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;	--ɱ��Bossto� � ����
	
	-- �����õ�to� � �������
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 1;
	elseif mylevel < 100 then
		iniLevel = floor(mylevel/10);
	else
		iniLevel = 10;
	end

	-- ʹ�õ�13λ,��¼����ʵ��to� � ��c�p
	LuaFnSetCopySceneData_Param(sceneId, x002952_g_SceneData_7, mylevel)
	
	--���ó�����to� � ����Npc������
	LuaFnSetSceneLoad_Area( sceneId, "cangjingge_80JQTZ_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "cangjingge_80JQTZ_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D�ch chuy�n th�nh c�ng! Vui l�ng ��i gi�y l�t s� d�ch chuy�n!");
		else
			AddText(sceneId,"S� l��ng b�n sao v��t qu� gi�i h�n, � ngh� l�t n�a th� l�i!");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--�����¼�
--**********************************
function x002952_OnCopySceneReady( sceneId, destsceneId )

	--���븱��to� � ����
	-- 1,���C�i n�y �ļ�û�����,�ʹ���C�i n�y ����Լ����븱��
	-- 2, �������ж���,����ng��Ҳ���ng�ӳ�,�ʹ����Լ����븱��
	-- 3,�������ж���,����C�i n�y �����ng�ӳ�,�ʹ����Լ��͸�������m�t ���ȥ

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼�to� � ״̬
		return
	end
	
	-- ��������ng����ng�ж���
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- û�ж���
		x002952_GotoScene(sceneId, leaderObjId, destsceneId)
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			x002952_GotoScene(sceneId, leaderObjId, destsceneId)
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				x002952_GotoScene(sceneId, mems[i], destsceneId)
			end
		end
	end

end

function x002952_GotoScene(sceneId, ObjId, destsceneId)
	NewWorld( sceneId, ObjId, destsceneId, x002952_g_Fuben_X, x002952_g_Fuben_Z) ;
end


--**********************************
--����ҽ��븱���¼�
--**********************************
function x002952_OnPlayerEnter( sceneId, selfId )
	-- 3,��� gi�y����¼�
	
	-- �������to� � ��ӪΪ 109
	SetUnitCampID(sceneId, selfId, selfId, 109)
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x002952_g_Fuben_X, x002952_g_Fuben_Z )
	
	local nTimes = GetMissionData(sceneId,selfId, MD_SSS_TIMES) 
	local nPreTime = GetMissionData(sceneId,selfId, MD_PRE_SSS_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	
	SetMissionData(sceneId, selfId, MD_SSS_TIMES, nTimes+1) 
	SetMissionData(sceneId, selfId, MD_PRE_SSS_TIME, nCurTime)
	
end

--**********************************
--�����T�i �����������¼�
--**********************************
function x002952_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x002952_OnAbandon( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x002952_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--�����ng������ύ
--**********************************
function x002952_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x002952_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x002952_OnDie( sceneId, objId, killerId )
	
end

--**********************************
--��ʾ���и��������
--**********************************
function x002952_TipAllHuman( sceneId, Str )
	--  ��t ���c������ͷto� � ������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û����to� � ����,ʲô������
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x002952_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--���������¼�
--**********************************
function x002952_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x002952_OnItemChanged( sceneId, selfId, itemdataId )
	
end



