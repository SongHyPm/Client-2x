--Tung S�n ����

--�ű���
--g_scriptId = 003008

--��ӵ��to� � �¼�ID�б�
x003008_g_eventList={}--210808} --212603,212606,210807

--**********************************
--�¼��б�
--**********************************
function x003008_UpdateEventList( sceneId, selfId,targetId )
    BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
    AddText(sceneId,"  ��y l� Tung S�n r�i, c�c h� c� bi�t T�ng D߽ng th� vi�n n�m � ��u kh�ng?")

	for i, eventId in x003008_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x003008_OnDefaultEvent( sceneId, selfId,targetId )
	x003008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x003008_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x003008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x003008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x003008_g_eventList do
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
function x003008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x003008_g_eventList do
		if missionScriptId == findId then
			x003008_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x003008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x003008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x003008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x003008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x003008_OnDie( sceneId, selfId, killerId )
end
