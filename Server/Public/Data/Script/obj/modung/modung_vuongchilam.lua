--NPC M� Dung S�n Trang
--V߽ng Chi L�m - K� n�ng B�a Ch�
--Script by S�i �z
--ID = 960008

x960008_g_ScriptId	= 960008

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960008_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� V߽ng Chi L�m, k� n�ng B�a Ch� c�a b�n ph�i �ang ���c nghi�n c�u, c�c h� h�y quay tr� l�i sau!")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end