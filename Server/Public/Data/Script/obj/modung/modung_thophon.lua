--NPC M� Dung S�n Trang
--Th� Ph�n S� Quan
--Script by S�i �z
--ID = 960013

x960013_g_ScriptId	= 960013

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960013_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� s� quan n߾c Th� Ph�n.")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end