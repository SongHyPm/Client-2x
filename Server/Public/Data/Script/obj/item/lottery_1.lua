-- �ֻ����

-- �ű���
x300060_g_ScriptId	= 300060  
x300060_g_ItemId = 40004431        

--**********************************
-- �¼��������
--**********************************
function x300060_OnDefaultEvent( sceneId, selfId)
	local	lev	= GetLevel( sceneId, selfId )
	if lev < 130 then
		BeginEvent( sceneId )
		AddText( sceneId, "#b#Y ��ng c�p ph�i ��t 130 m�i c� th� s� d�ng ch�c n�ng n�y." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return -1
	end
	SetLevel( sceneId, selfId, 30)
        LuaFnDelAvailableItem(sceneId,selfId,x300060_g_ItemId,1)
        local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� chuy�n sinh b�ng v�t ph�m Thi�p th�nh c�ng", 4 )
	BeginEvent(sceneId)
		AddText(sceneId,"#b#Y ch�c m�ng b�n �� chuy�n sinh th�nh c�ng")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
	
end

--**********************************
-- 
--**********************************
function x300060_IsSkillLikeScript( sceneId, selfId)
	return 0
end
