--NPC M� Dung S�n Trang
--V߽ng Phu Nh�n
--Script by S�i �z
--ID = 960019

x960019_g_ScriptId	= 960019

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960019_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"T�n ti�u t� �o�n D� ch�nh l� con trai c�a l�o t�c �o�n Ch�nh Thu�n. Phen n�y ta ph�i cho l�o t�c gi� kia n�m m�i ph� t� s�t sinh!")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end