-- Th�nh th����񸱱���Th�nh th�to� � ���� �i�m

x400807_g_ScriptId = 400807
x400807_g_ControlScript = 600039

-- ��ҽ��봫�� �i�m
function x400807_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400807_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ��T�i ���� �i�m
function x400807_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���� �i�m
function x400807_OnLeaveArea( sceneId, selfId )
	return
end
