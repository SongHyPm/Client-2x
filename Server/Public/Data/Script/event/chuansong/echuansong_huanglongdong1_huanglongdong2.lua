
--��ҽ���m�t c�i area ʱ����
function x400140_OnEnterArea( sceneId, selfId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, sceneId, 215, 160)
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400140_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400140_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400140_OnLeaveArea( sceneId, selfId )
end
