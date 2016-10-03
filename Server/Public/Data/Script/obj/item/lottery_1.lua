-- 轮回神符

-- 脚本号
x300060_g_ScriptId	= 300060  
x300060_g_ItemId = 40004431        

--**********************************
-- 事件交互入口
--**********************************
function x300060_OnDefaultEvent( sceneId, selfId)
	local	lev	= GetLevel( sceneId, selfId )
	if lev < 130 then
		BeginEvent( sceneId )
		AddText( sceneId, "#b#Y 衅ng c ph鋓 鹫t 130 m緄 c� th� s� d鴑g ch裞 n錸g n鄖." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return -1
	end
	SetLevel( sceneId, selfId, 30)
        LuaFnDelAvailableItem(sceneId,selfId,x300060_g_ItemId,1)
        local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch鷆 m譶g "..nam.." 疸 chuy琻 sinh bg v ph Thi畃 th鄋h c鬾g", 4 )
	BeginEvent(sceneId)
		AddText(sceneId,"#b#Y ch鷆 m譶g b課 疸 chuy琻 sinh th鄋h c鬾g")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
	
end

--**********************************
-- 
--**********************************
function x300060_IsSkillLikeScript( sceneId, selfId)
	return 0
end
