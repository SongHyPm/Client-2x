x400925_g_ScriptId = 400925

x400925_left 	=284.0000
x400925_right	=288.0000

x400925_top  	=41.0000
x400925_bottom	=47.0000


--��ҽ���m�t c�i area ʱ����
function x400925_OnEnterArea( sceneId, selfId )

        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400925_g_ScriptId);
		UICommand_AddString(sceneId, "GotoYinaixueyuan");
		UICommand_AddString(sceneId, "����ѩԭΪ����ɱ������,��ע�ⰲȫ.��ȷ��Ҫ������?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 188,60,222)
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400925_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400925_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400925_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400925_GotoYinaixueyuan( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	
	-- ��������ng����ng��T�i C�i n�y ��Χ��
	if sceneId ~= 21   then
		--Ng߽i �� kh�ng � khu v�c v�n chuy�n.
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� kh�ng � khu v�c v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400925_left or
			targetX > x400925_right or
			targetZ < x400925_top  or
			targetZ > x400925_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� kh�ng � khu v�c v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 188,60,222)
		
end
