--NPC
--傀儡
--普通

--**********************************
--事件交互入口
--**********************************
function x014011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  B� nh靚 Ti陁 Dao lo読 F-17173 tr呔c m l鄊 vi甤 b靚h th叨ng... T痶... 遳 t�... Ki畉 xu... Ho鄋 m�... 鬺a...")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
