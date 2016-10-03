--Ǯ��

--�ű���
x002031_g_scriptId = 002031

x002031_g_startTime = 09097 --���ʼʱ��
x002031_g_EndTime   = 09150 --�����ʱ��

--��ӵ��to� � �¼�ID�б�
x002031_g_eventList={210205,210207,210208,050028,889054,889055,889056,889057}--210206,311100

--**********************************
--�¼��б�
--**********************************
function x002031_UpdateEventList( sceneId, selfId,targetId )
	
	local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " mu�i Mu�i"
	else
		PlayerSex = " huynh Ю"
	end
	
	BeginEvent(sceneId)
	local curDayTime = GetDayTime()
	if curDayTime >= x002031_g_startTime and curDayTime <= x002031_g_EndTime then
		AddText(sceneId,"#{XFMTL_20090319_05}")
	else
		AddText(sceneId,"#{OBJ_dali_0013}"..PlayerName..PlayerSex..", mu�n th� th�n th� kh�ng?")		--#r  T�i �²���,ȴҲ�С�������������to� � ����,�ԹŽ����½���֮�¶���֪m�t ��,����ʲô����,����Ծ���������.--#r  #r#r  �������Ҵ𡱣�����������m�t Щ������.  #r#r  ��������𡱣�����������������������.
	end
	for i, eventId in x002031_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002031_OnDefaultEvent( sceneId, selfId,targetId )
	x002031_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x002031_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002031_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x002031_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002031_g_eventList do
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
function x002031_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x002031_g_eventList do
		if missionScriptId == findId then
			x002031_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x002031_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002031_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x002031_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002031_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002031_OnDie( sceneId, selfId, killerId )
end
