--NPC M� Dung S�n Trang
--Guess
--Script by S�i �z
--ID = 960015

x960015_g_ScriptId	= 960015

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960015_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"M� Dung S�n Trang �t C� T� qu� kh�ng h� danh th�ng �a c�a � v߽ng ��i Y�n.")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end