--��ҽ���m�t c�i area ʱ����
function x400921_OnEnterArea( sceneId, selfId )
	local sId = LuaFnGetCopySceneData_Param(sceneId, 11)
	local x = LuaFnGetCopySceneData_Param(sceneId, 12)
	local z = LuaFnGetCopySceneData_Param(sceneId, 13)
	
	NewWorld( sceneId, selfId, sId, x, z )
	
end

--���T�i m�t c�i area ����m�t ��ʱ��û����ʱ����
function x400921_OnTimer( sceneId, selfId )
	-- �� gi�y,��T�i C�i n�y  area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi�y����δ����
	if StandingTime >= 5000 then
		x400921_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪m�t c�i area ʱ����
function x400921_OnLeaveArea( sceneId, selfId )
end
