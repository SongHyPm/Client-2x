--����ɽNPC
--����NPC
--����С�Ӳ߻�

--�ű���
x002955_g_ScriptId = 002955

--��ӵ��to� � �¼�ID�б�
x002955_g_eventList={250507}
--**********************************
--�¼��б�
--**********************************
function x002955_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n߽ng "
	else
		PlayerSex = " c�c h�"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  #75��С�� �i�m��������������.")
		for i, eventId in x002955_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002955_OnDefaultEvent( sceneId, selfId,targetId )
	x002955_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x002955_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002955_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x002955_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002955_g_eventList do
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
function x002955_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x002955_g_eventList do
		if missionScriptId == findId then
			x002955_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x002955_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002955_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x002955_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002955_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002955_OnDie( sceneId, selfId, killerId )
end
