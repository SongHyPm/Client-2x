-- L�c D߽ng��̨�������� �i�m

x400916_g_ScriptId = 400916
x400916_g_ChallengeScriptId = 806012

-- ��ҽ��봫�� �i�m
function x400916_OnEnterArea( sceneId, selfId )
	CallScriptFunction(x400916_g_ChallengeScriptId, "LeaveScene", sceneId, selfId )
end

-- ���ͣ��T�i ���� �i�m
function x400916_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���� �i�m
function x400916_OnLeaveArea( sceneId, selfId )
	return
end
