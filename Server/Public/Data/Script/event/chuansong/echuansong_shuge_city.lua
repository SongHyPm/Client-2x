-- Th�nh th����񸱱���Th�nh th�to� � ���� �i�m

x400802_g_ScriptId = 400802
x400802_g_ControlScript = 600014

-- ��ҽ��봫�� �i�m
function x400802_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400802_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ��T�i ���� �i�m
function x400802_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���� �i�m
function x400802_OnLeaveArea( sceneId, selfId )
	return
end
