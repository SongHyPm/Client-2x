--��ҽ���m�t c�i area ʱ����
function x400017_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,280,152)
	if sceneId ==6 then    -- ����ɽ1�͵���i L�1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,280,152)
	elseif sceneId ==73 then -- ����ɽ2�͵���i L�2
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 71,280,152)		
	elseif sceneId ==74 then -- ����ɽ3�͵���i L�3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 72,280,152)			
	end

end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400017_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400017_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400017_OnLeaveArea( sceneId, selfId )
end
