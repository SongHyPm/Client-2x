--T� Ch�uNPC
--ÿ���� �i�mL�nh Ա
--m�t ��
x002094_g_ScriptId = 002094


--**********************************
--�¼��������
--**********************************
function x002094_OnDefaultEvent( sceneId, selfId,targetId )
      local 	nam	= LuaFnGetName( sceneId, selfId )
	BeginEvent(sceneId)
            --AddNumText( sceneId, x002094_g_ScriptId, "Nh�n V�ng  (1l�n/ng�y)",5,10 )
            AddText(sceneId,"          ++#BCh�o m�ng "..nam.." �n v�i #YTLBB Huy�n")
	                 AddNumText( sceneId, x002094_g_ScriptId, "S�a l�i kinh nghi�m <0>#1",5,11 ) 
            AddNumText( sceneId, x002094_g_ScriptId, "#YNh�n T�m Ph�p ",5,14 )                      
            AddNumText( sceneId, x002093_g_ScriptId, "#b#G Buff Tr�ng L�u",5,101 )
            AddNumText( sceneId, x002093_g_ScriptId, "#b#G Buff �m kh�,ph�p b�o",5,102 )
            AddNumText( sceneId, x002093_g_ScriptId, "#b#G V�nh H�ng To�n Gi�i",5,103 )
            AddNumText( sceneId, x002093_g_ScriptId, "#b#G Nh�n Buff",5,100 )
            --AddNumText( sceneId, x002070_g_ScriptId, "T�i mu�n nh�n 30 v�ng",5,10 )
            AddNumText( sceneId, x002094_g_scriptId, "#31#gffff00T�i mu�n nh�n 12 k� n�ng c� b�n#31", 5, 4242)
            AddNumText( sceneId, x002094_g_ScriptId, "#e195e1a#c72d27cT�i mu�n n�ng level t� 149 l�n 150",5,3333 )
            AddNumText( sceneId, x002094_g_ScriptId, "T�i mu�n nh�n �i�m t�ng",5,6666 )
            AddNumText( sceneId, x002094_g_ScriptId, "T�i mu�n chuy�n sinh",5,5555 )
            AddNumText( sceneId, x002094_g_ScriptId, "#cFF0000Nh�n Danh Hi�u",5,105 )
            AddNumText( sceneId, x002094_g_ScriptId, "#e195e1a#c72d27cNh�n Pet",5,12 )
            
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end


function x002094_OnEventRequest( sceneId, selfId, targetId, eventId )
local	key	= GetNumText()
          if key  == 104 then
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9243, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 15974, 0)
                BeginEvent(sceneId)
	        AddText(sceneId,"#GNh�n Hi�u �ng Th�nh c�ng!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
                end

          if key  == 103 then
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 75, 0)
               
                BeginEvent(sceneId)
	        AddText(sceneId,"#GNh�n Hi�u �ng Th�nh c�ng!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
                end

        if key  == 102 then
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 32408, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 32407, 0)
              
                BeginEvent(sceneId)
	        AddText(sceneId,"#GNh�n Hi�u �ng Th�nh c�ng!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
                end


        if key  == 101 then
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5953, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5954, 0)
              
                BeginEvent(sceneId)
	        AddText(sceneId,"#GNh�n Hi�u �ng Th�nh c�ng!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
                end

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
                BeginEvent(sceneId)
	        AddText(sceneId,"Nh�n BUFF th�nh c�ng !")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
                end
	 if key  == 10 then
   		AddMoney( sceneId, selfId, 300000 )

		BeginEvent(sceneId)
		AddText(sceneId,"#BCh�c m�ng, nh�n th�nh c�ng 30 #-02. C�m �n �� �ng h� Thi�n Long Cu�ng Long Ki�m.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
            end
	 if key  == 6666 then
   ZengDian(sceneId,selfId,targetId,1,300000)

		BeginEvent(sceneId)
		AddText(sceneId,"#gffff00Nh�n th�nh c�ng 300 000 �i�m t�ng.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
if key  == 11 then
	x002094_Level12(sceneId, selfId, targetId)
end
if key == 18 then

                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30150, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"#gffff00Nh�n BUFF th�nh c�ng.")
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
		       BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:#gffff00Nh�n k� n�ng th�nh c�ng.", 0)
end
if key == 3333 then
		BeginEvent( sceneId )
		AddText( sceneId, "#gF4F4F4B�n mu�n n�ng c�p t� 149 l�n 150 ?" )
		AddNumText(sceneId, x181003_g_scriptId, "#gF4F4F4C�, t�i mu�n.", 7, 4444 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
end
if key == 4444 then
		x002094_Shengji( sceneId, selfId, targetId )
end
if key == 5555 then
		BeginEvent( sceneId )
		AddText( sceneId, "#gF4F4F4B�n c� ch�c l� mu�n chuy�n sinh ?#r Y�u c�u c�p �: #G130 #r#WSau khi chuy�n sinh gi� nguy�n t�t c�. #GSau khi chuy�n sinh c�p � tr� v� 30." )
		AddNumText(sceneId, x181003_g_scriptId, "#gF4F4F4C�, t�i mu�n chuy�n sinh", 7, 5566 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
end
if key == 5566 then
		x002094_ZhuanSheng( sceneId, selfId, targetId )
end

if key == 12 then

BeginEvent(sceneId)
AddText( sceneId, "Ch�o b�n, h�y ch�n tr�n th� b�n mu�n #r#GCh�n ��ng tr�n th� c� th� d�ng ���c nh� b�n.#b#cFF0000L�u Y: ch� ���c ch�n 1 l�n" )
		--AddNumText( sceneId, x002094_g_ScriptId, "#gffff00Tr�n th� h�i xu�n �an",5,50 )
		--AddNumText( sceneId, x002094_g_ScriptId, "#gffff00Tr�n th� h�i xu�n �an",5,51 )
		--AddNumText( sceneId, x002094_g_ScriptId, "#gffff00Tr�n th� h�i xu�n �an",5,52 )
		AddNumText( sceneId, x002094_g_ScriptId, "#gffff00B� D�c �i�u Bi�n d�",5,53 )
		AddNumText( sceneId, x002094_g_ScriptId, "#gffff00C�ng K� Bi�n D�",5,54 )
		AddNumText( sceneId, x002094_g_ScriptId, "#gffff00�߶ng Trang Th� Bi�n D�",5,55 )
		AddNumText( sceneId, x002094_g_ScriptId, "#gffff00Long Quy Bi�n D�",5,56 )
		AddNumText( sceneId, x002094_g_ScriptId, "#gffff00�p Chu� Th� Bi�n D�",5,57 )
		AddNumText( sceneId, x002094_g_ScriptId, "#gffff00Th� ��i H�ng Bi�n D�",5,58 )
EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
if key == 50 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "#gffff00B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9110, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gffff00Xin ch�c m�ng "..nam.." Tr�n th� h�i xu�n �an", 4 )
			str= "#gffff00B�n �� c� PET. "
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
			AddText(sceneId, "#gffff00B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9120, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gffff00Xin ch�c m�ng "..nam.." Tr�n th� h�i xu�n �an", 4 )
			str= "#gffff00B�n �� c� PET."
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
			AddText(sceneId, "#gffff00B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9130, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gffff00Xin ch�c m�ng "..nam.." Tr�n th� h�i xu�n �an", 4 )
			str= "#gffff00B�n �� c� PET."
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 53 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 2 then
			BeginEvent(sceneId)
			AddText(sceneId, "#gffff00B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 22266, 1, 0);
		if createPetRet and createPetRet == 2 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gffff00Xin ch�c m�ng "..nam.." �� nh�n th�nh c�ng Boss PET", 4 )
			str= "#gffff00B�n �� c� PET ."
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
			AddText(sceneId, "#gffff00B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 22068, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gffff00Xin ch�c m�ng "..nam.." �� nh�n th�nh c�ng PET", 4 )
			str= "#gffff00B�n �� c�  PET."
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
			AddText(sceneId, "#gffff00B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
			
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 8808, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gffff00Xin ch�c m�ng "..nam.." �� nh�n th�nh c�ng PET", 4 )
			str= "#gffff00B�n �� c� PET."
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
			AddText(sceneId, "#gffff00B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 3317, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gffff00Xin ch�c m�ng "..nam.." �� nh�n th�nh c�ng PET", 4 )
			str= "#gffff00B�n �� c� #WBOSS PET."
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
			AddText(sceneId, "#gffff00B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 7568, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gffff00Xin ch�c m�ng "..nam.." �� nh�n th�nh c�ng PET", 4 )
			str= "#gffff00B�n �� c� PET."
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
			AddText(sceneId, "#gffff00B�n �� nh�n th߷ng.#G Kh�ng th� nh�n n�a.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 8548, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gffff00Xin ch�c m�ng "..nam.." �� nh�n th�nh c�ng PET", 4 )
			str= "#gffff00B�n �� c� PET."
			BeginEvent( sceneId )

			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	if key == 13 then
		local CurTime = GetHourTime();
		local iTime = GetMissionData( sceneId, selfId, MF_LINGQUYUANBAOEXP );
		if iTime+1 >= CurTime then
			BeginEvent( sceneId )
			AddText( sceneId, "#gffff00K�nh ch�o b�n, b�n ch� c� th� nh�n ���c trong v�ng 1 gi�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
          for i = 0,300 do
          AddExp(sceneId,selfId,700000)
               end
			
			SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOEXP, CurTime);
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." nh�n th�nh c�ng 2 tri�u �i�m kinh nghi�m. ", 4 )
			BeginEvent( sceneId )
				AddText( sceneId, "#gffff00B�n �� nh�n th�nh c�ng 2 tri�u �i�m kinh nghi�m. Ch�c b�n ch�i vui." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	end
		if key == 14 then
	BeginEvent( sceneId )
		AddText( sceneId, "H�y ch�n m�n ph�i b�n mu�n gia nh�p. #GSau khi gia nh�p m�n ph�i b�n s� ���c t�m ph�p 110.#YL�u �: �i�m thu�c t�nh ( �i�m c�ng +) s� tr� v� 0 khi b�n s� d�ng ch�c n�ng n�y #G V� ch� d�ng cho ng߶i chuy�n sinh t� 5 l�n tr� xu�ng." )
		AddNumText( sceneId, x002094_g_ScriptId, "Tinh T�c",3,20 )
		AddNumText( sceneId, x002094_g_ScriptId, "Ti�u Dao",3,21 )
		AddNumText( sceneId, x002094_g_ScriptId, "Thi�u L�m",3,22 )
		AddNumText( sceneId, x002094_g_ScriptId, "Thi�n S�n",3,23 )
		AddNumText( sceneId, x002094_g_ScriptId, "Thi�n Long",3,24 )
		AddNumText( sceneId, x002094_g_ScriptId, "Nga Mi",3,25 )
		AddNumText( sceneId, x002094_g_ScriptId, "V� �ang",3,26 )
		AddNumText( sceneId, x002094_g_ScriptId, "Minh Gi�o",3,27 )
		AddNumText( sceneId, x002094_g_ScriptId, "C�i Bang",3,28 )
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 20 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "Ch�o b�n, h�m nay b�n �� s� d�ng ch�c n�ng n�y. M�i ng�y ch� ���c d�ng ch�c n�ng n�y m�t l�n. #rH�y quay l�i v�o h�m sau." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
		LuaFnSetXinFaLevel(sceneId,selfId,31,130)
		LuaFnSetXinFaLevel(sceneId,selfId,32,130)
		LuaFnSetXinFaLevel(sceneId,selfId,33,130)
		LuaFnSetXinFaLevel(sceneId,selfId,34,130)
		LuaFnSetXinFaLevel(sceneId,selfId,35,130)
		LuaFnSetXinFaLevel(sceneId,selfId,36,130)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 130 th�nh c�ng !", 4 )
		 BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 21 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "Ch�o b�n, h�m nay b�n �� s� d�ng ch�c n�ng n�y. M�i ng�y ch� ���c d�ng ch�c n�ng n�y m�t l�n. #rH�y quay l�i v�o h�m sau." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
		LuaFnSetXinFaLevel(sceneId,selfId,49,130)
		LuaFnSetXinFaLevel(sceneId,selfId,50,130)
		LuaFnSetXinFaLevel(sceneId,selfId,51,130)
		LuaFnSetXinFaLevel(sceneId,selfId,52,130)
		LuaFnSetXinFaLevel(sceneId,selfId,53,130)
		LuaFnSetXinFaLevel(sceneId,selfId,54,130)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 130 th�nh c�ng !", 4 )
		 BroadMsgByChatPipe(sceneId, selfId, strText, 4)

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);

		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 22 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "Ch�o b�n, h�m nay b�n �� s� d�ng ch�c n�ng n�y. M�i ng�y ch� ���c d�ng ch�c n�ng n�y m�t l�n. #rH�y quay l�i v�o h�m sau." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
		LuaFnSetXinFaLevel(sceneId,selfId,1,130)
		LuaFnSetXinFaLevel(sceneId,selfId,2,130)
		LuaFnSetXinFaLevel(sceneId,selfId,3,130)
		LuaFnSetXinFaLevel(sceneId,selfId,4,130)
		LuaFnSetXinFaLevel(sceneId,selfId,5,130)
		LuaFnSetXinFaLevel(sceneId,selfId,6,130)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 130 th�nh c�ng !", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 23 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "Ch�o b�n, h�m nay b�n �� s� d�ng ch�c n�ng n�y. M�i ng�y ch� ���c d�ng ch�c n�ng n�y m�t l�n. #rH�y quay l�i v�o h�m sau." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
		LuaFnSetXinFaLevel(sceneId,selfId,43,130)
		LuaFnSetXinFaLevel(sceneId,selfId,44,130)
		LuaFnSetXinFaLevel(sceneId,selfId,45,130)
		LuaFnSetXinFaLevel(sceneId,selfId,46,130)
		LuaFnSetXinFaLevel(sceneId,selfId,47,130)
		LuaFnSetXinFaLevel(sceneId,selfId,48,130)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 130 th�nh c�ng !", 4 )
		 BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 24 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "Ch�o b�n, h�m nay b�n �� s� d�ng ch�c n�ng n�y. M�i ng�y ch� ���c d�ng ch�c n�ng n�y m�t l�n. #rH�y quay l�i v�o h�m sau." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
		LuaFnSetXinFaLevel(sceneId,selfId,37,130)
		LuaFnSetXinFaLevel(sceneId,selfId,38,130)
		LuaFnSetXinFaLevel(sceneId,selfId,39,130)
		LuaFnSetXinFaLevel(sceneId,selfId,40,130)
		LuaFnSetXinFaLevel(sceneId,selfId,41,130)
		LuaFnSetXinFaLevel(sceneId,selfId,42,130)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 130 th�nh c�ng !", 4 )

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 25 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "Ch�o b�n, h�m nay b�n �� s� d�ng ch�c n�ng n�y. M�i ng�y ch� ���c d�ng ch�c n�ng n�y m�t l�n. #rH�y quay l�i v�o h�m sau." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
		LuaFnSetXinFaLevel(sceneId,selfId,25,130)
		LuaFnSetXinFaLevel(sceneId,selfId,26,130)
		LuaFnSetXinFaLevel(sceneId,selfId,27,130)
		LuaFnSetXinFaLevel(sceneId,selfId,28,130)
		LuaFnSetXinFaLevel(sceneId,selfId,29,130)
		LuaFnSetXinFaLevel(sceneId,selfId,30,130)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 130 th�nh c�ng !", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 26 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "Ch�o b�n, h�m nay b�n �� s� d�ng ch�c n�ng n�y. M�i ng�y ch� ���c d�ng ch�c n�ng n�y m�t l�n. #rH�y quay l�i v�o h�m sau." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
		LuaFnSetXinFaLevel(sceneId,selfId,19,130)
		LuaFnSetXinFaLevel(sceneId,selfId,20,130)
		LuaFnSetXinFaLevel(sceneId,selfId,21,130)
		LuaFnSetXinFaLevel(sceneId,selfId,22,130)
		LuaFnSetXinFaLevel(sceneId,selfId,23,130)
		LuaFnSetXinFaLevel(sceneId,selfId,24,130)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 130 th�nh c�ng !", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 27 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "Ch�o b�n, h�m nay b�n �� s� d�ng ch�c n�ng n�y. M�i ng�y ch� ���c d�ng ch�c n�ng n�y m�t l�n. #rH�y quay l�i v�o h�m sau." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
		LuaFnSetXinFaLevel(sceneId,selfId,7,130)
		LuaFnSetXinFaLevel(sceneId,selfId,8,130)
		LuaFnSetXinFaLevel(sceneId,selfId,9,130)
		LuaFnSetXinFaLevel(sceneId,selfId,10,130)
		LuaFnSetXinFaLevel(sceneId,selfId,11,130)
		LuaFnSetXinFaLevel(sceneId,selfId,12,130)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 130 th�nh c�ng !", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 28 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "Ch�o b�n, h�m nay b�n �� s� d�ng ch�c n�ng n�y. M�i ng�y ch� ���c d�ng ch�c n�ng n�y m�t l�n. #rH�y quay l�i v�o h�m sau." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
		LuaFnSetXinFaLevel(sceneId,selfId,13,130)
		LuaFnSetXinFaLevel(sceneId,selfId,14,130)
		LuaFnSetXinFaLevel(sceneId,selfId,15,130)
		LuaFnSetXinFaLevel(sceneId,selfId,16,130)
		LuaFnSetXinFaLevel(sceneId,selfId,17,130)
		LuaFnSetXinFaLevel(sceneId,selfId,18,130)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#GCh�c m�ng "..nam.." �� nh�n t�m ph�p 130 th�nh c�ng !", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#GB�n �� nh�n BUFF t�m ph�p th�nh c�ng. Ch�c b�n ch�i vui v� !" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	
if key == 105 then  

BeginEvent(sceneId)
local	nam	= LuaFnGetName( sceneId, selfId )
AddText( sceneId, "#gffff00Ch�o "..nam.." , h�y ch�n Danh Hi�u b�n Mu�n , Danh Hi�u th� hi�n b�n th�n, c�ng nh� danh t�n c�a c�c h�!" )
		AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #b#cff00f0Ki�u Sa #33L�ng L�y ",5,1 )
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #b#ebb3e9f#cfd94b0Thi�n Th�n ",5,3 )  
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #cff9900Щp Trai #46Phong е ",5,2 )
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #e96491f#gFF0FA0�ng X� #33B� X� ",5,4 )
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #b#eCD2990V.I.P ",5,15 )
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #e96491f#gFF0FA0B� X� #33�ng X� ",5,5 )
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #e96491f#gFF0FA0"..nam.." Ti�n T�",5,6 ) 
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #e96491f#gFF0FA0#46#46"..nam.."#46#46",5,7 )       
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #46#46#46#46#46",5,8 )           
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #e96491f#gFF0FA0Cu�ng Long Ki�m ",5,33 )
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #e96491f#gFF0FA0"..nam.." Щp Trai",5,9 )
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #e96491f#gFF0FA0"..nam.." Xinh Xinh",5,34 )
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #b#eCD2990B�p B�",5,44 )
            AddNumText( sceneId, x002094_g_ScriptId, "Nh�n �anh hi�u #e96491f#gFF0FA0#4 One Top ",5,70 )
EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end

if key == 70 then
                local   	NameM	= GetName( sceneId, ObjIDM )
                local	nam	= LuaFnGetName( sceneId, selfId )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#cFF0000#42k11#4" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#e96491f#gFF0FA0Ch�c m�ng "..nam.." �� nh�n danh hi�u #e96491f#gFF0FA0#4 2k11#4 ,ch�c "..nam.." ch�i game zui z� !!.", 4 )
            AddText( sceneId, "#cff6633Thi�n Long B�t B� Cu�ng Long Ki�m ch�c c�c member or gamer c� kho�ng th�i gian th� gi�n khi ch�i game!!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

if key == 34 then
                local   	NameM	= GetName( sceneId, ObjIDM )
                local	nam	= LuaFnGetName( sceneId, selfId )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#e96491f#gFF0FA0"..nam.." Xinh Xinh" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #e96491f#gFF0FA0"..nam.." Xinh Xinh", 4 )
            AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end


if key == 9 then
                local   	NameM	= GetName( sceneId, ObjIDM )
                local	nam	= LuaFnGetName( sceneId, selfId )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#e96491f#gFF0FA0"..nam.." Щp Trai" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #e96491f#gFF0FA0"..nam.." Щp Trai", 4 )
            AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end


if key == 8 then
                local   	NameM	= GetName( sceneId, ObjIDM )
                local	nam	= LuaFnGetName( sceneId, selfId )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#46#46#46#46#46" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #46#46#46#46#46", 4 )
            AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end


if key == 7 then
                local   	NameM	= GetName( sceneId, ObjIDM )
                local	nam	= LuaFnGetName( sceneId, selfId )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#e96491f#gFF0FA0#46#46"..nam.."#46#46" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #e96491f#gFF0FA0#46#46"..nam.."#46#46", 4 )
            AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end


if key == 6 then
                local   	NameM	= GetName( sceneId, ObjIDM )
                local	nam	= LuaFnGetName( sceneId, selfId )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#e96491f#gFF0FA0"..nam.." Ti�n T�" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #e96491f#gFF0FA0"..nam.." Ti�n T�", 4 )
            AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end


if key == 5 then
                local   	NameM	= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#e96491f#gFF0FA0B� X� #33�ng X�" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #e96491f#gFF0FA0B� X� #33�ng X�", 4 )
            AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end


if key == 4 then
                local   	NameM	= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#e96491f#gFF0FA0�ng X� #33B� X�" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #e96491f#gFF0FA0�ng X� Y�u B� X�", 4 )
            AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end


if key == 3 then
                local   	NameM	= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#ebb3e9f#cfd94b0Thi�n Th�n" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #b#ebb3e9f#cfd94b0Thi�n Th�n  ", 4 )
            AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

if key == 2 then
                local   	NameM	= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#cff9900Щp Trai #46Phong е" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #cff9900Щp Trai #46Phong е ", 4 )
            AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end


if key == 1 then
                local   	NameM	= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#cff00f0Ki�u Sa #33L�ng L�y" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #b#cff00f0Ki�u Sa #33L�ng L�y ", 4 )
		AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
            EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end


if key == 15 then
                local   	NameM	= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#eCD2990V.I.P" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #b#eCD2990V.I.P ", 4 )
            AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
      if key == 33 then
                local   	NameM	= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#e96491f#gFF0FA0Cu�ng Long Ki�m" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#gffff00Ch�c m�ng "..nam.." �� nh�n danh hi�u #e96491f#gFF0FA0Thi�n Long Cu�ng Long Ki�m ", 4 )
	      AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
      if key == 44 then
                local   	NameM	= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "Ю t�" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#eCD2990B�p B�" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#gffff00Xin ch�c m�ng b�n �� nh�n th�nh c�ng danh hi�u." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

	if key == 16 then
		TryRecieveItem( sceneId, selfId, 30900016, 1 )
		Msg2Player( sceneId, selfId, "#gffff00B�n �� nh�n th�nh c�ng 500 �i�m c�c ng�c qu�.", MSG2PLAYER_PARA )
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
function x002094_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--��Ϣ��ʾ
--**********************************
function x002094_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�Ի���ʾ
--**********************************
function x002094_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end
--**********************************
--ת��Kinh nghi�m
--**********************************
function x002094_Level12 (sceneId, selfId, targetId)
	if GetExp(sceneId,selfId) < 0  then
		BeginEvent( sceneId )
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
                  AddText(sceneId,"#YCh�c m�ng b�n �� s�a Exp th�nh c�ng!#r#b#e96491f#gFF0FA0 N�u Exp v�n = 0 xin vui l�ng �n s�a ti�p �n khi Exp v� B�nh th߶ng... C�m �n!")
		EndEvent( sceneId )
	else

		BeginEvent( sceneId )
                  local	nam	= LuaFnGetName( sceneId, selfId )
			AddText(sceneId,"#G#14#14#14�ng "..nam.." �i !Ch� nh�ng ai c� Kn v� <0> m�i s� d�ng T�nh n�ng n�y Th�i �ng a.!!...#14#14#14")
		EndEvent( sceneId )

	end
	

	DispatchEventList( sceneId, selfId, targetId )

end


function x002094_ZhuanSheng( sceneId, selfId, targetId )
	local zhuanshengTimes = GetMissionData(sceneId, selfId, MD_ZHUANSHENG)
	if zhuanshengTimes >10000000 then
		x002094_NotifyTip( sceneId, selfId, "H�n ch� 5 l�n chuy�n sinh." )
		x002094_MsgBox( sceneId, selfId, targetId, "H�n ch� 5 l�n chuy�n sinh." )
		return
	end
	local mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
	local	lev	= GetLevel( sceneId, selfId )
	if lev < 130 then
		BeginEvent( sceneId )
		AddText( sceneId, "��ng c�p nh� h�n #G130#W. H�y quay l�i khi ��t c�p � #G130#W. " )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return -1
	end

        SetLevel( sceneId, selfId, 30)
	     YuanBao(sceneId,selfId,targetId,1,500000)
	     ZengDian(sceneId,selfId,targetId,1,450000)
	SetMissionData(sceneId, selfId, MD_ZHUANSHENG, zhuanshengTimes+1 )
	local nCS = GetMissionData(sceneId, selfId, MD_ZHUANSHENG )
	BeginEvent(sceneId)
		AddText(sceneId,"Ch�c m�ng, chuy�n sinh l�n "..nCS.." th�nh c�ng!!!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	BeginEvent( sceneId )
		AddText( sceneId, "#WCh�c m?ng chuy?n sinh th�nh c�ng #1." )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#48#gFFFF00Ch�c m�ng "..nam.." �� chuy�n sinh th�nh c�ng ! #48", 4 )
end

function x002094_Shengji (sceneId, selfId, targetId)
	local	lev	= GetLevel( sceneId, selfId )
	if lev < 149 then
		BeginEvent( sceneId )
		AddText( sceneId, "C�p � ch�a �� #G140#W. H�y quay l�i khi ��t c�p � #G140#W." )
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
	BroadMsgByChatPipe( sceneId, selfId, "#48#gFFFF00Ch�c m�ng "..nam.." �� th�ng l�n 150 c�p !!#48", 4 )
end
