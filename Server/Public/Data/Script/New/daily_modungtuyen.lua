--NPC ��i L�
--M� Dung Tuy�n - Ti�p d�n M� Dung Gia
--Script by S�i �z
--ID = 960025

x960025_g_ScriptId	= 960025

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960025_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� M� Dung Tuy�n, � t� ti�p d�n m�n ph�i M� Dung.")
		local MP = GetMenPai(sceneId,selfId)
		if MP == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) <= 0 then
			AddText(sceneId,"Ta th�y c�c h� c�ng kh�i ng� tu�n t�, chi b�ng h�y theo ta v� b�i ki�n ch߷ng m�n gia nh�p M� Dung Gia.")
			AddText(sceneId,"C�c h� �� t�ng nghe n�i �c chi�u Цu Chuy�n Tinh Di c�a b�n ph�i ch�a. C�n do d� g� n�a m� kh�ng theo ta?")
			AddNumText(sceneId,x960025_g_ScriptId,"Ъn M� Dung S�n Trang",9,0)
		elseif MP == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) > 0 then
			AddText(sceneId,"V� c�ng c�a c�c h� ti�n b� nhanh nh� v�y, h�n l� r�t ���c s� ph� quan t�m ��y m�. B�n ph�i th�t t� h�o khi c� m�t nh�n t�i xu�t ch�ng v� ngh�!")
		elseif MP ~= 9 then
			AddText(sceneId,"H�i...#rL�u r�i kh�ng g�p c�c h�. V� c�ng c�a c�c h� ti�n b� nhanh nh� v�y, gi� m� tu luy�n � M� Dung c� ph�i gi� n�y �� xu�t ch�ng r�i kh�ng?. Ti�c th�t, ti�c th�t...")
		end
		--AddNumText(sceneId,x960025_g_ScriptId,"Ti�n c� gia nh�p m�n ph�i",9,1)
		AddNumText(sceneId,x960025_g_ScriptId,"Lai l�ch M� Dung Gia",8,2)
		AddNumText(sceneId,x960025_g_ScriptId,"Уc tr�ng chi�n �u",8,3)
		AddNumText(sceneId,x960025_g_ScriptId,"Уc tr�ng cu�c s�ng",8,4)
		AddNumText(sceneId,x960025_g_ScriptId,"Цu Chuy�n Tinh Di",8,5)
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960025_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	if key == 0 then
		if IsHaveMission(sceneId,selfId,4021)>0 then
			BeginEvent(sceneId)
				AddText(sceneId,"Tr�n ng߶i c�c h� c� ng�n phi�u, kh�ng th� truy�n t�ng ���c!");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetLevel(sceneId,selfId)<10 then
			BeginEvent(sceneId)
				AddText(sceneId,"C�c h� c�n tu luy�n sau khi ��t t�i c�p 10 r�i �n t�m ta!");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900),"TransferFunc",sceneId,selfId,435,91,116)
		end
	elseif key == 1 then
		if GetMenPai(sceneId,selfId) == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) > 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"C�c h� h�y d�n ng߶i ch� �nh �n M� Dung S�n Trang ch� ng߶i b�i s� m�n ph�i - M� Dung Ki�t#H[48,144]#W, ch�n ch�c n�ng #GGia nh�p m�n ph�i#W l� c� th� gia nh�p m�n ph�i r�i. S� c� ph�n th߷ng h�p d�n ��!")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Ch� c� � t� b�n ph�i m�i c� th� ti�n c� gia nh�p m�n ph�i.")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif key == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"M� Dung Gia �t C� T� c� d�ng d�i ho�ng t�c n߾c ��i Y�n. Th�i lo�n l�c ph�n tranh b� T�ng tri�u t߾c �o�t ng�i v�, ��nh ph�i tho�i lui v� �t C� T� nu�i tr� ph�c qu�c l�u d�i.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 3 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ю t� M� Dung c� �c tr�ng n�i b�t l� n�i l�c c�c k� th�m h�u.")
			AddText(sceneId,"M�t m�t k� n�ng xu�t th�n, c� th� d� d�ng k�t li�u �i th� ch� trong v�i chi�u th�c nh�, m�t kh�c s� h�u trong m�nh t�m ph�p \"G�y �ng �p l�ng �ng\", khi�n �ch nh�n ch�t b�i ch�nh c�ng phu �c � nh�t c�a m�nh.")
			AddText(sceneId,"C�c th� h� �i sau c�a M� Dung Gia lu�n ph�i nu�i nghi�p l�n ph�c h�ng qu�c gia, kh�i ph�c vinh ph� m�t th�i.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 4 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ma L� Thu�t: D� thu�t s� d�ng b�a ch� �c bi�t c�a M� Dung Gia. B�a ch� �c bi�t linh nghi�m n�u m�c ti�u l� �ch nh�n, ngo�i ra c�ng c� th� s� d�ng � t�ng c߶ng c�ng l�c cho c�c chi�n h�u.")
			AddText(sceneId,"Ch� b�a: Ch� b�a l� m�t b߾c quan trong c�a Ma L� Thu�t, l� nguy�n li�u c� b�n c�a linh thu�t Ma L� c�a m�n ph�i. Ngo�i ra c�ng c� th� r�n luy�n c�ng l�c cho b�n th�n nh� vi�c ch� b�a")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 5 then
		BeginEvent(sceneId)
			AddText(sceneId,"B�n ph�i c� tuy�t ��nh c�ng phu Цu Chuy�n Tinh Di m� ng߶i �i th߶ng g�i l� \"G�y �ng �p l�ng �ng\".")
			AddText(sceneId,"Ch�nh v� v� c�ng tuy�t h�c n�y m� h�ng lo�t c�i ch�t c�a c�c cao th� tr�n giang h� nh� Huy�n Kh�ng ��i s� c�a Thi�u L�m T� hay ph� bang ch� C�i Bang M� ��i Nguy�n �u nghi h�t do M� Dung c�ng t� c�a ch�ng ta g�y ra.")
			AddText(sceneId,"Trong ph�i tr߾c gi� d߶ng nh� ch� c� M� Dung Ph�c c�ng t� l� n�m ���c �c chi�u n�y, ngo�i ra m�i ng߶i v�i Цu Chuy�n Tinh Di g�n nh� v�n c�n l� m�t b� �n.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	end

end