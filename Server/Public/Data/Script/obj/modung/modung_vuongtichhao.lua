--NPC M� Dung S�n Trang
--V߽ng T�ch H�o - K� n�ng Ma L� Thu�t
--Script by S�i �z
--ID = 960007

x960007_g_ScriptId	= 960007

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960007_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� V߽ng T�ch H�o, k� n�ng Ma L� Thu�t c�a b�n ph�i �ang ���c nghi�n c�u, c�c h� h�y quay tr� l�i sau!")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end