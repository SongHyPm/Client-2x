--NPC M� Dung S�n Trang
--M� Dung Th�ng - Ng߶i giao nhi�m v� ph�i M� Dung
--Script by S�i �z
--ID = 960003

x960003_g_ScriptId	= 960003

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960003_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"T�i h� l� M� Dung Th�ng, ng߶i giao nhi�m v� ph�i M� Dung cho c�c � t� b�n ph�i.")
		if GetMenPai(sceneId, selfId) == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) > 0 then
			AddNumText(sceneId,x960003_g_scriptId, "бi th�i trang cao c�p m�n ph�i",2,0)
			AddNumText(sceneId,x960003_g_scriptId, "Nhi�m v� s� m�n",2,1)
			AddNumText(sceneId,x960003_g_scriptId, "T�m hi�u nhi�m v� s� m�n",8,2)
		end
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960003_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()

	--*****************--
	if key == 2 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"B�n ph�i c�n thu th�p s� l��ng l�n c�c v�t ph�m #GTh�o Ng�#W,#GB�ch Anh#W,#GB� Ho�ng#W,#GT�c Ng�#W.")
			AddText(sceneId,"Nhi�m v� c�a ng߽i l� �em �� s� l��ng y�u c�u �n ch� ta, c� r�t nhi�u ph�n th߷ng phong ph� �ang ��i ng߽i.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	
	end
	--*****************--
	if key == 0 then
	
		BeginEvent(sceneId)
			AddText(sceneId,"бi th�i trang #Gc�p 2#W c�n #G100 �i�m m�n ph�i#W, �i th�i trang #Gc�p 3#W c�n #G1000 �i�m m�n ph�i#W. Ng߽i mu�n �i lo�i n�o?")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		AddRadioItemBonus(sceneId,10124341,2)
		AddRadioItemBonus(sceneId,10124331,2)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x960003_g_ScriptId,0)
	
	end
	--*****************--
	if key == 1 then
		
		BeginEvent(sceneId)
			AddText(sceneId,"B�n ph�i c�n thu th�p s� l��ng l�n c�c v�t ph�m d߾i ��y, n�u ng߽i c� ta s� tr�ng th߷ng.")
			AddNumText(sceneId,x960003_g_scriptId, "Ta c� #G10 con #YTh�o Ng�",1,3)
			AddNumText(sceneId,x960003_g_scriptId, "Ta c� #G10 c�i #YB�ch Anh",1,4)
			AddNumText(sceneId,x960003_g_scriptId, "Ta c� #G10 c�i #YB� Ho�ng",1,5)
			AddNumText(sceneId,x960003_g_scriptId, "Ta c� #G10 con #YT�c Ng�",1,6)
			AddNumText(sceneId,x960003_g_scriptId, "Tr� l�i",2,7)
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	
	end
	--*****************--
	if key == 7 then
		
		x960003_OnDefaultEvent(sceneId,selfId,targetId)
	
	end
	--*****************--
	local num
	local Point
	--*****************--
	if key == 3 then
		
		num = LuaFnGetAvailableItemCount(sceneId,selfId,20102001)
		if num < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"S� l��ng #GTh�o Ng�#W c�a ng߽i l� "..num..", c�n t�i thi�u #G10 con#W m�i c� th� nh�n th߷ng!")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		else
			LuaFnDelAvailableItem(sceneId,selfId,20102001,10)
			AddMoney(sceneId,selfId,5000)
			Point = GetHumanMenpaiPoint(sceneId,selfId)+5
			SetHumanMenpaiPoint(sceneId,selfId,Point)
			LuaFnAddExp(sceneId,selfId,10000)
			BeginEvent(sceneId)
				AddText(sceneId,"Ng߽i �� ho�n th�nh nhi�m v� s� m�n thu th�p #G10 con#Y Th�o Ng�#W. Ta c� ch�t ng�n l��ng, kinh nghi�m v� �i�m m�n ph�i, ng߽i h�y nh�n l�y!")
				AddText(sceneId,"Ng߽i nh�n ���c #G5#W #-02, #G1 V�n#W �i�m #GKinh Nghi�m")
				AddText(sceneId,"�i�m m�n ph�i c�a ng߽i gia t�ng l�n #G5 �i�m#W. �i�m m�n ph�i hi�n t�i c�a ng߽i l� "..Point..".")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
		end
		
	end
	--*****************--
	if key == 4 then
		
		num = LuaFnGetAvailableItemCount(sceneId,selfId,20101001)
		if num < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"S� l��ng #GB�ch Anh#W c�a ng߽i l� "..num..", c�n t�i thi�u #G10 c�i#W m�i c� th� nh�n th߷ng!")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		else
			LuaFnDelAvailableItem(sceneId,selfId,20101001,10)
			AddMoney(sceneId,selfId,5000)
			Point = GetHumanMenpaiPoint(sceneId,selfId)+5
			SetHumanMenpaiPoint(sceneId,selfId,Point)
			LuaFnAddExp(sceneId,selfId,10000)
			BeginEvent(sceneId)
				AddText(sceneId,"Ng߽i �� ho�n th�nh nhi�m v� s� m�n thu th�p #G10 c�i#Y B�ch Anh#W. Ta c� ch�t ng�n l��ng, kinh nghi�m v� �i�m m�n ph�i, ng߽i h�y nh�n l�y!")
				AddText(sceneId,"Ng߽i nh�n ���c #G5#W #-02, #G1 V�n#W �i�m #GKinh Nghi�m")
				AddText(sceneId,"�i�m m�n ph�i c�a ng߽i gia t�ng l�n #G5 �i�m#W. �i�m m�n ph�i hi�n t�i c�a ng߽i l� "..Point..".")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
		end
		
	end
	--*****************--
	if key == 5 then
		
		num = LuaFnGetAvailableItemCount(sceneId,selfId,20101002)
		if num < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"S� l��ng #GB� Ho�ng#W c�a ng߽i l� "..num..", c�n t�i thi�u #G10 c�i#W m�i c� th� nh�n th߷ng!")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)	
			return
		else
			LuaFnDelAvailableItem(sceneId,selfId,20101002,10)
			AddMoney(sceneId,selfId,10000)
			Point = GetHumanMenpaiPoint(sceneId,selfId)+6
			SetHumanMenpaiPoint(sceneId,selfId,Point)
			LuaFnAddExp(sceneId,selfId,20000)
			BeginEvent(sceneId)
				AddText(sceneId,"Ng߽i �� ho�n th�nh nhi�m v� s� m�n thu th�p #G10 c�i#Y B� Ho�ng#W. Ta c� ch�t ng�n l��ng, kinh nghi�m v� �i�m m�n ph�i, ng߽i h�y nh�n l�y!")
				AddText(sceneId,"Ng߽i nh�n ���c #G10#W #-02, #G2 V�n#W �i�m #GKinh Nghi�m")
				AddText(sceneId,"�i�m m�n ph�i c�a ng߽i gia t�ng l�n #G6 �i�m#W. �i�m m�n ph�i hi�n t�i c�a ng߽i l� "..Point..".")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
		end
		
	end
	--*****************--
	if key == 6 then
	
		num = LuaFnGetAvailableItemCount(sceneId,selfId,20102002)
		if num < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"S� l��ng #GT�c Ng�#W c�a ng߽i l� "..num..", c�n t�i thi�u #G10 con#W m�i c� th� nh�n th߷ng!")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)	
			return
		else
			LuaFnDelAvailableItem(sceneId,selfId,20102002,10)
			AddMoney(sceneId,selfId,10000)
			Point = GetHumanMenpaiPoint(sceneId,selfId)+6
			SetHumanMenpaiPoint(sceneId,selfId,Point)
			LuaFnAddExp(sceneId,selfId,20000)
			BeginEvent(sceneId)
				AddText(sceneId,"Ng߽i �� ho�n th�nh nhi�m v� s� m�n thu th�p #G10 con#Y T�c Ng�#W. Ta c� ch�t ng�n l��ng, kinh nghi�m v� �i�m m�n ph�i, ng߽i h�y nh�n l�y!")
				AddText(sceneId,"Ng߽i nh�n ���c #G10#W #-02, #G2 V�n#W �i�m #GKinh Nghi�m")
				AddText(sceneId,"�i�m m�n ph�i c�a ng߽i gia t�ng l�n #G6 �i�m#W. �i�m m�n ph�i hi�n t�i c�a ng߽i l� "..Point..".")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
		end
		
	end
	--*****************--

end
--*****************************--
--*     On Mission Submit     *--
--*****************************--
function x960003_OnMissionSubmit(sceneId,selfId,targetId,missionScriptId,selectRadioId)
local Point = GetHumanMenpaiPoint(sceneId,selfId)
	--*****************--
	if LuaFnGetPropertyBagSpace(sceneId,selfId) < 1 then
		x960003_NotifyFailTips(sceneId,selfId,"H�y s�p x�p l�i 1 � tr�ng trong � ��o c�!")
		return
	end
	--*****************--
	if selectRadioId == 10124341 then
	
		if Point < 100 then
			BeginEvent(sceneId)
				AddText(sceneId,"бi th�i trang #Gc�p 2#W c�n c� #G100 �i�m m�n ph�i#W.")
				AddText(sceneId,"S� �i�m m�n ph�i hi�n t�i c�a ng߽i l� #G"..Point.." �i�m#W, v�n ch�a �� s� l��ng y�u c�u. H�y c�ng hi�n th�m cho s� m�n �i!")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		TryRecieveItem(sceneId,selfId,selectRadioId,1)
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� ho�n �i th�nh c�ng #G100 �i�m m�n ph�i#W l�y th�i trang #Gc�p 2#W m�n ph�i, ch�c m�ng!")
			Point = Point - 100
			SetHumanMenpaiPoint(sceneId,selfId,Point)
			AddText(sceneId,"S� �i�m m�n ph�i hi�n t�i c�a ng߽i c�n l�i l� #G"..Point.." �i�m#W!")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end
	--*****************--
	if selectRadioId == 10124331 then
	
		if Point < 1000 then
			BeginEvent(sceneId)
				AddText(sceneId,"бi th�i trang #Gc�p 3#W c�n c� #G1000 �i�m m�n ph�i#W.")
				AddText(sceneId,"S� �i�m m�n ph�i hi�n t�i c�a ng߽i l� #G"..Point.." �i�m#W, v�n ch�a �� s� l��ng y�u c�u. H�y c�ng hi�n th�m cho s� m�n �i!")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		TryRecieveItem(sceneId,selfId,selectRadioId,1)
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
		BeginEvent(sceneId)
			AddText(sceneId,"Ng߽i �� ho�n �i th�nh c�ng #G1000 �i�m m�n ph�i#W l�y th�i trang #Gc�p 3#W m�n ph�i, ch�c m�ng!")
			Point = Point - 1000
			SetHumanMenpaiPoint(sceneId,selfId,Point)
			AddText(sceneId,"S� �i�m m�n ph�i hi�n t�i c�a ng߽i c�n l�i l� #G"..Point.." �i�m#W!")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end
	--*****************--
	
end
--*****************************--
--*     Notify Fail Tips      *--
--*****************************--
function x960003_NotifyFailTips(sceneId,selfId,Tip)

	BeginEvent(sceneId)
		AddText(sceneId,sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

