x400003_g_ScriptId = 400003

x400003_left 	=59.0000
x400003_right	=68.0000

x400003_top  	=266.0000
x400003_bottom	=275.0000


--��ҽ���m�t c�i area ʱ����
function x400003_OnEnterArea( sceneId, selfId )

        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400003_g_ScriptId);
		UICommand_AddString(sceneId, "GotoJinghu");
		UICommand_AddString(sceneId, "#{QZDZCS_100724}");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,277,46)
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400003_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400003_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400003_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400003_GotoJinghu( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	
	-- ��������ng����ng��T�i C�i n�y ��Χ��
	--if sceneId ~= 1   then
		--Kh�ng th� d�ch chuy�n �n khu v�c y�u c�u.
		--BeginEvent(sceneId)
			--AddText(sceneId,"Kh�ng th� d�ch chuy�n �n khu v�c y�u c�u.")
--		EndEvent(sceneId)
	--	DispatchMissionTips(sceneId,selfId)
		--return
	--end
	
	--local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	--if 	targetX < x400003_left or
		--	targetX > x400003_right or
			--targetZ < x400003_top  or
			--targetZ > x400003_bottom   then
		
--		BeginEvent(sceneId)
	--		AddText(sceneId,"Kh�ng th� d�ch chuy�n �n khu v�c y�u c�u.")
		--EndEvent(sceneId)
		--DispatchMissionTips(sceneId,selfId)
		--return
			
	--end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,277,46)
		
end

