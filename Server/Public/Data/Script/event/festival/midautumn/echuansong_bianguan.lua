-- �������񸱱�����n Ho�ngto� � ���� �i�m

x050011_g_ScriptId = 050011
x050011_g_ControlScript = 050010

-- ��ҽ��봫�� �i�m
function x050011_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x050011_g_ControlScript, "Exit", sceneId, selfId )
end

-- ���ͣ��T�i ���� �i�m
function x050011_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���� �i�m
function x050011_OnLeaveArea( sceneId, selfId )
	return
end
