--梅岭NPC
--祭司
--普通

--**********************************
--事件交互入口
--**********************************
function x033007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Nghe n骾 V� Di s絥 ch� T� Vi t� t� x鋣 ra nhi玼 chuy畁, r nhi玼 t� mu礽 疸 ch猼.... T鬷 ch� bi猼 c� th�.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
