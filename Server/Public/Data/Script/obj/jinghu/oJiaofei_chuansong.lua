
--��ҽ���m�t c�i area ʱ����
function x005115_OnEnterArea( sceneId, selfId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,200,52)
end

--�����m�t c�i area ����m�t ��ʱ��û����ʱ����
function x005115_OnTimer( sceneId, selfId )
	-- �� gi�y,����C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x005115_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x005115_OnLeaveArea( sceneId, selfId )
end
