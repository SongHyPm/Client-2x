--NPC M� Dung S�n Trang
--��i Li�u S� Quan
--Script by S�i �z
--ID = 960014

x960014_g_ScriptId	= 960014

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960014_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� s� quan n߾c ��i Li�u.")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end