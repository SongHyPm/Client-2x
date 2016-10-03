--�ع��Ĳ�NPC
--����
--����С�Ӳ߻�

--�ű���
x002946_g_ScriptId = 000102

--��ӵ��to� � �¼�ID�б�
x002946_g_eventList={250507}
--**********************************
--�¼��б�
--**********************************
function x002946_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n߽ng "
	else
		PlayerSex = " c�c h� "
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  #77Kh�ng ph�i"..PlayerName..PlayerSex.."sao, m�t ch�t ta ���c! Nghe n�i h�i t� � T�ng Ho�ng иa Cung 4 ki�m so�t kinh nghi�m, l�o n߽ng ng�n d�m xa x�i t� L�c D߽ng t�i ��y, l�m phi�n ng߽i chuy�n c�o v�i h�n, m� h�n g�i v� nh� �n c�m.")
		for i, eventId in x002946_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002946_OnDefaultEvent( sceneId, selfId,targetId )
	x002946_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x002946_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002946_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x002946_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002946_g_eventList do
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
function x002946_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x002946_g_eventList do
		if missionScriptId == findId then
			x002946_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x002946_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002946_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x002946_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002946_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002946_OnDie( sceneId, selfId, killerId )
end
