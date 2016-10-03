x400926_g_ScriptId = 400926

x400926_left 	=91.0000
x400926_right	=95.0000

x400926_top  	=42.0000
x400926_bottom	=46.0000


--��ҽ���m�t c�i area ʱ����
function x400926_OnEnterArea( sceneId, selfId )

BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400926_g_ScriptId);
		UICommand_AddString(sceneId, "GotoYexihu");
		UICommand_AddString(sceneId, "D� T�y H� cho ph�p tuy�n chi�n, #Gkh�ng s�t kh�#cfff263, c� th� x�y ra #GPK#cfff263. Ch� � b�o tr�ng. Ng߽i mu�n v�o kh�ng?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 121,84,48)
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400926_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400926_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400926_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400926_GotoYexihu( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	
	-- ��������ng����ng��T�i C�i n�y ��Χ��
	if sceneId ~= 30   then
		--Ng߽i �ang l�m nhi�m v� v�n chuy�n.
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �ang l�m nhi�m v� v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400926_left or
			targetX > x400926_right or
			targetZ < x400926_top  or
			targetZ > x400926_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �ang l�m nhi�m v� v�n chuy�n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 121,84,48)
		
end
