--NPC M� Dung S�n Trang
--M� Dung Th�y - Tr߷ng m�n ph�i M� Dung
--Script by S�i �z
--ID = 960001

x960001_g_ScriptId	= 960001

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960001_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� M� Dung Th�y, tr߷ng m�n nh�n ph�i M� Dung. Hi�n t�i ta �ang nghi�n c�u thu�t #GDi H�nh Ho�n �nh#W, c� vi�c g� quan tr�ng h�y t�m #GM� Dung Ki�t#W.")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end