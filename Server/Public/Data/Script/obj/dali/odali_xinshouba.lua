--���ү

--�ű���
x002032_g_scriptId = 002032


--��ӵ�е��¼�ID�б�
x002032_g_eventList={210210,210211,210212}

--**********************************
--�¼��б�
--**********************************
function x002032_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local PlayerName=GetName(sceneId,selfId)	
	local PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " mu�i mu�i"
	else
		PlayerSex = " huynh �"
	end
	AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0014}")
	for i, eventId in x002032_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x002032_g_scriptId, "Ho�t �ng T�n ho�ng chi�n th�n", 6, 200 )
	AddNumText( sceneId, x002032_g_scriptId, "Xoa ho�t �ng T�n ho�ng chi�n th�n", 6, 201 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002032_OnDefaultEvent( sceneId, selfId,targetId )
	x002032_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002032_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	for i, findId in x002032_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	if nNumText == 200 then
		BeginEvent(sceneId)
			--5965 Chan.Trung Lau Ngoc
			--5952 TLGioi
			--5953 TLNgoc
			--20000-21000 Co tan hoang chien than
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 5970) == 0 then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5970, 0 )
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 ) --Hieu ung thang cap
				--CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
				AddText(sceneId,"  Ch�c m�ng c�c h� �� nh�n hi�u �ng c�a ho�t �ng T�n ho�ng chi�n th�n th�nh c�ng, h�y b�n t�u giang h� Thi�n Long B�t B� c�ng n� nh�!")
			else
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 49, 0 ) --Hieu ung thang cap vo hon
				AddText(sceneId,"  C�c h� �ang gi� tr�n ng߶i tr�ng th�i n�y r�i!")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if nNumText == 201 then
		BeginEvent(sceneId)
			for i=5000,5970 do
			LuaFnCancelSpecificImpact(sceneId,selfId,i)
			end
			AddText(sceneId,"  Xoa OK")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002032_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002032_g_eventList do
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
--�ܾ���NPC������
--**********************************
function x002032_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			x002032_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002032_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002032_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002032_OnDie( sceneId, selfId, killerId )
end
