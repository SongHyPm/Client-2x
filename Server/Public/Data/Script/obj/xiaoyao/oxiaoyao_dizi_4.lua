--Ti陁 DaoNPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x014033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� 甬 t� c黙 ph醝 ti陁 dao")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
