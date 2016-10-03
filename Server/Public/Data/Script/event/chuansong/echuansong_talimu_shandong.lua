x400938_g_ScriptId = 400938

x400938_left 	=100.0000
x400938_right	=106.0000

x400938_top  	=211.0000
x400938_bottom	=217.0000

--��ҽ���m�t c�i area ʱ����
function x400938_OnEnterArea( sceneId, selfId,a,b )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400938_g_ScriptId);
		UICommand_AddString(sceneId, "GotoTKLMG");
		UICommand_AddString(sceneId, "���������Ϊ����ɱ������,��ע�ⰲȫ.��ȷ��Ҫ������?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
		
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400938_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400938_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400938_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400938_GotoTKLMG( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	
	-- ��������ng����ng��T�i C�i n�y ��Χ��
	if sceneId ~= 425   then
		--Ng߽i �� kh�ng � khu v�c v�n chuy�n.
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� kh�ng � khu v�c v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400938_left or
			targetX > x400938_right or
			targetZ < x400938_top  or
			targetZ > x400938_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� kh�ng � khu v�c v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 427,38,24)
		
end
