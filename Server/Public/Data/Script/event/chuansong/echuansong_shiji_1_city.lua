-- Th�nh th����񸱱���Th�nh th�to� � ���� �i�m

x400808_g_ScriptId			= 400808
x400808_g_ControlScript	= 600042

-- ��ҽ��봫�� �i�m
function x400808_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400808_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ��T�i ���� �i�m
function x400808_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���� �i�m
function x400808_OnLeaveArea( sceneId, selfId )
	return
end
