--��ҽ���m�t c�i area ʱ����
function x400030_OnEnterArea( sceneId, selfId )
--	if	GetLevel( sceneId, selfId)<20 then
--		BeginEvent(sceneId)
--			strText = "C�a ng߽i ��c�p����20c�p"
--			AddText(sceneId,strText);
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
--	else
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 7,277,168)
--	end
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400030_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400030_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400030_OnLeaveArea( sceneId, selfId )
end
