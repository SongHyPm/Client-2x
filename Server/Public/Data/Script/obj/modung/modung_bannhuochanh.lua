--NPC M� Dung S�n Trang
--Ban Nh��c H�nh - Ng߶i ch� �߶ng m�n ph�i
--Script by S�i �z
--ID = 960009

x960009_g_ScriptId	= 960009

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960009_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� Ban Nh��c H�nh, ng߶i ch� �߶ng m�n ph�i!")
		AddNumText(sceneId,x960009_g_ScriptId,"B�i ki�n ch߷ng m�n",8,0)
		AddNumText(sceneId,x960009_g_ScriptId,"Gia nh�p m�n ph�i",8,1)
		AddNumText(sceneId,x960009_g_ScriptId,"H�c v� c�ng m�n ph�i",8,2)
		AddNumText(sceneId,x960009_g_ScriptId,"H�c k� n�ng s�ng m�n ph�i",8,3)
		AddNumText(sceneId,x960009_g_ScriptId,"Mua th� c��i m�n ph�i",8,4)
		AddNumText(sceneId,x960009_g_ScriptId,"H�c k� thu�t m�n ph�i",8,5)
		AddNumText(sceneId,x960009_g_ScriptId,"H�c khinh c�ng m�n ph�i",8,6)
		AddNumText(sceneId,x960009_g_ScriptId,"Цy l�i �c lang",8,7)
		AddNumText(sceneId,x960009_g_ScriptId,"D�ch tr�m",8,8)
		AddNumText(sceneId,x960009_g_ScriptId,"Th�ng tin",8,9)
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960009_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	if key == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� c� th� b�i ki�n ch߽ng m�n M� Dung Gia - M� Dung Th�y#H[69,109]#W. Nh�ng ch߷ng m�n �ang nghi�n c�u thu�t #GDi H�nh Ho�n �nh#W n�n ch�c kh�ng ti�p ng߶i ngo�i.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� c� th� �n ch� ng߶i b�i s� m�n ph�i - M� Dung Ki�t#H[48,144]#W, ch�n ch�c n�ng #GGia nh�p m�n ph�i#W l� c� th� gia nh�p m�n ph�i r�i.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� c� th� �n ch� ng߶i truy�n th� v� h�c m�n ph�i - M� Dung Thanh S�n#H[48,134]#W, t�m hi�u v� h�c t�p k� n�ng m�n ph�i.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 3 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� c� th� �n ch� ng߶i truy�n th� k� n�ng s�ng m�n ph�i - V߽ng T�ch H�o#H[127,30]#W v� V߽ng Ti�u#H[132,31]#W l� c� th� h�c ���c k� n�ng m�n ph�i - #GMa L� Thu�t#W v� #GCh� T�o B�a Ch�#W.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 4 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� c� th� �n ch� ng߶i qu�n l� Linh D߽ng - Phong Thi�n L�#H[25,166]#W l� c� th� nh�n th� c��i m�n ph�i.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 5 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� c� th� �n ch� ng߶i truy�n th� k� thu�t Linh D߽ng - Phong Ti�u#H[25,163]#W l� c� th� h�c k� thu�t Linh D߽ng.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 6 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� c� th� �n ch� ng߶i truy�n th� khinh c�ng m�n ph�i - M� Dung T�y Phong#H[45,23]#W l� c� th� h�c khinh c�ng m�n ph�i.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 7 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� c� th� �n ch� � t� b�n ph�i - C�ng D� Kh�n#H[159,163]#W ch�n ch�c n�ng #GЦy l�i �c lang#W l� c� th� ti�n v�o gi�t qu�i v�t tu luy�n.")
			AddText(sceneId,"L�u � c�p � t�i thi�u � v�o l� #Gc�p 60#W.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 8 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� c� th� �n d�ch tr�m m�n ph�i - Уng V�n Nh�n#H[27,137]#W l� c� th� d�ch chuy�n �n c�c m�n ph�i, th�nh th� r�i.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 9 then
		BeginEvent(sceneId)
			AddText(sceneId,"T�t c� NPC t�i M� Dung S�n Trang �u do t�c gi� #GS�i �z#W vi�t n�n. Hy v�ng m�t ng�y n�o �� c� Server c� ph�i M� Dung ho�n ch�nh h�n!")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	end

end