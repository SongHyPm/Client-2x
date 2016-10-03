--����ճû��

--�ű���
x022004_g_scriptId = 022004

--��ӵ��to� � �¼�ID�б�
x022004_g_eventList={212110}--211304	

--**********************************
--�¼��б�
--**********************************
function x022004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  Ng�t Thu�t t�n ti�u t� n�y, l�m m�t m�n � quan tr�ng c�a ta, tr߾c gi� c� ng� h�n r�t th�ng minh, th� ra so v�i ta kh�ng kh�c l� bao.")
	for i, eventId in x022004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x022004_OnDefaultEvent( sceneId, selfId,targetId )
	x022004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x022004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x022004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022004_g_eventList do
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
function x022004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x022004_g_eventList do
		if missionScriptId == findId then
			x022004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x022004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x022004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x022004_OnDie( sceneId, selfId, killerId )
end
