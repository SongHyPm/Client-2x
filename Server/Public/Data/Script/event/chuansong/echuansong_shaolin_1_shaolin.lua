--��ҽ���m�t c�i area ʱ����
x808021_g_MissionId			= 1250

function x808021_OnEnterArea( sceneId, selfId )
	DelMission( sceneId, selfId, x808021_g_MissionId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 9, 95, 146)
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x808021_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x808021_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x808021_OnLeaveArea( sceneId, selfId )
end
