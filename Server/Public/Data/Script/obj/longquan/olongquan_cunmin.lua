--龙泉NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x031010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Tr� c黙 th鬾 Long T飊h, k猼 h䅟 v緄 n呔c su痠 c黙 H� B鉶 Th鬾, ch韓h l� tr� Long T飊h n眎 danh thi阯 h�.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
