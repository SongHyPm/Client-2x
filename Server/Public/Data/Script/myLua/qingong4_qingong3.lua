--��ҽ���m�t c�i area ʱ����
function x002935_OnEnterArea( sceneId, selfId )
	if	GetLevel( sceneId, selfId)<10 then
		BeginEvent(sceneId)
			strText = "C�a ng߽i �ȼ�����10��"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 402,132,40, 10)
	end
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x002935_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x002935_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x002935_OnLeaveArea( sceneId, selfId )
end
