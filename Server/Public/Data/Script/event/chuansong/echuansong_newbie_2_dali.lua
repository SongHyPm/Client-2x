--��ҽ���m�t c�i area ʱ����
function x400084_OnEnterArea( sceneId, selfId )
	local BackGarden = { [62] = 2, [82] = 71, [182] = 72 }
	local destScene = BackGarden[sceneId]
	if not destScene then
		destScene = 71
	end

	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, destScene,275,50)
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400084_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400084_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400084_OnLeaveArea( sceneId, selfId )
end
