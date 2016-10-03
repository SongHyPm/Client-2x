--NPC M� Dung S�n Trang
--M� Dung Ki�t - B�i s� ph�i M� Dung
--Script by S�i �z
--ID = 960004

x960004_g_ScriptId	= 960004

--*****************************--
--*     On Default Event      *--
--*****************************--
function x960004_OnDefaultEvent(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"T�i h� l� M� Dung Ki�t, tr߷ng m�n �ang nghi�n c�u thu�t #GDi H�nh Ho�n �nh#W n�n m�i vi�c s� m�n t�m th�i do ta ��m nhi�m.")
		
		local MP = GetMenPai(sceneId, selfId)
		if MP == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) <= 0 then
			AddNumText(sceneId,x960004_g_scriptId,"Gia nh�p m�n ph�i",6,0)
		end
		if MP == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) > 0 then
			AddNumText(sceneId,x960004_g_scriptId, "Nh�n danh hi�u",6,1)
			AddNumText(sceneId,x960004_g_scriptId, "Nh�n th�i trang m�n ph�i",6,2)
			AddNumText(sceneId,x960004_g_scriptId, "Nh�n th�i M�n Ph�i Tri�u T�p L�nh",6,99)
		end
		AddNumText(sceneId,x960004_g_scriptId, "Gi�i thi�u m�n ph�i",8,3)
		AddNumText(sceneId,x960004_g_scriptId, "H�c K� n�ng c�a m�n ph�i?",8,4)
		
	EndEvent(senceId)
	DispatchEventList(sceneId,selfId,targetId)
	
end
--*****************************--
--*     On Event Request      *--
--*****************************--
function x960004_OnEventRequest(sceneId,selfId,targetId,eventId)
local key = GetNumText()
local Sex = GetSex(sceneId,selfId)

	--*****************--
	if key == 0 then
	
		LuaFnJoinMenpai(sceneId,selfId, targetId,9)
		LuaFnSetXinFaLevel(sceneId,selfId,64,10)
		LuaFnSetXinFaLevel(sceneId,selfId,65,10)
		LuaFnSetXinFaLevel(sceneId,selfId,66,10)
		LuaFnSetXinFaLevel(sceneId,selfId,67,10)
		LuaFnSetXinFaLevel(sceneId,selfId,68,10)
		LuaFnSetXinFaLevel(sceneId,selfId,69,10)
		LuaFnSetXinFaLevel(sceneId,selfId,70,10)
		LuaFnSetXinFaLevel(sceneId,selfId,71,10)
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,148,0)
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ch�c m�ng c�c h� �� l� � t� #GM� Dung#W!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end
	--*****************--
	if key == 1 then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Danh hi�u b�n ph�i ��t ���c th�ng qua tu luy�n t�m ph�p. C�n c� v�o ��ng c�p tu luy�n m� ph�n th�nh c�c lo�i danh hi�u th�p �n cao")
			if Sex == 0 then 
				AddNumText(sceneId,x960004_g_scriptId, "M� Dung Hi�p N�",1,100)
				AddNumText(sceneId,x960004_g_scriptId, "L�ng Th�n Ю T�",1,101)
				AddNumText(sceneId,x960004_g_scriptId, "H�a Kh� Hi�p N�",1,102)
				AddNumText(sceneId,x960004_g_scriptId, "Ki�m V� Ti�n T�",1,103)
			else
				AddNumText(sceneId,x960004_g_scriptId, "M� Dung Hi�p S�",1,104)
				AddNumText(sceneId,x960004_g_scriptId, "L�ng Th�n Ю T�",1,105)
				AddNumText(sceneId,x960004_g_scriptId, "Цu Chuy�n Tr߶ng Sinh",1,106)
				AddNumText(sceneId,x960004_g_scriptId, "V� Song �nh Hi�p",1,107)
			end
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	
	end
	if key == 100 then
		LuaFnAwardSpouseTitle(sceneId,selfId,"M� Dung Hi�p N�")
		DispatchAllTitle(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"Nh�n th�nh c�ng danh hi�u #YM� Dung Hi�p N�")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 101 then
		if LuaFnGetXinFaLevel(sceneId,selfId,64) <=50 
		   or LuaFnGetXinFaLevel(sceneId,selfId,65) <= 40 
		   or LuaFnGetXinFaLevel(sceneId,selfId,66) <= 40 
		   or LuaFnGetXinFaLevel(sceneId,selfId,67) <= 40 
		   or LuaFnGetXinFaLevel(sceneId,selfId,68) <= 40 
		   or LuaFnGetXinFaLevel(sceneId,selfId,69) <= 40 then
			BeginEvent(sceneId)
				AddText(sceneId,"��t danh hi�u n�y c�n 6 lo�i t�m ph�p c� b�n ��t tr�n c�p 40")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		LuaFnAwardSpouseTitle(sceneId,selfId,"L�ng Th�n Ю T�")
		DispatchAllTitle(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"Nh�n th�nh c�ng danh hi�u #YL�ng Th�n Ю T�")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 102 then 
		if LuaFnGetXinFaLevel(sceneId,selfId,64) <=60 
		   or LuaFnGetXinFaLevel(sceneId,selfId,65) <= 80 
		   or LuaFnGetXinFaLevel(sceneId,selfId,66) <= 80 
		   or LuaFnGetXinFaLevel(sceneId,selfId,67) <= 80 
		   or LuaFnGetXinFaLevel(sceneId,selfId,68) <= 80 
		   or LuaFnGetXinFaLevel(sceneId,selfId,69) <= 80 then
			BeginEvent(sceneId)
				AddText(sceneId,"��t danh hi�u n�y c�n 6 lo�i t�m ph�p c� b�n ��t tr�n c�p 80")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		LuaFnAwardSpouseTitle(sceneId,selfId,"H�a Kh� Hi�p N�")
		DispatchAllTitle(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"Nh�n th�nh c�ng danh hi�u #YH�a Kh� Hi�p N�")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 103 then 
		if LuaFnGetXinFaLevel(sceneId,selfId,64) <=80 
		   or LuaFnGetXinFaLevel(sceneId,selfId,65) <= 100 
		   or LuaFnGetXinFaLevel(sceneId,selfId,66) <= 100 
		   or LuaFnGetXinFaLevel(sceneId,selfId,67) <= 100 
		   or LuaFnGetXinFaLevel(sceneId,selfId,68) <= 100 
		   or LuaFnGetXinFaLevel(sceneId,selfId,69) <= 100 then
			BeginEvent(sceneId)
				AddText(sceneId,"��t danh hi�u n�y c�n 6 lo�i t�m ph�p c� b�n ��t tr�n c�p 100")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		LuaFnAwardSpouseTitle(sceneId,selfId,"Ki�m V� Ti�n T�")
		DispatchAllTitle(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"Nh�n th�nh c�ng danh hi�u #YKi�m V� Ti�n T�")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 104 then 
		LuaFnAwardSpouseTitle(sceneId,selfId,"M� Dung Hi�p S�")
		DispatchAllTitle(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"Nh�n th�nh c�ng danh hi�u #YM� Dung Hi�p S�")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 105 then 
		if LuaFnGetXinFaLevel(sceneId,selfId,64) <=50 
		   or LuaFnGetXinFaLevel(sceneId,selfId,65) <= 40 
		   or LuaFnGetXinFaLevel(sceneId,selfId,66) <= 40 
		   or LuaFnGetXinFaLevel(sceneId,selfId,67) <= 40 
		   or LuaFnGetXinFaLevel(sceneId,selfId,68) <= 40 
		   or LuaFnGetXinFaLevel(sceneId,selfId,69) <= 40 then
			BeginEvent(sceneId)
				AddText(sceneId,"��t danh hi�u n�y c�n 6 lo�i t�m ph�p c� b�n ��t tr�n c�p 40")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		LuaFnAwardSpouseTitle(sceneId,selfId,"L�ng Th�n Ю T�")
		DispatchAllTitle(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"Nh�n th�nh c�ng danh hi�u #YL�ng Th�n Ю T�")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 106 then 
		if LuaFnGetXinFaLevel(sceneId,selfId,64) <=60 
		   or LuaFnGetXinFaLevel(sceneId,selfId,65) <= 80 
		   or LuaFnGetXinFaLevel(sceneId,selfId,66) <= 80 
		   or LuaFnGetXinFaLevel(sceneId,selfId,67) <= 80 
		   or LuaFnGetXinFaLevel(sceneId,selfId,68) <= 80 
		   or LuaFnGetXinFaLevel(sceneId,selfId,69) <= 80 then
			BeginEvent(sceneId)
				AddText(sceneId,"��t danh hi�u n�y c�n 6 lo�i t�m ph�p c� b�n ��t tr�n c�p 80")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		LuaFnAwardSpouseTitle(sceneId,selfId,"Цu Chuy�n Tr߶ng Sinh")
		DispatchAllTitle(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"Nh�n th�nh c�ng danh hi�u #YЦu Chuy�n Tr߶ng Sinh")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == 107 then 
		if LuaFnGetXinFaLevel(sceneId,selfId,64) <=80 
		   or LuaFnGetXinFaLevel(sceneId,selfId,65) <= 100 
		   or LuaFnGetXinFaLevel(sceneId,selfId,66) <= 100 
		   or LuaFnGetXinFaLevel(sceneId,selfId,67) <= 100 
		   or LuaFnGetXinFaLevel(sceneId,selfId,68) <= 100 
		   or LuaFnGetXinFaLevel(sceneId,selfId,69) <= 100 then
			BeginEvent(sceneId)
				AddText(sceneId,"��t danh hi�u n�y c�n 6 lo�i t�m ph�p c� b�n ��t tr�n c�p 100")
			EndEvent(senceId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		LuaFnAwardSpouseTitle(sceneId,selfId,"V� Song �nh Hi�p")
		DispatchAllTitle(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"Nh�n th�nh c�ng danh hi�u #YV� Song �nh Hi�p")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	--*****************--
	if key == 2 then
		
		if LuaFnGetPropertyBagSpace(sceneId,selfId) < 1 then
			x960004_NotifyFailTips(sceneId,selfId,"H�y s�p x�p l�i 1 � tr�ng trong � ��o c�!")
			return
		end
		local item=GetItemName(sceneId,10124340)
		TryRecieveItem(sceneId,selfId,10124340,1)
		BeginEvent(sceneId)
			AddText(sceneId,"Nh�n th�nh c�ng th�i trang m�n ph�i #Y["..item.."]!")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
			
	end
	--*****************--
	if key == 3 then
		
		BeginEvent(sceneId)
			AddText(sceneId,"M� Dung Gia n�m � ph�a nam th�nh C� T�, n�i th�y ��o bao b�c xung quanh.")
			AddText(sceneId,"C�c b�c ti�n b�i M� Dung Gia v�n l� ho�ng t�c n߾c ��i Y�n th�ng tr� v�ng C� T� m�t th�i.")
			AddText(sceneId,"Ch� m�t ph�t sai l�m �� � �t n߾c r�i v�o tay nh� T�ng, khi�n ng߶i trong ho�ng th�t ph�i lui v� s�ng �n t�i �t nam C� T�, r�t �t khi ti�p x�c v�i b�n ngo�i ngo�i.")
			AddText(sceneId,"C�c b�c anh h�ng M� Dung Gia lu�n ph�i nu�i tr� l�n ph�c qu�c �t l�n h�ng �u. C�c h� h�y t�m M� Dung Ph�c c�ng t� h�i m�t chuy�n xem sao.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
			
	end
	--*****************--
	if key == 4 then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ю t� M� Dung c� th� h�c ���c k� n�ng m�n ph�i qua ng߶i truy�n th� v� h�c - M� Dung Thanh S�n#H[48,134]#W.")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
			
	end
	--*****************--
	if key == 99 then
		
		if LuaFnGetPropertyBagSpace(sceneId,selfId) < 1 then
			x960004_NotifyFailTips(sceneId,selfId,"H�y s�p x�p l�i 1 � tr�ng trong � ��o c�!")
			return
		end
		
		BeginEvent(sceneId)
			AddText(sceneId,"Nh�n th�nh c�ng 20 c�i M�n Ph�i Tri�u T�p L�nh!")
		EndEvent(senceId)
		DispatchEventList(sceneId,selfId,targetId)
		
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
		TryRecieveItem(sceneId,selfId,30501001,1)
			
	end
	--*****************--
	
end
--*****************************--
--*     Notify Fail Tips      *--
--*****************************--
function x960004_NotifyFailTips(sceneId,selfId,Tip)

	BeginEvent(sceneId)
		AddText(sceneId,sceneId,Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

