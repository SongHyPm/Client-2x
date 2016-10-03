--��i L�NPC		��ҩnpc		1ѧϰ��ҩ����		2��ҽ����� �i�m�
--������
--��ͨ

--�ű���
x002060_g_ScriptId = 002060

--��ӵ��to� � �¼�Id�б�
--estudy_zhiyao = 713503
--elevelup_zhiyao = 713562
--edialog_zhiyao = 713602
--��ӵ��to� � �¼�ID�б�
x002060_g_eventList={713503,713562,713602}
--**********************************
--�¼��б�
--**********************************
function x002060_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_dali_0034}")
	for i, eventId in x002060_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002060_OnDefaultEvent( sceneId, selfId,targetId )
	x002060_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x002060_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002060_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x002060_g_ScriptId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x002060_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002060_g_eventList do
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
function x002060_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x002060_g_eventList do
		if missionScriptId == findId then
			x002060_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x002060_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002060_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x002060_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002060_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002060_OnDie( sceneId, selfId, killerId )
end
