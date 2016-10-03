--NPC M� Dung S�n Trang
--M� Dung Thanh S�n - V� h�c truy�n th� ph�i M� Dung
--Script by S�i �z
--ID = 960002

x960002_g_ScriptId	= 960002

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960002_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"T�i h� l� M� Dung Thanh S�n, ng߶i truy�n th� v� h�c M� Dung Gia cho c�c � t� b�n m�n.")
		
		local MP = GetMenPai(sceneId, selfId)
		if MP == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) <= 0 then
			AddText(sceneId,"C�c h� v�n ch�a gia nh�p m�n ph�i n�o. Ph�i ch�ng l� c� duy�n v�i b�n ph�i. H�y �n y�t ki�n tr߷ng m�n M� Dung Th�y m�t chuy�n xem c� duy�n c�a c�c h� v�i b�n ph�i th� n�o?")
		elseif MP == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) > 0 then
			AddNumText(sceneId,x960002_g_scriptId, "K� n�ng h�c t�p",1,1)
			AddNumText(sceneId,x960002_g_scriptId, "Gi�i thi�u t�m ph�p",8,2)
		else
			AddText(sceneId,"K� n�ng c�a ta ch� truy�n th� cho � t� b�n m�n, c�c h� �� l� cao � m�n ph�i kh�c, h�y v� m�n ph�i m�nh tu luy�n �i!")
		end
		
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960002_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()
local Sex = GetSex(sceneId,selfId)

	--*****************--
	if key == 2 then
		
		BeginEvent(sceneId)
			AddText(sceneId,"#{function_xinfajieshao_001}")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	
	end
	--*****************--
	if key == 1 then
		
		BeginEvent(sceneId)
			AddText(sceneId,"M�i l�n tu luy�n s� gia t�ng t�m ph�p t�i quy�n b� t�ch ch� �nh l�n #G10 c�p#W tuy nhi�n kh�ng c�n t�n #GKinh Nghi�m#W hay #GNg�n L��ng#W g� h�t!")
			AddText(sceneId,"C�c h� mu�n th�ng c�p b� t�ch n�o?")
			AddNumText(sceneId,x960002_g_scriptId, "#WGiang Nam Ki�m Quy�t",1,3)
			AddNumText(sceneId,x960002_g_scriptId, "#WS�t Tr߶ng Quy�t",1,4)
			AddNumText(sceneId,x960002_g_scriptId, "#WVi�m D߽ng T�m Ph�p",1,5)
			AddNumText(sceneId,x960002_g_scriptId, "#WThanh V�n B� T�ch",1,6)
			AddNumText(sceneId,x960002_g_scriptId, "#WS߽ng L�nh Ki�m Thu�t",1,7)
			AddNumText(sceneId,x960002_g_scriptId, "#WTinh Nguy�t Y�u Thu�t",1,8)
			if LuaFnGetXinFaLevel(sceneId,selfId,70) >= 1 then
				AddNumText(sceneId,x960002_g_scriptId, "B� t�ch #YTham H�p C�ng",1,9)
			end
			if LuaFnGetXinFaLevel(sceneId,selfId,71) >= 1 then
				AddNumText(sceneId,x960002_g_scriptId, "B� t�ch #Gеn D�n �i�n B�",1,10)
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
			
	end
	--*****************--
	local TP
	local Lev=GetLevel(sceneId,selfId)
	--*****************--
	if key == 3 then
		BeginEvent(sceneId)
			TP = LuaFnGetXinFaLevel(sceneId,selfId,64)
			if TP >= 119 then
				AddText(sceneId,"е tu luy�n t�m ph�p #GGiang Nam Ki�m Quy�t#W c�a c�c h� �� ��t �n th��ng h�n, kh�ng c�n tu luy�n th�m n�a!")
			elseif Lev+5<TP+10 then
				AddText(sceneId,"C�n thi�t gia t�ng c�p � nh�n v�t ��m b�o ch�nh l�ch t�m ph�p v� c�p � nh�n v�t kh�ng qu� 5")
			else
				LuaFnSetXinFaLevel(sceneId,selfId,64,TP+10)
				AddText(sceneId,"е tu luy�n t�m ph�p #GGiang Nam Ki�m Quy�t#W c�a c�c h� gia t�ng l�n c�p "..TP.."!")
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 4 then
		BeginEvent(sceneId)
			TP = LuaFnGetXinFaLevel(sceneId,selfId,65)
			if TP >= 119 then
				AddText(sceneId,"е tu luy�n t�m ph�p #GS�t Tr߶ng Quy�t#W c�a c�c h� �� ��t �n th��ng h�n, kh�ng c�n tu luy�n th�m n�a!")
			elseif Lev+5<TP+10 then
				AddText(sceneId,"C�n thi�t gia t�ng c�p � nh�n v�t ��m b�o ch�nh l�ch t�m ph�p v� c�p � nh�n v�t kh�ng qu� 5")
			else
				LuaFnSetXinFaLevel(sceneId,selfId,65,TP+10)
				AddText(sceneId,"е tu luy�n t�m ph�p #GS�t Tr߶ng Quy�tW c�a c�c h� gia t�ng l�n c�p "..TP.."!")
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 5 then
		BeginEvent(sceneId)
			TP = LuaFnGetXinFaLevel(sceneId,selfId,66)
			if TP >= 119 then
				AddText(sceneId,"е tu luy�n t�m ph�p #GVi�m D߽ng T�m Ph�p#W c�a c�c h� �� ��t �n th��ng h�n, kh�ng c�n tu luy�n th�m n�a!")
			elseif Lev+5<TP+10 then
				AddText(sceneId,"C�n thi�t gia t�ng c�p � nh�n v�t ��m b�o ch�nh l�ch t�m ph�p v� c�p � nh�n v�t kh�ng qu� 5")
			else
				LuaFnSetXinFaLevel(sceneId,selfId,66,TP+10)
				AddText(sceneId,"е tu luy�n t�m ph�p #GVi�m D߽ng T�m Ph�p#W c�a c�c h� gia t�ng l�n c�p "..TP.."!")
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 6 then
		BeginEvent(sceneId)
			TP = LuaFnGetXinFaLevel(sceneId,selfId,67)
			if TP >= 119 then
				AddText(sceneId,"е tu luy�n t�m ph�p #GThanh V�n B� T�ch#W c�a c�c h� �� ��t �n th��ng h�n, kh�ng c�n tu luy�n th�m n�a!")
			elseif Lev+5<TP+10 then
				AddText(sceneId,"C�n thi�t gia t�ng c�p � nh�n v�t ��m b�o ch�nh l�ch t�m ph�p v� c�p � nh�n v�t kh�ng qu� 5")
			else
				LuaFnSetXinFaLevel(sceneId,selfId,67,TP+10)
				AddText(sceneId,"е tu luy�n t�m ph�p #GThanh V�n B� T�ch#W c�a c�c h� gia t�ng l�n c�p "..TP.."!")
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 7 then
		BeginEvent(sceneId)
			TP = LuaFnGetXinFaLevel(sceneId,selfId,68)
			if TP >= 119 then
				AddText(sceneId,"е tu luy�n t�m ph�p #GS߽ng L�nh Ki�m Thu�t#W c�a c�c h� �� ��t �n th��ng h�n, kh�ng c�n tu luy�n th�m n�a!")
			elseif Lev+5<TP+10 then
				AddText(sceneId,"C�n thi�t gia t�ng c�p � nh�n v�t ��m b�o ch�nh l�ch t�m ph�p v� c�p � nh�n v�t kh�ng qu� 5")
			else
				LuaFnSetXinFaLevel(sceneId,selfId,68,TP+10)
				AddText(sceneId,"е tu luy�n t�m ph�p #GS߽ng L�nh Ki�m Thu�t#W c�a c�c h� gia t�ng l�n c�p "..TP.."!")
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 8 then
		BeginEvent(sceneId)
			TP = LuaFnGetXinFaLevel(sceneId,selfId,69)
			if TP >= 119 then
				AddText(sceneId,"е tu luy�n t�m ph�p #GTinh Nguy�t Y�u Th�c#W c�a c�c h� �� ��t �n th��ng h�n, kh�ng c�n tu luy�n th�m n�a!")
			elseif Lev+5<TP+10 then
				AddText(sceneId,"C�n thi�t gia t�ng c�p � nh�n v�t ��m b�o ch�nh l�ch t�m ph�p v� c�p � nh�n v�t kh�ng qu� 5")
			else
				LuaFnSetXinFaLevel(sceneId,selfId,69,TP+10)
				AddText(sceneId,"е tu luy�n t�m ph�p #GTinh Nguy�t Y�u Th�c#W c�a c�c h� gia t�ng l�n c�p "..TP.."!")
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 9 then
		BeginEvent(sceneId)
			TP = LuaFnGetXinFaLevel(sceneId,selfId,70)
			if TP >= 119 then
				AddText(sceneId,"е tu luy�n t�m ph�p #GTham H�p C�ng#W c�a c�c h� �� ��t �n th��ng h�n, kh�ng c�n tu luy�n th�m n�a!")
			elseif Lev+5<TP+10 then
				AddText(sceneId,"C�n thi�t gia t�ng c�p � nh�n v�t ��m b�o ch�nh l�ch t�m ph�p v� c�p � nh�n v�t kh�ng qu� 5")
			else
				LuaFnSetXinFaLevel(sceneId,selfId,70,TP+10)
				AddText(sceneId,"е tu luy�n t�m ph�p #GTham H�p C�ng#W c�a c�c h� gia t�ng l�n c�p "..TP.."!")
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 10 then
		BeginEvent(sceneId)
			TP = LuaFnGetXinFaLevel(sceneId,selfId,71)
			if TP >= 119 then
				AddText(sceneId,"е tu luy�n t�m ph�p #Gеn D�n �i�n B�#W c�a c�c h� �� ��t �n th��ng h�n, kh�ng c�n tu luy�n th�m n�a!")
			elseif Lev+5<TP+10 then
				AddText(sceneId,"C�n thi�t gia t�ng c�p � nh�n v�t ��m b�o ch�nh l�ch t�m ph�p v� c�p � nh�n v�t kh�ng qu� 5")
			else
				LuaFnSetXinFaLevel(sceneId,selfId,71,TP+10)
				AddText(sceneId,"е tu luy�n t�m ph�p #Gеn D�n �i�n B�#W c�a c�c h� gia t�ng l�n c�p "..TP.."!")
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
end
--*****************************--
--*     Notify Fail Tips      *--
--*****************************--
function x960002_NotifyFailTips(sceneId,selfId,Tip)

	BeginEvent(sceneId)
		AddText(sceneId,sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

