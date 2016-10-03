x400123_g_ScriptId = 400123

x400123_left 	=290.0000
x400123_right	=292.0000

x400123_top  	=56.0000
x400123_bottom	=61.0000


--��ҽ���m�t c�i area ʱ����
function x400123_OnEnterArea( sceneId, selfId )

BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400123_g_ScriptId);
		UICommand_AddString(sceneId, "GotoPetisland_1");
		UICommand_AddString(sceneId, "Th�nh Th� S�nΪ����ɱ������,��ע�ⰲȫ.��ȷ��Ҫ������?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 158,233,225,21)
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400123_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400123_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400123_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400123_GotoPetisland_1( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	
	-- ��������ng����ng��T�i C�i n�y ��Χ��
	if sceneId ~= 39   then
		--Ng߽i �� kh�ng � khu v�c v�n chuy�n.
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� kh�ng � khu v�c v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400123_left or
			targetX > x400123_right or
			targetZ < x400123_top  or
			targetZ > x400123_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� kh�ng � khu v�c v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 158,233,225,21)
		
end
