--NPC M� Dung S�n Trang
--M� Dung Ph�c
--Script by S�i �z
--ID = 960020

x960020_g_ScriptId	= 960020

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960020_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Mu�n ph�c h�ng ��i Y�n tr߾c ti�n ph�i thu ph�c l�ng ng߶i... V�n � h�ng ph�c qu�c gia c�n �t l�n tr�n t�t c� nhu c�u c� b�n c�a b�n th�n.")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end