--��ҽ���m�t c�i area ʱ����
function x400913_OnEnterArea( sceneId, selfId )
	if	IsHaveMission( sceneId, selfId, 702)>0	then
		CallScriptFunction((210222), "OnAbandon",sceneId, selfId)
	elseif	IsHaveMission( sceneId, selfId, 711)>0	then
		misIndex = GetMissionIndexByID(sceneId,selfId,711)
		num = GetMissionParam(sceneId,selfId,misIndex,0)
		if	num == 1 then
			NewWorld( sceneId, selfId, 2, 275, 50 )
		else
			CallScriptFunction((210231), "OnAbandon",sceneId, selfId)
		end

		--BeginEvent(sceneId)
		--	AddText(sceneId,"  ��X�c nh�nҪ�뿪ľ�˶�����?")
		--	AddNumText(sceneId,g_scriptId,"X�c nh�n",2,0)
		--	AddNumText(sceneId,g_scriptId,"Hu� b�",2,1)
		--EndEvent( )
		--DispatchEventList(sceneId,selfId,targetId)
	end
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400913_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400913_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400913_OnLeaveArea( sceneId, selfId )
end

----**********************************
----�¼��б�ѡ��m�t ��
----**********************************
--function OnEventRequest( sceneId, selfId, targetId, eventId )
--	if	GetNumText()==0	then
--		if	IsHaveMission( sceneId, selfId, 711)>0	 then
--			misIndex = GetMissionIndexByID(sceneId,selfId,711)
--			num = GetMissionParam(sceneId,selfId,misIndex,0)
--			if	num == 1 then
--				NewWorld( sceneId, selfId, 2, 275, 50 )
--			else
--				CallScriptFunction((210231), "OnAbandon",sceneId, selfId)
--			end
--		end
--	end
--end
