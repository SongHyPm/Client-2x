-- Th�nh th����񸱱���Th�nh th�to� � ���� �i�m

x400804_g_ScriptId = 400804
x400804_g_ControlScript = 600025

-- ��ҽ��봫�� �i�m
function x400804_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400804_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ��T�i ���� �i�m
function x400804_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���� �i�m
function x400804_OnLeaveArea( sceneId, selfId )
	return
end
