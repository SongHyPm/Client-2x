--NPC M� Dung S�n Trang
--Ю t� ph�i M� Dung
--Script by S�i �z
--ID = 960021

x960021_g_ScriptId	= 960021

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960021_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Tr߷ng m�n �ang nghi�n c�u thu�t #GDi H�nh Ho�n �nh#W n�n t�m th�i kh�ng th� ti�p ng߶i ngo�i.")
		AddText(sceneId,"C�c h� c� th� t�m ng߶i ch� �߶ng m�n ph�i h�i th�m t�nh h�nh ho�c �n gi�n h�y du ngo�n th�ng c�nh M� Dung S�n Trang m�t v�ng xem sao.")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end