-- 212142
-- ����

-- ��������  ����ǹ
-- ��ҵ�c�p���ڵ���20c�p,��ɡ�����ͬ�С�,�ӳ��Ҷ������Linh�����.


--************************************************************************
--MisDescBegin
--�ű���
x212142_g_ScriptId = 212142

x212142_g_MissionId = 964

--MisDescEnd
--************************************************************************

--��������
x212142_g_CopySceneName = "Bao v�y Nh�n M�n Quan"

x212142_g_CopySceneType = FUBEN_JUQING	--��������,����T�i ScriptGlobal.lua����

x212142_g_CopySceneMap = "gongdi.nav"
x212142_g_LimitMembers = 1				--���Խ�����to� � ��С��������
x212142_g_TickTime = 5					--�ص��ű�to� � ʱ��ʱ��(��λ:  gi�y/��)
x212142_g_LimitTotalHoldTime = 360		--�������Դ��to� � ʱ��(��λ: ����),�����ʱ�䵽��,�����񽫻�th�t b�i
x212142_g_LimitTimeSuccess = 500		--����ʱ������(��λ: ����),�����ʱ�䵽��,�������
x212142_g_CloseTick = 3					--�����ر�ǰ����ʱ(��λ: ����)
x212142_g_NoUserTime = 300				--������û���˺���Լ�������to� � ʱ��(��λ:  gi�y)
x212142_g_DeadTrans = 0					--����ת��ģʽ,0: �����󻹿��Լ���T�i ����,1: ������ǿ���Ƴ�����
x212142_g_Fuben_X = 18					--���븱��to� � λ��X
x212142_g_Fuben_Z = 47					--���븱��to� � λ��Z
x212142_g_Back_X = 262					--Դ����λ��X
x212142_g_Back_Z = 46					--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x212142_OnDefaultEvent( sceneId, selfId, targetId )
	-- ��������,�Լ���ng�ӳ�,����3��,
	--1,����Լ���ng����ngT�i ������
	if GetTeamSize(sceneId,selfId) < x212142_g_LimitMembers  then
		BeginEvent(sceneId)
			AddText(sceneId,"  Mu�n ti�n v�o b�n sao n�y, c�c h� c�n m�t nh�m c� �t nh�t "..x212142_g_LimitMembers.." ng߶i, h�n n�a th�nh vi�n trong nh�m c�n c� t�ng c�ng �t nh�t "..x212142_g_LimitMembers.." ng߶i � g�n, c�c h� c�n c�n l� nh�m tr߷ng.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNearTeamCount(sceneId,selfId) < x212142_g_LimitMembers then
		BeginEvent(sceneId)
			AddText(sceneId,"  Mu�n ti�n v�o b�n sao n�y, c�c h� c�n m�t nh�m c� �t nh�t "..x212142_g_LimitMembers.." ng߶i, h�n n�a th�nh vi�n trong nh�m c�n c� t�ng c�ng �t nh�t "..x212142_g_LimitMembers.." ng߶i � g�n, c�c h� c�n c�n l� nh�m tr߷ng.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNearTeamCount(sceneId,selfId) < x212142_g_LimitMembers then
		BeginEvent(sceneId)
			AddText(sceneId,"  Mu�n ti�n v�o b�n sao n�y, c�c h� c�n m�t nh�m c� �t nh�t "..x212142_g_LimitMembers.." ng߶i, h�n n�a th�nh vi�n trong nh�m c�n c� t�ng c�ng �t nh�t "..x212142_g_LimitMembers.." ng߶i � g�n, c�c h� c�n c�n l� nh�m tr߷ng.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"  Mu�n ti�n v�o b�n sao n�y, c�c h� c�n m�t nh�m c� �t nh�t "..x212142_g_LimitMembers.." ng߶i, h�n n�a th�nh vi�n trong nh�m c�n c� t�ng c�ng �t nh�t "..x212142_g_LimitMembers.." ng߶i � g�n, c�c h� c�n c�n l� nh�m tr߷ng.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	x212142_MakeCopyScene(sceneId, selfId)
end

--**********************************
--�о��¼�
--**********************************
function x212142_OnEnumerate( sceneId, selfId, targetId )
	
	-- ���븱��to� � ����,��ҵ�c�p����20,������������ 
	if IsHaveMission( sceneId, selfId, x212142_g_MissionId ) > 0 then
		AddNumText( sceneId, x212142_g_ScriptId, "��a ta �n bao v�y Nh�n M�n Quan", 10 ,-1 )
	end
	
end

--**********************************
--���Ti�p th�����
--**********************************
function x212142_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ�������ng��Ҫ���븱��
--**********************************
function x212142_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--Ti�p th�
--**********************************
function x212142_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x212142_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x212142_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "gongdi.nav"); --��ͼ��ng����ѡȡto� � ,���ұ���T�i Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x212142_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x212142_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x212142_g_CopySceneType);--���ø�������,���ｫ0������to� � ��������Ϊ999,���ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x212142_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--���ø����رձ�־, 0����,1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --��������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--ɱ��Bossto� � ����
	
	-- �����õ�to� � �������
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	--���ó�����to� � ����Npc������
	LuaFnSetSceneLoad_Area( sceneId, "gongdishaolinmis_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "gongdishaolinmis_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D�ch chuy�n th�nh c�ng!");
		else
			AddText(sceneId,"S� l��ng b�n sao �� �n gi�i h�n, � ngh� l�t n�a th� l�i!");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--�����¼�
--**********************************
function x212142_OnCopySceneReady( sceneId, destsceneId )

	--���븱��to� � ����
	-- 1,���C�i n�y �ļ�û�����,�ʹ���C�i n�y �ļ��Լ����븱��
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
		return
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x212142_g_Fuben_X, x212142_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x212142_g_Fuben_X, x212142_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x212142_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--�����T�i �����������¼�
--**********************************
function x212142_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x212142_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �س�,ֻ��Th�nh ph� ���񸱱����Ե��ô˽ӿ�
--**********************************
function x212142_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x212142_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--�����ng������ύ
--**********************************
function x212142_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x212142_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x212142_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x212142_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x212142_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x212142_OnCopySceneTimer( sceneId, nowTime )
	--��⸱����to� � ����ng����ngɱ��,ɱ���Զ�����ҳ�����
	
	
end




