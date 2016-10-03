--³ƽ


--�ű���
x031005_g_scriptId = 031005

--��ӵ��to� � �¼�ID�б�
x031005_g_eventList={212109}

--**********************************
--�¼��б�
--**********************************
function x031005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"M�ng 5 th�ng 5 �i�n Tr߶ng Sinh, n�a ��m kh�ng ng߶i l� l�c n�i chuy�n m�t.")
	for i, eventId in x031005_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x031005_OnDefaultEvent( sceneId, selfId,targetId )
	x031005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x031005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x031005_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x031005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031005_g_eventList do
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
function x031005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x031005_g_eventList do
		if missionScriptId == findId then
			x031005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x031005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x031005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x031005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x031005_OnDie( sceneId, selfId, killerId )
end

