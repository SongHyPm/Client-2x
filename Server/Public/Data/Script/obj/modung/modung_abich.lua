--NPC M� Dung S�n Trang
--A B�ch
--Script by S�i �z
--ID = 960018

x960018_g_ScriptId	= 960018

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960018_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� A B�ch.")
		AddText(sceneId,"A Ch�u t� t� c� thu�t c�i trang r�t �c bi�t, th�t khi�n ng߶i ta kh� l�ng m� nh�n ra!")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end