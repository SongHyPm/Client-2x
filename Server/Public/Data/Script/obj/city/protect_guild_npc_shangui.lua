--��������פ��
--��ͨ

--�ű���
x805043_g_ScriptId	= 805043

--��ӵ��to� � �¼�ID�б�
x805043_g_EventList	= { 805042 }


--��ȡ����to� � ��͵�c�p
x805043_g_minLevel			= 20

--**********************************
--�¼��б�
--**********************************
function x805043_UpdateEventList( sceneId, selfId, targetId )

		CallScriptFunction( x805043_g_EventList[1], "OnEnumerate", sceneId, selfId, targetId )
	
end

--**********************************
--�¼��������
--**********************************
function x805043_OnDefaultEvent( sceneId, selfId, targetId )
	x805043_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x805043_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x805043_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x805043_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x805043_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end

end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x805043_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x805043_g_EventList do
		if missionScriptId == findId then
			x805043_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--����(�Ѿ���������)
--**********************************
function x805043_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x805043_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--�ύ������to� � ����
--**********************************
function x805043_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x805043_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--�����¼�
--**********************************
function x805043_OnDie( sceneId, selfId, killerId )
end
