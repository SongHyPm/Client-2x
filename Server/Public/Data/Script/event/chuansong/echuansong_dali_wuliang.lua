--��ҽ���m�t c�i area ʱ����
function x400006_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 6,43,172)
	--������i L�2/3 ������ɽ2/3to� � ���ͽű��������	
	if sceneId ==2 then    -- ��i L�1�͵�����ɽ1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 6,43,172)
	elseif sceneId ==71 then -- ��i L�2�͵�����ɽ2
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 73,43,172)		
	elseif sceneId ==72 then -- ��i L�3�͵�����ɽ3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 74,43,172)			
	end

end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400006_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400006_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400006_OnLeaveArea( sceneId, selfId )
end
