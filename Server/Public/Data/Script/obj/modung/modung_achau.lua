--NPC M� Dung S�n Trang
--A Ch�u
--Script by S�i �z
--ID = 960017

x960017_g_ScriptId	= 960017

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960017_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� A Ch�u, ch� nh�n Th�nh H߽ng Th�y T�.")
		AddText(sceneId,"C�ng t� gia c�n ��y lu�n ch�u ti�ng x�u do hi�u l�m v�i c�c ��i hi�p giang h�. Th�t oan cho c�ng t� qu�!")
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end