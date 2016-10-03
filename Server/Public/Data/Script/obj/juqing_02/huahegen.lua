--��ٹȻ�����

--�ű���
x118012_g_scriptId = 118012

--��ӵ��to� � �¼�ID�б�
x118012_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x118012_UpdateEventList( sceneId, selfId,targetId )
	
	--PrintStr("ddd")

	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_WJG_B_001}")
		AddNumText(sceneId, x118012_g_scriptId,"��a ta ra c�a",9,-1);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x118012_OnDefaultEvent( sceneId, selfId,targetId )
	x118012_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x118012_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, sceneId,109,115)
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x118012_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118012_g_eventList do
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
function x118012_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x118012_g_eventList do
		if missionScriptId == findId then
			x118012_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x118012_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x118012_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x118012_OnDie( sceneId, selfId, killerId )
end
