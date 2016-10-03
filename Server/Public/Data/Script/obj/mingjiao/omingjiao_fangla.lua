--����

--�ű���
x011001_g_scriptId = 011001

--��ӵ��to� � �¼�ID�б�
x011001_g_eventList={222901}
--x011001_g_eventList={}--201012,201111,201411,201412,201611,201612		

--**********************************
--�¼��б�
--**********************************
function x011001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  C�c h� ! Tr�n �߶ng l�n Quang Minh ��nh c� nh�n th�y quan qu�n kh�ng?");
	for i, eventId in x011001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x011001_OnDefaultEvent( sceneId, selfId,targetId )
	x011001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x011001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x011001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x011001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x011001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x011001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x011001_g_eventList do
		if missionScriptId == findId then
			x011001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x011001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x011001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x011001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x011001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x011001_OnDie( sceneId, selfId, killerId )
end
