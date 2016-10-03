--002937

-- ɱ�Ǹ���
-- ����С����ʱ����

--************************************************************************
--MisDescBegin
--�ű���
x002937_g_ScriptId = 002937
x002937_g_Name = "���ٴ�ʦ"


--MisDescEnd
--************************************************************************
x002937_TIME_2000_01_03_ = 946828868

x002937_g_SceneData_1 = 8   -- ��¼����ˢ�ֵ��ڼ���

x002937_g_SceneData_3 = 9	-- 
x002937_g_SceneData_4 = 10	-- 
x002937_g_SceneData_5 = 11	-- 
x002937_g_SceneData_6 = 12	-- 

--x002937_g_SceneData_7 = 13	-- ��ҵȼ�

x002937_g_SD_Monster_1 	 = 14			-- ��δʹ��
x002937_g_SD_Monster_1_T = 15			-- ��δʹ��


--x002937_g_SD_Monster_2 	 = 16
--x002937_g_SD_Monster_2_T = 17
--x002937_g_SD_Monster_3 	 = 18
--x002937_g_SD_Monster_3_T = 19

--x002937_g_KillMonsCount_Qincheng = 20
--x002937_g_KillMonsCount_Qinjia 	 = 21
--x002937_g_KillMonsCount_Lama		 = 22

-- �رո���to� � ʱ���¼
x002937_g_CloseTime = 25

-- ����th�t b�ito� � ���
x002937_g_MissionLost = 26

-- ����H� th�ng��ʾto� � ʱ��
x002937_g_SystemTipsTime = 28

--��������
x002937_g_CopySceneName = "������̨"
x002937_g_CopySceneType = FUBEN_DAZHAN_SSLT	--��������,����T�i ScriptGlobal.lua����
x002937_g_CopySceneMap = "shengsileitai.nav"
x002937_g_LimitMembers = 1				--���Խ�����to� � ��С��������
x002937_g_TickTime = 1						--�ص��ű�to� � ʱ��ʱ��(��λ:  gi�y/��)
x002937_g_DayTime = 3						--m�t ���ڿ��Խ��븱��to� � ����
x002937_g_LimitTotalHoldTime = 360--�������Դ��to� � ʱ��(��λ: ����),�����ʱ�䵽��,�����񽫻�th�t b�i
x002937_g_LimitTimeSuccess = 500	--����ʱ������(��λ: ����),�����ʱ�䵽��,�������
x002937_g_CloseTick = 3						--�����ر�ǰ����ʱ(��λ: ����)
x002937_g_NoUserTime = 300				--������û���˺���Լ�������to� � ʱ��(��λ:  gi�y)
x002937_g_DeadTrans = 0						--����ת��ģʽ,0: �����󻹿��Լ���T�i ����,1: ������ǿ���Ƴ�����
x002937_g_Fuben_X = 15						--���븱��to� � λ��X
x002937_g_Fuben_Z = 33						--���븱��to� � λ��Z
x002937_g_Back_X = 253							--Դ����λ��X
x002937_g_Back_Z = 178						--Դ����λ��Z
x002937_g_Back_SceneId = 2				--Դ����Id

--**********************************
--������ں���
--**********************************
function x002937_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			--AddText(sceneId,"#{yanziwu_info}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetName(sceneId, targetId) ~= x002937_g_Name  then
		return
	end

	-- �������to� � ���,������͵���ͬto� � ����
	-- 2,��������ng����ng�����
	if GetTeamSize(sceneId,selfId) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi�u chi�nɱ��");
			AddText(sceneId,"  ��ս�����쳣,����3���ҿɲ��������ǽ���.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 3,��������ng����ng�ӳ�
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi�u chi�nɱ��");
			AddText(sceneId,"  �������ng�ӳ�����.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 4,�����ng����ng�˶���λ��
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi�u chi�nɱ��");
			AddText(sceneId,"  ����еi vi�n ��T�i ����.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--5,��������ͷto� � ÿc�i�����ng����ng����60����
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)

	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		if GetLevel(sceneId,nPlayerId) < 60  then
			BeginEvent(sceneId)
				AddText(sceneId,"#BKhi�u chi�nɱ��");
				AddText(sceneId,"  ��ս�����쳣,����60���ҿɲ��������ǽ���.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return
		end
	end

	-- ÿ��ֻ��3��
	--MD_SSLT_TIMES		=	244  -- ÿ�����Khi�u chi�n������̨to� � ����
	--MD_PRE_SSLT_TIME	=	245  -- ��m�t ��ȥKhi�u chi�n������̨to� � ʱ��

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
		
		local nTimes = GetMissionData(sceneId,nPlayerId, MD_SSLT_TIMES) 
		local nPreTime = GetMissionData(sceneId,nPlayerId, MD_PRE_SSLT_TIME)
		local nCurTime = LuaFnGetCurrentTime()
		if (nCurTime - nPreTime  >= 3600*24)  or
			 (floor((nCurTime-x002937_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x002937_TIME_2000_01_03_)/(3600*24)))   then
			nTimes = 0
			nPreTime = nCurTime
			SetMissionData(sceneId, nPlayerId, MD_SSLT_TIMES, nTimes)
			SetMissionData(sceneId, nPlayerId, MD_PRE_SSLT_TIME, nPreTime)
		end
		
		if nTimes >= x002937_g_DayTime then
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
					szAllName = szAllName .. "��" .. strName[i]
				end
				nCount = nCount+1
			end
		end
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi�u chi�nɱ��");
			AddText(sceneId,"  C�a ng߽i ������" .. szAllName .. "�����Ѿ��μӹ�3��Khi�u chi�nɱ��ս��.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	
	end
	
	-- ����to� � ���ͨ��,
	x002937_MakeCopyScene(sceneId, selfId)
	
end

--**********************************
--�о��¼�
--**********************************
function x002937_OnEnumerate( sceneId, selfId, targetId )
	-- ���T�i ������m�t c�iT�n�ж�
	if GetName(sceneId, targetId) == x002937_g_Name  then
		AddNumText( sceneId, x002937_g_ScriptId, "Khi�u chi�nɱ��",10 ,-1  )
		AddNumText( sceneId, x002937_g_ScriptId, "����Khi�u chi�nɱ��",8 ,1  )
	end
end

--**********************************
--���Ti�p th�����
--**********************************
function x002937_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ�������ng��Ҫ���븱��
--**********************************
function x002937_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--Ti�p th�
--**********************************
function x002937_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x002937_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x002937_MakeCopyScene( sceneId, selfId )
	
	-- ʹ��еi vi�n to� � �ȼ����������to� � �ȼ�
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
	LuaFnSetSceneLoad_Map(sceneId, "shengsileitai.nav"); --��ͼ��ng����ѡȡto� � ,���ұ���T�i Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x002937_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x002937_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x002937_g_CopySceneType);--���ø�������,���ｫ0������to� � ��������Ϊ999,���ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x002937_g_ScriptId);--��1����������Ϊ���������¼��ű���
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

	-- ʹ�õ�13λ,��¼����ʵ��to� � �ȼ�
	LuaFnSetCopySceneData_Param(sceneId, x002937_g_SceneData_7, mylevel)
	
	--���ó�����to� � ����Npc������
	LuaFnSetSceneLoad_Area( sceneId, "shengsileitai_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "shengsileitai_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ�!");
		else
			AddText(sceneId,"���������Ѵ�����,���Ժ�����!");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--�����¼�
--**********************************
function x002937_OnCopySceneReady( sceneId, destsceneId )

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
		x002937_GotoScene(sceneId, leaderObjId, destsceneId)
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			x002937_GotoScene(sceneId, leaderObjId, destsceneId)
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				x002937_GotoScene(sceneId, mems[i], destsceneId)
			end
		end
	end

end

function x002937_GotoScene(sceneId, ObjId, destsceneId)
	NewWorld( sceneId, ObjId, destsceneId, x002937_g_Fuben_X, x002937_g_Fuben_Z) ;
end


--**********************************
--����ҽ��븱���¼�
--**********************************
function x002937_OnPlayerEnter( sceneId, selfId )
	-- 3,��� gi�y����¼�
	
	-- �������to� � ��ӪΪ 109
	SetUnitCampID(sceneId, selfId, selfId, 109)
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x002937_g_Fuben_X, x002937_g_Fuben_Z )
	
	local nTimes = GetMissionData(sceneId,selfId, MD_SSLT_TIMES) 
	local nPreTime = GetMissionData(sceneId,selfId, MD_PRE_SSLT_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	
	SetMissionData(sceneId, selfId, MD_SSLT_TIMES, nTimes+1) 
	SetMissionData(sceneId, selfId, MD_PRE_SSLT_TIME, nCurTime)
	
end

--**********************************
--�����T�i �����������¼�
--**********************************
function x002937_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x002937_OnAbandon( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x002937_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--�����ng������ύ
--**********************************
function x002937_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x002937_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x002937_OnDie( sceneId, objId, killerId )
	
end

--**********************************
--��ʾ���и��������
--**********************************
function x002937_TipAllHuman( sceneId, Str )
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
function x002937_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--���������¼�
--**********************************
function x002937_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x002937_OnItemChanged( sceneId, selfId, itemdataId )
	
end



