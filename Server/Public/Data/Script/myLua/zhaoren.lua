--�������NPC
--����
--����С�Ӳ߻�

--�ű���
x002945_g_ScriptId = 000102

--��ӵ��to� � �¼�ID�б�
x002945_g_eventList={250507}
--**********************************
--�¼��б�
--**********************************
function x002945_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n߽ng "
	else
		PlayerSex = " c�c h�"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  #72�ⲻ��ng"..PlayerName..PlayerSex.."��,���������ˣ����to� � Ǻ���T�i ʥ��ˢKinh nghi�m,����ǧ��������T� Ch�u����,��Ҫ������to� � ��,�鷳��ת����: �������ؼҳԷ�!")
		for i, eventId in x002945_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002945_OnDefaultEvent( sceneId, selfId,targetId )
	x002945_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x002945_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002945_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x002945_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002945_g_eventList do
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
function x002945_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x002945_g_eventList do
		if missionScriptId == findId then
			x002945_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x002945_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002945_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x002945_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002945_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002945_OnDie( sceneId, selfId, killerId )
end
