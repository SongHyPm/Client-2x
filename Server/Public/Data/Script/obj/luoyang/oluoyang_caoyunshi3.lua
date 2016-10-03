--��i L�NPC
--����ʹ
--����ѭ������

--�ű���
x311008_g_scriptId = 311008

--��ӵ��to� � �¼�ID�б�
x311008_g_eventList={311010}	

--Nhi�m v� R�a-Th� thi ch�y��
x311008_g_MissionId			= 1000
--Nhi�m v� R�a-Th� thi ch�y�¼��б�
x311008_g_GodFireEventList={}		-- 808082
--ÿ��R�a-Th� thi ch�y�M� ra ʱ��
x311008_g_ActivityTime		= { {tstart=1230, tend=1330},
														  {tstart=1930, tend=2030},
														  {tstart=2130, tend=2230} }

--Nhi�m v� R�a-Th� thi ch�y��ɱ��
x311008_g_Mission_IsComplete = 0	--�������to� � ��0λ
--R�a-Th� thi ch�yL�c D߽ng�򿨱��
x311008_g_LuoYang_RecordIdx = 1		--�������to� � ��1λ
--R�a-Th� thi ch�yT� Ch�u�򿨱��
x311008_g_SuZhou_RecordIdx = 2		--�������to� � ��2λ
--R�a-Th� thi ch�y��i L��򿨱��
x311008_g_DaLi_RecordIdx = 3			--�������to� � ��3λ
--����������������
x311008_g_KongMing_Lighten = 4		--�������to� � ��4λ
--Nhi�m v� R�a-Th� thi ch�yÿ���������
x311008_g_RoundIndex = 7					--�������to� � ��7λ

--C�n  �i�mȼ������to� � ����
x311008_g_KongMing_CntMax	 = 24

--**********************************
--�¼��б�
--**********************************
function x311008_UpdateEventList( sceneId, selfId, targetId )

	for i, eventId in x311008_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
	end

end

--**********************************
--�¼��������
--**********************************
function x311008_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		--  �i�mȼ��i L���Դ
		if x311008_OnIsFillPlayCard(sceneId, selfId, targetId) == 1 then

			local misIndex = GetMissionIndexByID(sceneId,selfId,x311008_g_MissionId)
			SetMissionByIndex(sceneId, selfId, misIndex, x311008_g_DaLi_RecordIdx, 1)
			x311008_NotifyTip( sceneId, selfId, "#{GodFire_Info_020}" )
			
			-- ���������ng�����
			if GetMissionParam(sceneId, selfId, misIndex, x311008_g_LuoYang_RecordIdx) == 1
				 and GetMissionParam(sceneId, selfId, misIndex, x311008_g_SuZhou_RecordIdx) == 1
				 and GetMissionParam(sceneId, selfId, misIndex, x311008_g_DaLi_RecordIdx) == 1 then
				
				-- �����ng�� �i�mȼ���п�����
				if GetMissionParam(sceneId, selfId, misIndex, x311008_g_KongMing_Lighten) >= x311008_g_KongMing_CntMax then								
					-- �������
					AddText( sceneId, "#{GodFire_Info_028}" )
					SetMissionByIndex( sceneId, selfId, misIndex, x311008_g_Mission_IsComplete, 1 )
				else
					AddText( sceneId, "#{GodFire_Info_037}" )
				end
			else
				--  �i�mȼ��Դ
				AddText( sceneId, "#{GodFire_Info_010}" )
			end
			
		else
			AddText( sceneId, "#{function_caoyun_2}" )
			AddNumText( sceneId, x311008_g_scriptId, "T�m hi�u T�o v�n", 11, 1 )
			AddNumText( sceneId, x311008_g_scriptId, "B�t �u T�o v�n", 7, 2 )
			
			for i, eventId in x311008_g_GodFireEventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
		end
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x311008_OnEventRequest( sceneId, selfId, targetId, eventId )
	local NumText = GetNumText();
	if NumText == 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_053}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif NumText == 2 then
		x311008_UpdateEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x311008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnHandle_QuestUI",sceneId, selfId, targetId, NumText )
			return
		end
	end
	
	for i, findId in x311008_g_GodFireEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			
			return 0
		end
	end
	
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x311008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311008_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			return
		end
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x311008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,�رնԻ�����
	return
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x311008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311008_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x311008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x311008_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x311008_OnDie( sceneId, selfId, killerId )
end


-- ���R�a-Th� thi ch�y���ݻ��ng��Th�a m�n������
function x311008_OnIsFillPlayCard(sceneId, selfId, targetId)

  --���������ng����Nhi�m v� R�a-Th� thi ch�y
	if IsHaveMission( sceneId, selfId, x311008_g_MissionId ) <= 0 then				
		return 0
	end

	--�����Ҳμӻto� � ʱ��
	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime ~= nDay then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x311008_g_MissionId)
	
	--��⵱��μ�to� � ��ng�ڼ���
	local nRoundIdx = GetMissionParam(sceneId, selfId, misIndex, x311008_g_RoundIndex)

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute

	if curHourTime < x311008_g_ActivityTime[nRoundIdx].tstart or curHourTime > x311008_g_ActivityTime[nRoundIdx].tend then
		return 0
	end
	
	--�����ng��T�i ��i L������
	if GetMissionParam(sceneId, selfId, misIndex, x311008_g_DaLi_RecordIdx) == 1 then
		return 0
	end
	
	return 0
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x311008_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
