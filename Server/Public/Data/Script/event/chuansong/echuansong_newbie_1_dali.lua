--��ҽ���m�t c�i area ʱ����
function x400083_OnEnterArea( sceneId, selfId )
	local WoodenLane = { [61] = 2, [50] = 71, [81] = 72 }
	local destScene = WoodenLane[sceneId]
	if not destScene then
		destScene = 72
	end

	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, destScene,275,50)
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400083_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400083_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400083_OnLeaveArea( sceneId, selfId )
end
