--NPC M� Dung S�n Trang
--T�y H� S� Quan
--Script by S�i �z
--ID = 960022

x960022_g_ScriptId	= 960022

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960022_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� s� quan n߾c T�y H�.")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end