--��ҽ���m�t c�i area ʱ����
function x400007_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 7,40,278)
	--����Ki�m C�c2/3 ����i L�2/3to� � ���ͽű��������	
	if sceneId ==2 then    -- ��i L�1�͵�Ki�m C�c1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 7,40,278)
	elseif sceneId ==71 then -- ��i L�2�͵�Ki�m C�c3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 75,40,278)		
	elseif sceneId ==72 then -- ��i L�3�͵�Ki�m C�c3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 76,40,278)			
	end
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400007_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400007_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400007_OnLeaveArea( sceneId, selfId )
end
