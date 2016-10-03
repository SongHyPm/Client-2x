--T� Ch�uNPC
--����ʹ
--����ѭ������

--�ű���
x311007_g_scriptId = 311007

--��ӵ��to� � �¼�ID�б�
x311007_g_eventList={311010}	

--Nhi�m v� R�a-Th� thi ch�y��
x311007_g_MissionId			= 1000
--Nhi�m v� R�a-Th� thi ch�y�¼��б�
x311007_g_GodFireEventList={}		-- 808081
--ÿ��R�a-Th� thi ch�y�M� ra ʱ��
x311007_g_ActivityTime		= { {tstart=1230, tend=1330},
														  {tstart=1930, tend=2030},
														  {tstart=2130, tend=2230} }

--Nhi�m v� R�a-Th� thi ch�y��ɱ��
x311007_g_Mission_IsComplete = 0	--�������to� � ��0λ
--R�a-Th� thi ch�yL�c D߽ng�򿨱��
x311007_g_LuoYang_RecordIdx = 1		--�������to� � ��1λ
--R�a-Th� thi ch�yT� Ch�u�򿨱��
x311007_g_SuZhou_RecordIdx = 2		--�������to� � ��2λ
--R�a-Th� thi ch�y��i L��򿨱��
x311007_g_DaLi_RecordIdx = 3			--�������to� � ��3λ
--����������������
x311007_g_KongMing_Lighten = 4		--�������to� � ��4λ
--R�a-Th� thi ch�y��������ÿ���������
x311007_g_RoundIndex = 7					--�������to� � ��7λ

--C�n  �i�mȼ������to� � ����
x311007_g_KongMing_CntMax	 = 24

--**********************************
--�¼��б�
--**********************************
function x311007_UpdateEventList( sceneId, selfId, targetId )

	for i, eventId in x311007_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
	end

end

--**********************************
--�¼��������
--**********************************
function x311007_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		--  �i�mȼT� Ch�u��Դ
		if x311007_OnIsFillPlayCard(sceneId, selfId, targetId) == 1 then

			local misIndex = GetMissionIndexByID(sceneId,selfId,x311007_g_MissionId)
			SetMissionByIndex(sceneId, selfId, misIndex, x311007_g_SuZhou_RecordIdx, 1)
			x311007_NotifyTip( sceneId, selfId, "#{GodFire_Info_003}" )
			
			-- ���������ng�����
			if GetMissionParam(sceneId, selfId, misIndex, x311007_g_LuoYang_RecordIdx) == 1
				 and GetMissionParam(sceneId, selfId, misIndex, x311007_g_SuZhou_RecordIdx) == 1
				 and GetMissionParam(sceneId, selfId, misIndex, x311007_g_DaLi_RecordIdx) == 1 then
				
				-- �����ng�� �i�mȼ���п�����
				if GetMissionParam(sceneId, selfId, misIndex, x311007_g_KongMing_Lighten) >= x311007_g_KongMing_CntMax then								
					-- �������
					AddText( sceneId, "#{GodFire_Info_028}" )
					SetMissionByIndex( sceneId, selfId, misIndex, x311007_g_Mission_IsComplete, 1 )
				else
					AddText( sceneId, "#{GodFire_Info_037}" )
				end
			else
				--  �i�mȼ��Դ
				AddText( sceneId, "#{GodFire_Info_010}" )
			end
			
		else
			AddText( sceneId, "#{function_caoyun_1}" )
			AddNumText( sceneId, x311007_g_scriptId, "T�m hi�u T�o v�n", 11, 1 )
			AddNumText( sceneId, x311007_g_scriptId, "B�t �u T�o v�n", 7, 2 )
			
			for i, eventId in x311007_g_GodFireEventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
		end
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x311007_OnEventRequest( sceneId, selfId, targetId, eventId )
	local NumText = GetNumText();
	if NumText == 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_052}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif NumText == 2 then
		x311007_UpdateEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x311007_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnHandle_QuestUI",sceneId, selfId, targetId, NumText )
			return
		end
	end
	
	for i, findId in x311007_g_GodFireEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			
			return 0
		end
	end
	
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x311007_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311007_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			return
		end
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x311007_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,�رնԻ�����
	return
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x311007_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311007_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x311007_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x311007_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x311007_OnDie( sceneId, selfId, killerId )
end


-- ���R�a-Th� thi ch�y���ݻ��ng��Th�a m�n������
function x311007_OnIsFillPlayCard(sceneId, selfId, targetId)

  --���������ng����Nhi�m v� R�a-Th� thi ch�y
	if IsHaveMission( sceneId, selfId, x311007_g_MissionId ) <= 0 then				
		return 0
	end

	--�����Ҳμӻto� � ʱ��
	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime ~= nDay then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x311007_g_MissionId)
	
	--��⵱��μ�to� � ��ng�ڼ���
	local nRoundIdx = GetMissionParam(sceneId, selfId, misIndex, x311007_g_RoundIndex)

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute

	if curHourTime < x311007_g_ActivityTime[nRoundIdx].tstart or curHourTime > x311007_g_ActivityTime[nRoundIdx].tend then
		return 0
	end
	
	--�����ng��T�i T� Ch�u�����
	if GetMissionParam(sceneId, selfId, misIndex, x311007_g_SuZhou_RecordIdx) == 1 then
		return 0
	end
	
	return 0
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x311007_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
