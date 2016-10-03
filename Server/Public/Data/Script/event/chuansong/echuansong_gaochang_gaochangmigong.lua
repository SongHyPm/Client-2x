x400933_g_ScriptId = 400933

x400933_left 	=69.0000
x400933_right	=76.0000

x400933_top  	=141.0000
x400933_bottom	=148.0000


--��ҽ���m�t c�i area ʱ����
function x400933_OnEnterArea( sceneId, selfId,a,b )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400933_g_ScriptId);
		UICommand_AddString(sceneId, "GotoGaochangmigong");
		UICommand_AddString(sceneId, "�߲��Թ�Ϊ����ɱ������,��ע�ⰲȫ.��ȷ��Ҫ������?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 520,100,99)
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400933_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400933_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400933_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400933_GotoGaochangmigong( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	
	-- ��������ng����ng��T�i C�i n�y ��Χ��
	if sceneId ~= 424   then
		--Ng߽i �� kh�ng � khu v�c v�n chuy�n.
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� kh�ng � khu v�c v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400933_left or
			targetX > x400933_right or
			targetZ < x400933_top  or
			targetZ > x400933_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� kh�ng � khu v�c v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 520,100,99)
		
end
