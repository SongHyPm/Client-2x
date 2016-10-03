-- 899001
-- ��̫�� ��կ������

--�ű���
x899001_g_scriptId = 899001

--��ӵ�е��¼�ID�б�
x899001_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x899001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  ���Ǹ��ر��ص��ˡ�")
	
	AddNumText( sceneId, x899001_g_scriptId, "��������",0 ,1  )
	
	for i, eventId in x899001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x899001_OnDefaultEvent( sceneId, selfId,targetId )
	x899001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x899001_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 1  then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 161, 105, 10 )
		return
	end

	for i, findId in x899001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x899001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x899001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x899001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x899001_g_eventList do
		if missionScriptId == findId then
			x899001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x899001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x899001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x899001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x899001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x899001_OnDie( sceneId, selfId, killerId )
end

