--����NPC
--ÿ��������ȡԱ
--һ��
x002095_g_ScriptId = 002095


--**********************************
--�¼��������
--**********************************
function x002095_OnDefaultEvent( sceneId, selfId,targetId )
      local 	nam	= LuaFnGetName( sceneId, selfId )
	BeginEvent(sceneId)

		AddText(sceneId,"  #c00ff00Ch�o m�ng b�n �n v�i Thi�n Long B�t B� Linh Ki�m. D߾i ��y l� danh s�ch c�c ch�c n�ng c�c h� h�y ch�n nh�ng th� m�nh th�ch !#W")
			--AddNumText(sceneId, x002095_g_scriptId, "H�i ph�c kh� huy�t", 5, 106)
             --AddNumText( sceneId, x002095_g_ScriptId, "#b#e96491f#gFF0FA0Nh�n t�m ph�p 150",5,14 )
			 --AddNumText(sceneId,x990001_g_ScriptId,"Nh�n y�u quy�t ph�i M� Dung",1,325)
              --AddNumText( sceneId, x002095_g_ScriptId, "#b#GN�ng level t� 149 l�n 150",5,3333 )
              --AddNumText( sceneId, x000146_g_ScriptId, "#cff0000Nh�n danh hi�u",5,1009 )
              --AddNumText( sceneId, x002095_g_ScriptId, "#b#GNh�n 10000 #-02",5,10 )
	       --AddNumText( sceneId, x002093_g_ScriptId, "#b#GNh�n hi�u �ng tr�ng l�u",5,101 )
              --AddNumText( sceneId, x002095_g_scriptId, "#42#gffff00Nh�n �m Kh� - V� H�n#42", 5, 5252)
              --AddNumText( sceneId, x002095_g_ScriptId, "#b#YNh�n Pet",5,12 )
              AddNumText( sceneId, x000146_g_ScriptId, "#b#GNh�n 3000000 KNB",5,13 )
			  --AddNumText( sceneId, x000146_g_ScriptId, "#b#GNh�n 300000 DMP",5,8888 )
              --AddNumText( sceneId, x002093_g_ScriptId, "#b#GNh�n Buff",5,100 )
              AddNumText( sceneId, x002095_g_ScriptId, "#b#GNh�n �i�m t�ng",5,6666 )
              --AddNumText( sceneId, x002095_g_scriptId, "#b#YNh�n 12 k� n�ng c� b�n", 5, 4242)
            -- AddNumText( sceneId, x002095_g_ScriptId, "#b#BChuy�n sinh",5,5555 )
              AddNumText( sceneId, x002095_g_ScriptId, "#YS�a l�i kinh nghi�m <0>",5,11 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end


function x002095_OnEventRequest( sceneId, selfId, targetId, eventId )
local	key	= GetNumText()
         if key  == 100 then
        
                
               LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30160, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30150, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30119, 0) 
               LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30134, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30170, 0) 
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30180, 0) 
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30186, 0) 
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30005, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,  8051, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,  8052, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,  50, 0)
                BeginEvent(sceneId)
	        AddText(sceneId,"Nh�n BUFF th�nh c�ng !")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
                end
	 if key == 10 then
		local result =	AddMoney( sceneId, selfId, 100000000 )
			BeginEvent( sceneId )
				AddText( sceneId, "B�n �� nh�n ���c 10000 V�ng" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
	end
	 if key  == 101 then
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 10088, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 0, 0)
              
                BeginEvent(sceneId)
	        AddText(sceneId,"#GNh�n Hi�u �ng Th�nh c�ng!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
              BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n hi�u �ng Tr�ng L�u th�nh c�ng!", 4 )
                end
        if key  == 6666 then
   ZengDian(sceneId,selfId,targetId,1,5000000)

		BeginEvent(sceneId)
		AddText(sceneId,"Nh�n th�nh c�ng 5000000 �i�m t�ng.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end

--**
	if key == 325 then --Nh�n Y�u quy�t M� Dung Gia
		BeginAddItem(sceneId)
		AddItem(sceneId,30308099,1)--YQ 35 - L�c Ch� Ti�n Th�ch
		AddItem(sceneId,30308097,1)--YQ 45 - Ph� Thi�n Th�c
		--AddItem(sceneId,30308096,1)--YQ 65 - H�a Kh� Th�c
		AddItem(sceneId,30308100,1)--YQ 80 - L�ng Thi�n Th�c
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ch�c m�ng c�c h� nh�n ���c 1 b� y�u quy�t M� Dung Gia.")
			x002095_NotifyFailTips(sceneId, selfId, "Nh�n ���c 1 b� y�u quy�t M� Dung Gia.")
		EndEvent(sceneId)
		
		DispatchEventList(sceneId,selfId,targetId)
	end
if key  == 106 then
		x002095_FullRestore(sceneId, selfId)
end
if key  == 5252 then
			BeginAddItem(sceneId)
			AddItem( sceneId,10155005,1)
                     AddItem( sceneId,10156005,1)
                     EndAddItem(sceneId,selfId)
		       AddItemListToHuman(sceneId,selfId)
		       BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:�� nh�n th�nh c�ng", 0)
end
if key  == 11 then
	x002095_Level12(sceneId, selfId, targetId)
end
if key == 13 then
		local result =	YuanBao(sceneId,selfId,targetId,1,30000000)
			BeginEvent( sceneId )
				AddText( sceneId, "B�n �� nh�n ���c 30000000 KNB" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
	end
if key == 8888 then
		local result =	SetHumanMenpaiPoint(sceneId,selfId,30000000)
			BeginEvent( sceneId )
				AddText( sceneId, "B�n �� nh�n ���c 30000000 DMP" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
	end
if key == 18 then

                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30150, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"Nh�n BUFF th�nh c�ng.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
if key  == 4242 then
			BeginAddItem(sceneId)
			AddItem( sceneId,30308044,1)
			AddItem( sceneId,30308042,1)
			AddItem( sceneId,30308033,1)
			AddItem( sceneId,30308032,1)
			AddItem( sceneId,30308031,1)
			AddItem( sceneId,30308030,1)
		        AddItem( sceneId,30308029,1)
		       AddItem( sceneId,30308028,1)
		       AddItem( sceneId,30308034,1)
                       AddItem( sceneId,30308060,1)
                       AddItem( sceneId,30308026,1)
                       AddItem( sceneId,30308027,1)
		       EndAddItem(sceneId,selfId)
		       AddItemListToHuman(sceneId,selfId)
		       BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:Nh�n k� n�ng th�nh c�ng.", 0)
end
if key == 3333 then
		BeginEvent( sceneId )
		AddText( sceneId, "#gF4F4F4B�n mu�n n�ng c�p t� 149 l�n 150 ?" )
		AddNumText(sceneId, x181003_g_scriptId, "#gF4F4F4C�, t�i mu�n.", 7, 4444 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
end
if key == 4444 then
		x002095_Shengji( sceneId, selfId, targetId )
end
if key == 5555 then --chuy�n sinh
		BeginEvent( sceneId )
		AddText( sceneId, "#GB�n c� ch�c l� mu�n chuy�n sinh ?#r#YT� l�n chuy�n sinh 1->100 : Y�u c�u c�p � #G149#r#YT� l�n chuy�n sinh 100->200 : Y�u c�u c�p � #G149#r#WSau khi chuy�n sinh gi� nguy�n t�t c�. Sau khi chuy�n sinh c�p � tr� v� #G30." )
		AddNumText(sceneId, x002095_g_scriptId, "#YC�, t�i mu�n chuy�n sinh", 6, 5566 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
end
if key == 5566 then
		x002095_ZhuanSheng( sceneId, selfId, targetId )
end
if key == 1009 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#eaf6666Thi�n Long B�t B� Linh Ki�m" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GXin ch�c m�ng, t� gi� c�c h� ch�nh th�c l� th�nh vi�n c�a Thi�n Long B�t B� Linh Ki�m." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
end
if key == 12 then

BeginEvent(sceneId)
AddText( sceneId, "C�c h� h�y ch�n tr�n th� b�n mu�n Ch�n ��ng tr�n th� c� th� d�ng ���c nh� b�n. L�u �: ch� ���c nh�n 1 l�n !" )
		--AddNumText( sceneId, x002095_g_ScriptId, "#c0000ccTr�n th� h�i xu�n �an",5,50 )
		--AddNumText( sceneId, x002095_g_ScriptId, "#c0000ccTr�n th� h�i xu�n �an",5,51 )
		--AddNumText( sceneId, x002095_g_ScriptId, "#b#YTr�n th� h�i xu�n �an",5,52 )
		AddNumText( sceneId, x002095_g_ScriptId, "#c0000ccB� D�c �i�u Bi�n d�",5,53 )
		AddNumText( sceneId, x002095_g_ScriptId, "#c0000ccC�ng K� Bi�n D�",5,54 )
		--AddNumText( sceneId, x002095_g_ScriptId, "#b#GTh�n H�ng Mi�u",5,55 )
		--AddNumText( sceneId, x002095_g_ScriptId, "#b#GD� Tr�",5,56 )
		AddNumText( sceneId, x002095_g_ScriptId, "#b#GC�ng H�n �nh T��ng",5,57 )
		AddNumText( sceneId, x002095_g_ScriptId, "#b#GH�n Giang Long",5,58 )
EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
if key == 50 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9110, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#GXin ch�c m�ng "..nam.." �� nh�n th�nh c�ng PET ", 4 )
			str= "#YB�n �� c� #WBOSS PET. "
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 51 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9120, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#GXin ch�c m�ng "..nam.." �� nh�n th�nh c�ng PET", 4 )
			str= "#YB�n �� c� #WBOSS PET."
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 52 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9130, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#GXin ch�c m�ng "..nam.." �� nh�n th�nh c�ng PET", 4 )
			str= "#YB�n �� c� #WBOSS PET."
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 53 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9100, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#GXin ch�c m�ng "..nam.." �� nh�n th�nh c�ng PET", 4 )
			str= "#YB�n �� c� #WBOSS PET."
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	if key == 54 then
				local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 22068, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� #B"..nam.."#G�ɹ���ȡ�������95���������档", 4 )
			str= "#Y������#W�������95���������档"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	if key == 55 then
				local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
			
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 6206, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n ���c 1 Th�n H�ng Mi�u", 4 )
			str= "#YB�n �� c� #WBOSS PET."
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 56 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 33816, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n ���c 1 D� Tr� Хu M�c", 4 )
			str= "#YB�n �� c�#WPet Boss"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 57 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 880, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n ���c 1 C�ng H�n �nh T��ng", 4 )
			str= "#YC�c h� �� nh�n r�i !"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 58 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 884, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n ���c 1 H�n Giang Long", 4 )
			str= "#YB�n �� nh�n r�i !"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	if key == 13 then
		local result =	YuanBao(sceneId,selfId,targetId,1,300000)
			BeginEvent( sceneId )
				AddText( sceneId, "B�n �� nh�n th�nh c�ng 300000 KNB" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
	end
		if key == 14 then
	BeginEvent( sceneId )
		AddText( sceneId, "H�y ch�n m�n ph�i b�n mu�n gia nh�p. #r#GSau khi gia nh�p m�n ph�i b�n s� ���c t�m ph�p 149 bao g�m c� B� T�ch. #r#YL�u �: N�u c�c h� �� chuy�n sinh r�i m� s� d�ng ch�c n�ng n�y s� �i�m ti�m n�ng s� m�t." )
		AddNumText(sceneId,x990001_g_ScriptId,"#YM� Dung",5,29)
		AddNumText( sceneId, x002095_g_ScriptId, "#GTinh T�c",5,20 )
		AddNumText( sceneId, x002095_g_ScriptId, "#GTi�u Dao",5,21 )
		AddNumText( sceneId, x002095_g_ScriptId, "#GThi�u L�m",5,22 )
		AddNumText( sceneId, x002095_g_ScriptId, "#GThi�n S�n",5,23 )
		AddNumText( sceneId, x002095_g_ScriptId, "#GThi�n Long",5,24 )
		AddNumText( sceneId, x002095_g_ScriptId, "#GNga My",5,25 )
		AddNumText( sceneId, x002095_g_ScriptId, "#GV� �ang",5,26 )
		AddNumText( sceneId, x002095_g_ScriptId, "#GMinh Gi�o",5,27 )
		AddNumText( sceneId, x002095_g_ScriptId, "#GC�i Bang",5,28 )
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	end
	--**
	if key == 29 then --M� Dung
		--Gia nh�p m�n ph�i
		LuaFnJoinMenpai(sceneId,selfId, targetId, 9) --ID 9 l� M� Dung
		--T�m ph�p
		LuaFnSetXinFaLevel(sceneId,selfId,64,150)
		LuaFnSetXinFaLevel(sceneId,selfId,65,150)
		LuaFnSetXinFaLevel(sceneId,selfId,66,150)
		LuaFnSetXinFaLevel(sceneId,selfId,67,150)
		LuaFnSetXinFaLevel(sceneId,selfId,68,150)
		LuaFnSetXinFaLevel(sceneId,selfId,69,150)
		LuaFnSetXinFaLevel(sceneId,selfId,70,150)
		LuaFnSetXinFaLevel(sceneId,selfId,71,150)
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,148,0)
		--Th�ng c�p
		--SetLevel(sceneId,selfId,120)
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ch�c m�ng ng߽i �� l� � t� M� Dung Gia, nh�n th�nh c�ng t�m ph�p 150 m�n ph�i �ng th�i th�ng l�n c�p 150...")
		EndEvent(sceneId)
			
		DispatchEventList(sceneId,selfId,targetId )
	end
	if key == 20 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
		LuaFnSetXinFaLevel(sceneId,selfId,31,150)
		LuaFnSetXinFaLevel(sceneId,selfId,32,150)
		LuaFnSetXinFaLevel(sceneId,selfId,33,150)
		LuaFnSetXinFaLevel(sceneId,selfId,34,150)
		LuaFnSetXinFaLevel(sceneId,selfId,35,150)
		LuaFnSetXinFaLevel(sceneId,selfId,36,150)
		LuaFnSetXinFaLevel(sceneId,selfId,60,150)
		LuaFnSetXinFaLevel(sceneId,selfId,77,150)
              local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 150 ph�i Tinh T�c !", 4 )
		 BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 21 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
		LuaFnSetXinFaLevel(sceneId,selfId,49,150)
		LuaFnSetXinFaLevel(sceneId,selfId,50,150)
		LuaFnSetXinFaLevel(sceneId,selfId,51,150)
		LuaFnSetXinFaLevel(sceneId,selfId,52,150)
		LuaFnSetXinFaLevel(sceneId,selfId,53,150)
		LuaFnSetXinFaLevel(sceneId,selfId,54,150)
		LuaFnSetXinFaLevel(sceneId,selfId,63,150)
		LuaFnSetXinFaLevel(sceneId,selfId,80,150)
              local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 150 ph�i Ti�u Dao !", 4 )
		 BroadMsgByChatPipe(sceneId, selfId, strText, 4)

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 22 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
		LuaFnSetXinFaLevel(sceneId,selfId,1,150)
		LuaFnSetXinFaLevel(sceneId,selfId,2,150)
		LuaFnSetXinFaLevel(sceneId,selfId,3,150)
		LuaFnSetXinFaLevel(sceneId,selfId,4,150)
		LuaFnSetXinFaLevel(sceneId,selfId,5,150)
		LuaFnSetXinFaLevel(sceneId,selfId,6,150)
		LuaFnSetXinFaLevel(sceneId,selfId,55,150)
		LuaFnSetXinFaLevel(sceneId,selfId,72,150)
              local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 150 ph�i Thi�u L�m !", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 23 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
		LuaFnSetXinFaLevel(sceneId,selfId,43,150)
		LuaFnSetXinFaLevel(sceneId,selfId,44,150)
		LuaFnSetXinFaLevel(sceneId,selfId,45,150)
		LuaFnSetXinFaLevel(sceneId,selfId,46,150)
		LuaFnSetXinFaLevel(sceneId,selfId,47,150)
		LuaFnSetXinFaLevel(sceneId,selfId,48,150)
		LuaFnSetXinFaLevel(sceneId,selfId,62,150)
		LuaFnSetXinFaLevel(sceneId,selfId,79,150)
              local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 150 ph�i Thi�n S�n !", 4 )
		 BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )

		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 24 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
		LuaFnSetXinFaLevel(sceneId,selfId,37,150)
		LuaFnSetXinFaLevel(sceneId,selfId,38,150)
		LuaFnSetXinFaLevel(sceneId,selfId,39,150)
		LuaFnSetXinFaLevel(sceneId,selfId,40,150)
		LuaFnSetXinFaLevel(sceneId,selfId,41,150)
		LuaFnSetXinFaLevel(sceneId,selfId,42,150)
		LuaFnSetXinFaLevel(sceneId,selfId,61,150)
		LuaFnSetXinFaLevel(sceneId,selfId,78,150)
              local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 150 ph�i Thi�n Long !", 4 )

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 25 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
		LuaFnSetXinFaLevel(sceneId,selfId,25,150)
		LuaFnSetXinFaLevel(sceneId,selfId,26,150)
		LuaFnSetXinFaLevel(sceneId,selfId,27,150)
		LuaFnSetXinFaLevel(sceneId,selfId,28,150)
		LuaFnSetXinFaLevel(sceneId,selfId,29,150)
		LuaFnSetXinFaLevel(sceneId,selfId,30,150)
		LuaFnSetXinFaLevel(sceneId,selfId,59,150)
		LuaFnSetXinFaLevel(sceneId,selfId,76,150)
              local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 150 ph�i Nga My !", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 26 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
		LuaFnSetXinFaLevel(sceneId,selfId,19,150)
		LuaFnSetXinFaLevel(sceneId,selfId,20,150)
		LuaFnSetXinFaLevel(sceneId,selfId,21,150)
		LuaFnSetXinFaLevel(sceneId,selfId,22,150)
		LuaFnSetXinFaLevel(sceneId,selfId,23,150)
		LuaFnSetXinFaLevel(sceneId,selfId,24,150)
		LuaFnSetXinFaLevel(sceneId,selfId,58,150)
		LuaFnSetXinFaLevel(sceneId,selfId,75,150)
              local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 150 ph�i V� �ang !", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 27 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
		LuaFnSetXinFaLevel(sceneId,selfId,7,150)
		LuaFnSetXinFaLevel(sceneId,selfId,8,150)
		LuaFnSetXinFaLevel(sceneId,selfId,9,150)
		LuaFnSetXinFaLevel(sceneId,selfId,10,150)
		LuaFnSetXinFaLevel(sceneId,selfId,11,150)
		LuaFnSetXinFaLevel(sceneId,selfId,12,150)
		LuaFnSetXinFaLevel(sceneId,selfId,56,150)
		LuaFnSetXinFaLevel(sceneId,selfId,73,150)
              local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 150 ph�i Minh Gi�o !", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 28 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
		LuaFnSetXinFaLevel(sceneId,selfId,13,150)
		LuaFnSetXinFaLevel(sceneId,selfId,14,150)
		LuaFnSetXinFaLevel(sceneId,selfId,15,150)
		LuaFnSetXinFaLevel(sceneId,selfId,16,150)
		LuaFnSetXinFaLevel(sceneId,selfId,17,150)
		LuaFnSetXinFaLevel(sceneId,selfId,18,150)
		LuaFnSetXinFaLevel(sceneId,selfId,57,150)
		LuaFnSetXinFaLevel(sceneId,selfId,74,150)
              local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 150 ph�i C�i Bang !", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 15 then
                local   	NameM	= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "VIP" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#GXin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 16 then
		TryRecieveItem( sceneId, selfId, 30900016, 1 )
		Msg2Player( sceneId, selfId, "B�n �� nh�n th�nh c�ng 500 �i�m c�c ng�c qu�.", MSG2PLAYER_PARA )
	end

      if key == 181 then

         local  nam= LuaFnGetName( sceneId, selfId )

            local lastDayTime1 = GetMissionData( sceneId, selfId, MF_LINGQUYUANBAOMP2)
	   
            local CurDayTime1 = GetDayTime()

	           if CurDayTime1 > lastDayTime1 then

                  BeginEvent(sceneId)
		   
                             --for i = 0,30 do 

                                    -- TryRecieveItem( sceneId, selfId, 30505107, 1 )

                                 --  end
                            TryRecieveItem( sceneId, selfId, 10113054, 1 )
TryRecieveItem( sceneId, selfId, 10113054, 1 )
TryRecieveItem( sceneId, selfId, 10113054, 1 )
                SetMissionData( sceneId, selfId, MF_LINGQUYUANBAOMP2, CurDayTime1 )

                 str = "#cffffccXin ch�c m�ng <#c00ff00"..nam.."#cffffcc>�� nh�n th�nh c�ng danh hi�u."

                   BroadMsgByChatPipe(sceneId, selfId, str, 4)

		   AddText(sceneId,"H�y quay l�i v�o ng�y mai. ")

		  EndEvent(sceneId)

		  DispatchEventList(sceneId,selfId,targetId)
                
                                else

		BeginEvent(sceneId)
			AddText(sceneId," H�y quay l�i v�o ng�y mai.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	
	    end
	if key  == 19 then
           TryRecieveItem( sceneId, selfId, 10113054, 1 ) 
                BeginEvent(sceneId)
                            
		  AddText(sceneId,"Th�nh c�ng. ");
		  EndEvent(sceneId)
		  DispatchEventList(sceneId,selfId,targetId)
                  end
	

          end
    
end




--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x002095_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--��Ϣ��ʾ
--**********************************
function x002095_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�Ի���ʾ
--**********************************
function x002095_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end
--**********************************
--ת������
--**********************************
function x002095_Level12 (sceneId, selfId, targetId)
	if GetExp(sceneId,selfId) < 0  then
		BeginEvent( sceneId )
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
			LuaFnAddExp(sceneId,selfId,GetExp(sceneId,selfId)*-1)
			AddText(sceneId,"�������Ұɣ���10��Ӧ�þͽ���������⣡����...")
		EndEvent( sceneId )
	else

		BeginEvent( sceneId )
			AddText(sceneId,"ʧ��,ֻ�д�ֻ�ò��˾������Ҳ���ʹ�ô˹���!!...")
		EndEvent( sceneId )

	end
	

	DispatchEventList( sceneId, selfId, targetId )

end

function x002095_ZhuanSheng( sceneId, selfId, targetId )
	local zhuanshengTimes = GetMissionData(sceneId, selfId, MD_ZHUANSHENG)
	if zhuanshengTimes >= 90000 then
		BeginEvent( sceneId )
			AddText( sceneId, "H�n ch� 90000 l�n chuy�n sinh." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return -1
	end
	
	local	lev	= GetLevel( sceneId, selfId )
	if zhuanshengTimes >= 250 then
		if lev < 149 then
			BeginEvent( sceneId )
			AddText( sceneId, "��ng c�p nh� h�n #G149#W. H�y quay l�i khi ��t c�p � #G149.#W " )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return -1
		end
		local number = LuaFnGetAvailableItemCount(sceneId, selfId, 39901002)
		if number<100 then
			BeginEvent( sceneId )
			AddText( sceneId, "#GC�c h� c�n thu th�p �� #Y100 #Gvi�n #W#{_ITEM30505013} #G� c� th� chuy�n sinh." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return -1
		else
			local reply = LuaFnDelAvailableItem(sceneId,selfId,39901002,100)
		end
	end
	
	--local mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
	
	
	if zhuanshengTimes >100 then
		if lev < 149 then
			BeginEvent( sceneId )
			AddText( sceneId, "��ng c�p nh� h�n #G149#W. H�y quay l�i khi ��t c�p � #G149.#W " )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		return -1
		end
		
	end
	if lev < 130 then
		BeginEvent( sceneId )
		AddText( sceneId, "��ng c�p nh� h�n #G149#W. H�y quay l�i khi ��t c�p � #G149#W " )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return -1
	end

        SetLevel( sceneId, selfId, 30)
	    
	SetMissionData(sceneId, selfId, MD_ZHUANSHENG, zhuanshengTimes+1 )
	zhuanshengTimes = zhuanshengTimes+1
	BeginEvent(sceneId)
		AddText(sceneId,"#GCh�c m�ng, chuy�n sinh l�n #Y"..zhuanshengTimes.. " #Gth�nh c�ng!!!")
		AddText( sceneId, "#WServer gi�i h�n s� l�n chuy�n sinh l� #Y1500" )
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	BeginEvent(sceneId)
		AddText(sceneId,"#GCh�c m�ng, chuy�n sinh l�n #Y"..zhuanshengTimes.. " #Gth�nh c�ng!!!")
		AddText( sceneId, "#WServer gi�i h�n s� l�n chuy�n sinh l� #Y1500" )
	EndEvent(sceneId)
	DispatchEventList( sceneId, selfId, targetId )
	local 	nam	= LuaFnGetName( sceneId, selfId )
	local szMsg = format("#58#gFFFF00Ch�c m�ng #W#{_INFOUSR%s} #gFFFF00�� chuy�n sinh th�nh c�ng ! #58",nam)
		
	AddGlobalCountNews( sceneId, szMsg )
	
end

function x002095_Shengji (sceneId, selfId, targetId)
	local	lev	= GetLevel( sceneId, selfId )
	if lev < 148 then
		BeginEvent( sceneId )
		AddText( sceneId, "C�p � ch�a �� #G149#W. H�y quay l�i khi ��t c�p � #G149#W." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return -1
	end
	SetLevel( sceneId, selfId, 150)
	BeginEvent(sceneId)
		AddText(sceneId,"Ch�c m�ng, th�nh c�ng.!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	BeginEvent( sceneId )
		AddText( sceneId, "Th�ng c�p 150 th�nh c�ng." )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#48#eaf0000Ch�c m�ng "..nam.." �� th�ng l�n 150 c�p !!#48", 4 )
end