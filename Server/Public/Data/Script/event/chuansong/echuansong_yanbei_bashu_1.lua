
x400121_g_ScriptId = 400121


x400121_left 	=138.0000
x400121_right	=141.0000

x400121_top  	=259.0000
x400121_bottom=262.0000

--��ҽ���m�t c�i area ʱ����
function x400121_OnEnterArea( sceneId, selfId,a,b )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400121_g_ScriptId);
		UICommand_AddString(sceneId, "GotoGumu");
		UICommand_AddString(sceneId, "������ĹΪ����ɱ������,��ע�ⰲȫ.��ȷ��Ҫ������?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 159,68,95)
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400121_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400121_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400121_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400121_GotoGumu( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	
	-- ��������ng����ng��T�i C�i n�y ��Χ��
	if sceneId ~= 19   then
		--Ng߽i �� kh�ng � khu v�c v�n chuy�n.
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� kh�ng � khu v�c v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400121_left or
			targetX > x400121_right or
			targetZ < x400121_top  or
			targetZ > x400121_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� kh�ng � khu v�c v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 159,68,95,21)
		
end
