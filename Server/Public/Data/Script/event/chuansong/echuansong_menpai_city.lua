-- Th�nh th����񸱱���Th�nh th�to� � ���� �i�m

x400805_g_ScriptId = 400805
x400805_g_ControlScript = 600026

-- ��ҽ��봫�� �i�m
function x400805_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400805_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ��T�i ���� �i�m
function x400805_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���� �i�m
function x400805_OnLeaveArea( sceneId, selfId )
	return
end
