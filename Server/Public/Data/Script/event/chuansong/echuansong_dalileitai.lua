-- ��i L���̨�������� �i�m

x400917_g_ScriptId = 400917
x400917_g_ChallengeScriptId = 806014

-- ��ҽ��봫�� �i�m
function x400917_OnEnterArea( sceneId, selfId )
	CallScriptFunction(x400917_g_ChallengeScriptId, "LeaveScene", sceneId, selfId )
end

-- ���ͣ��T�i ���� �i�m
function x400917_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���� �i�m
function x400917_OnLeaveArea( sceneId, selfId )
	return
end
