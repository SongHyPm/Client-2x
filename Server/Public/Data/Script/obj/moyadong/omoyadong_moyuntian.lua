--NPC
--
--普通

--**********************************
--事件交互入口
--**********************************
function x018112_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"  N鄖 Ma Nhai 械ng ch韓h l� n絠 T gia tr読 ph� t� t, n猽 c鬾g l馽 kh鬾g 瘘, t痶 nh t靘 v鄆 鸢ng b課 ti猲 v鄌 c� v� an to鄋.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
