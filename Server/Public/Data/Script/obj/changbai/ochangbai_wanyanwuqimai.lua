--����������

--�ű���
x022007_g_scriptId = 022007

--��ӵ��to� � �¼�ID�б�
x022007_g_eventList={}--211302	

--**********************************
--�¼��б�
--**********************************
function x022007_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  Ti�u qu�! N� nh�n �c �c......A, t�n M�p? ��ng c� l�i g�n ta.....c� еc! .....A! th�t l� ch�t ti�t.")
	for i, eventId in x022007_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x022007_OnDefaultEvent( sceneId, selfId,targetId )
	x022007_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x022007_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022007_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x022007_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022007_g_eventList do
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
function x022007_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x022007_g_eventList do
		if missionScriptId == findId then
			x022007_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x022007_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x022007_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x022007_OnDie( sceneId, selfId, killerId )
end
