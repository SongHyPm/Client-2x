--��ҽ���m�t c�i area ʱ����
function x400019_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,39,152)
	if sceneId ==7 then    -- Ki�m C�c1�͵���i L�1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,39,152)
	elseif sceneId ==75 then -- Ki�m C�c2�͵���i L�2
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 71,39,152)		
	elseif sceneId ==76 then -- Ki�m C�c3�͵���i L�3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 72,39,152)			
	end

end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400019_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400019_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400019_OnLeaveArea( sceneId, selfId )
end
