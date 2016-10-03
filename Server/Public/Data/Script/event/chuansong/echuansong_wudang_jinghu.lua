x400027_g_ScriptId = 400027

x400027_left 	=90.0000
x400027_right	=101.0000

x400027_top  	=190.0000
x400027_bottom	=198.0000


--��ҽ���m�t c�i area ʱ����
function x400027_OnEnterArea( sceneId, selfId )
	if	GetLevel( sceneId, selfId)<20 then
		BeginEvent(sceneId)
			strText = "��ng c�p nh� h�n 20 kh�ng th� v�o khu v�c n�y"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else

        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400027_g_ScriptId);
		UICommand_AddString(sceneId, "GotoJinghu1");
		UICommand_AddString(sceneId, "#{QZDZCS_100724}");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,45,264, 20)
	end
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400027_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400027_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400027_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400027_GotoJinghu1( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	
	-- ��������ng����ng��T�i C�i n�y ��Χ��
	if sceneId ~= 12   then
		--Kh�ng th� d�ch chuy�n �n khu v�c y�u c�u.
		BeginEvent(sceneId)
			AddText(sceneId,"Kh�ng th� d�ch chuy�n �n khu v�c y�u c�u.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400027_left or
			targetX > x400027_right or
			targetZ < x400027_top  or
			targetZ > x400027_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Kh�ng th� d�ch chuy�n �n khu v�c y�u c�u.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,34,233, 20)
		
end
