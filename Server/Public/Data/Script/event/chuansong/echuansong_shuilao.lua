--��ҽ���m�t c�i area ʱ����
function x400914_OnEnterArea( sceneId, selfId )
--misIndex = GetMissionIndexByID(sceneId,selfId,4013)
--num = GetMissionParam(sceneId,selfId,misIndex,0)
--if	num == 1 then
--	NewWorld( sceneId, selfId, 0, 234, 69 )
--else
--	CallScriptFunction((231000), "OnAbandon",sceneId, selfId)
--end

--	BeginEvent(sceneId)
--		AddText(sceneId,"  ��X�c nh�nҪ�뿪ˮ����?")
--		AddNumText(sceneId,g_scriptId,"X�c nh�n",2,0)
--		AddNumText(sceneId,g_scriptId,"Hu� b�",2,1)
--	EndEvent( )
--	DispatchEventList(sceneId,selfId,targetId)

	misIndex = GetMissionIndexByID(sceneId,selfId,1213)
	num = GetMissionParam(sceneId,selfId,misIndex,0)
	if	num == 1 then
		NewWorld( sceneId, selfId, 4, 52, 96 )
	else
		CallScriptFunction((232002), "OnAbandon",sceneId, selfId)
	end
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400914_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400914_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400914_OnLeaveArea( sceneId, selfId )
end

----**********************************
----�¼��б�ѡ��m�t ��
----**********************************
--function OnEventRequest( sceneId, selfId, targetId, eventId )
--	if	GetNumText()==0	then
--		if	IsHaveMission( sceneId, selfId, 4012)>0	 then
--			misIndex = GetMissionIndexByID(sceneId,selfId,4013)
--			num = GetMissionParam(sceneId,selfId,misIndex,0)
--			if	num == 1 then
--				NewWorld( sceneId, selfId, 0, 234, 69 )
--			else
--				CallScriptFunction((231000), "OnAbandon",sceneId, selfId)
--			end
--		end
--	end
--end
