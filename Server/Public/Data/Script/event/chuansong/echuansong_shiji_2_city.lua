-- Th�nh th����񸱱���Th�nh th�to� � ���� �i�m

x400806_g_ScriptId = 400806
x400806_g_ControlScript = 600037

-- ��ҽ��봫�� �i�m
function x400806_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400806_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ��T�i ���� �i�m
function x400806_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���� �i�m
function x400806_OnLeaveArea( sceneId, selfId )
	return
end
