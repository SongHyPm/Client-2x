--��ҽ���m�t c�i area ʱ����
function x400967_OnEnterArea( sceneId, selfId )
	if	GetLevel( sceneId, selfId)<10 then
		BeginEvent(sceneId)
			strText = "C�a ng߽i ��c�p����10c�p"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 531,278,286, 10)
	end
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400967_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400967_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400967_OnLeaveArea( sceneId, selfId )
end
