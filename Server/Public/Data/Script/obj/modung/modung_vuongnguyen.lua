--NPC M� Dung S�n Trang
--V߽ng Ng� Y�n
--Script by S�i �z
--ID = 960016

x960016_g_ScriptId	= 960016

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960016_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� V߽ng Ng� Y�n.")
		AddText(sceneId,"Bi�u ca d߶ng nh� ch�ng bao gi� � � �n ta. Huynh �y ch� quan t�m nghi�p l�n ph�c h�ng ��i Y�n m� th�i...")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end