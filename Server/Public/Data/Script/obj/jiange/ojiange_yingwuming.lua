-- 007112
-- Ӯ���� �m�t �

--�ű���
x007112_g_scriptId = 007112

--��ӵ��to� � �¼�ID�б�
x007112_g_eventList= 212221



--**********************************
--�¼��б�
--**********************************
function x007112_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		msg = "#{DG_8724_2}"
		AddText(sceneId,msg);
		for i, eventId in x007112_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x007112_OnDefaultEvent( sceneId, selfId,targetId )
	x007112_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x007112_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x007112_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x007112_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x007112_g_eventList do
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
--�ܾ���NPCto� � ����
--**********************************
function x007112_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x007112_g_eventList do
		if missionScriptId == findId then
			x007112_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--����(�Ѿ���������)
--**********************************
function x007112_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x007112_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x007112_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x007112_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x007112_OnDie( sceneId, selfId, killerId )
end

