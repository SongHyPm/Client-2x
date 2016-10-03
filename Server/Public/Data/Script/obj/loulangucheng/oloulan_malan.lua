--L�u LanNPC....
--��⿴�ʦ....

--�ű���
x001113_g_ScriptId = 001113

--��ӵ��to� � �¼�Id�б�
--elevelup_pengren = 713561
--edialog_pengren = 713601
--��ӵ��to� � �¼�ID�б�
x001113_g_eventList={713561,713601}

--**********************************
--�¼��б�
--**********************************
function x001113_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{LLGC_20080324_06}")
	for i, eventId in x001113_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001113_OnDefaultEvent( sceneId, selfId,targetId )
	x001113_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x001113_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001113_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001113_g_ScriptId )
		return
	end
end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x001113_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001113_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,ABILITY_PENGREN )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x001113_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x001113_g_eventList do
		if missionScriptId == findId then
			x001113_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x001113_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001113_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x001113_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001113_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
