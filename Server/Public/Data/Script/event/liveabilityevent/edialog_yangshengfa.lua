--对话事件 npc白颖明

--脚本号
x713621_g_ScriptId = 713621

--**********************************
--任务入口函数
--**********************************
function x713621_OnDefaultEvent( sceneId, selfId, targetId)
	dialog = "#{event_liveabilityevent_0030}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713621_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713621_g_ScriptId,"T読 h� mu痭 t靘 hi瑄 d咿ng sinh ph醦",11,-1)
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x713621_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x713621_OnAccept( sceneId, selfId, AbilityId )
end
