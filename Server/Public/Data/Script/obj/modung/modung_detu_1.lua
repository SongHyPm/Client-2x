--NPC M� Dung S�n Trang
--N� � t� M� Dung
--Script by S�i �z
--ID = 960012

x960012_g_ScriptId	= 960012

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960012_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Tr߷ng m�n �ang chuy�n t�m nghi�n c�u thu�t #GDi H�nh Ho�n �nh#W, m�i chuy�n l�n nh� trong ph�i t�m th�i do ti�n sinh M� Dung Ki�t ��m nhi�m.")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end