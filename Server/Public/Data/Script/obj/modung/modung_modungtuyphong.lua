--NPC M� Dung S�n Trang
--M� Dung T�y Phong - Truy�n th� khinh c�ng ph�i M� Dung
--Script by S�i �z
--ID = 960010

x960010_g_ScriptId	= 960010

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960010_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� M� Dung T�y Phong, ng߶i truy�n th� khinh c�ng ph�i M� Dung.")
		AddNumText(sceneId,x960010_g_ScriptId,"H�c khinh c�ng m�n ph�i",2,0)
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960010_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	if key == 0 then
	
		if HaveSkill(sceneId,selfId,200) > 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ng߽i �� h�c ���c khinh c�ng m�n ph�i r�i.")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		elseif (GetMenPai(sceneId, selfId) == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) < 0) or (GetMenPai(sceneId, selfId) ~= 9) then
			BeginEvent(sceneId)
				AddText(sceneId,"Ta ch� truy�n d�y k� n�ng n�y cho � t� b�n ph�i.")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		BeginEvent(sceneId)
			AddText(sceneId,"H�c t�p th�nh c�ng!")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		AddSkill(sceneId,selfId,200)
		DelSkill(sceneId,selfId,34)
		
	end

end