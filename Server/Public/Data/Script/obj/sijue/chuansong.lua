-- �콱NPC

x899994_g_scriptId = 899994
x899994_g_duihuan_scriptId = 77

--**********************************
--�¼��������
--**********************************
function x899994_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "B�n � m�i nh�t �ang � T� Tuy�t Trang....!" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   		--AddText( sceneId, "  #G������������to� � #Yɨ��ɮ,#G�������˴�����T� Tuy�t ׯ����#Y���˲�ʮ���������#G������m�t to� � #cFF0000ɨ��ɮto� � �ټ�,#GֻҪ�����������Щ,#W�Ҿʹ�Ӧ�㲢����������ս,��ΪC�a ng߽i ���ޣ�" )	
		   		--AddText( sceneId, "  ����#cFF0000�� #Y��#cFF0000��#Y��#cFF0000��#Y��#cFF0000��#Y��#cFF0000��#Y��#G�ȿ��Ը��Ҷm�t �#Yɨ��ɮ���ᣡ#G��������ٻ���#cFF0000ɨ��ɮ����#Gm�t ֻ,����ԭʼ����#cFF0000100000#G �i�m,ɨ��ɮ���޿�������#G�������޼��ܣ�" )	
		   		AddText( sceneId, "  T� tuy�t trang b�n sao r�i ra: T�i t�n b�o b�o, B�o th�ch, Nguy�t quang b�o h�p, B�o th�ch t߽ng kh�m, BOSS t�p, Chung c�c th�n kh� �� t�o � v� c�c lo�i cao c�p h�p th�nh ph�!" )	
		   		--AddText( sceneId, "  #Gע��#Y:#cFF0000ѪսT� Tuy�t ׯ#Yˢ��� �i�m���#Gÿ��#cFF0000�� �i�m#Gˢ��,ʱ��Ϊ#Y30 ph�t#G�����" )
		   		--AddNumText( sceneId, x899994_g_ScriptId, "#e6f00c7�m�t �[���µ�m�t ����]", 4, 10 )
		   		--AddNumText( sceneId, x899994_g_ScriptId, "#cf30768ɨ��ɮ����:[Ph�c h� h�ng long ch߷ng]��ȡ", 4, 20 )
		   		AddNumText( sceneId, x899994_g_ScriptId, "#e0ba4b6�n o�n T� Tuy�t Trang", 6, 30 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x899994_OnEventRequest( sceneId, selfId, targetId, eventId )
	--if eventId == x805016_g_duihuan_scriptId then
		--CallScriptFunction( x805016_g_duihuan_scriptId, "OnEventRequest",sceneId, selfId, targetId, GetNumText() )	
		--return
	--end

	if GetNumText() == 210 then
		BeginEvent( sceneId )
   		local n = GetMonsterCount(sceneId)
		if n>170 then
   		strText = "Tr߾c m�t s� l��ng qu�i v�t l�: "..n..", l�m gi�m s� l��ng qu�i xu�ng 170 th� n� s� h�i sinh con kh�c,!"
  		AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
   		else 
		BeginEvent( sceneId )
		LuaFnCreateMonster(531, 39339, 30, 30, 17, 0, 402030)
                AddText( sceneId, "G�i qu�i v�t m�i th�nh c�ng! B�n quan c�ng qu�i v�t t�ng s� l��ng l�: "..n.."!" )
           	AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		end

	elseif GetNumText() == 10 then
	    if LuaFnGetAvailableItemCount(sceneId, selfId, 30505099) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505100) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505101) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505102) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505103) < 1	then
		x899994_MsgBox( sceneId, selfId, "Th�c xin l�i, v�t ph�m kh�ng ��, kh�ng th� �i!" )	
		return
           else
	       local bDelOk1 = LuaFnDelAvailableItem(sceneId,selfId, 30505099, 1)
	       local bDelOk2 = LuaFnDelAvailableItem(sceneId,selfId, 30505100, 1)
	       local bDelOk3 = LuaFnDelAvailableItem(sceneId,selfId, 30505101, 1)
	       local bDelOk4 = LuaFnDelAvailableItem(sceneId,selfId, 30505102, 1)
	       local bDelOk5 = LuaFnDelAvailableItem(sceneId,selfId, 30505103, 1)

	       if bDelOk1 < 1 or bDelOk2 < 1 or bDelOk3 < 1 or bDelOk4 < 1 or bDelOk5 < 1 then
		x899994_MsgBox( sceneId, selfId, "Th�c xin l�i, v�t ph�m kh�ng ��, kh�ng th� �i!" )	
		return
	       else
		--����Ҷ���,���
		local nBagIndex = TryRecieveItem( sceneId, selfId, 30503060, 1 )
		x899994_MsgBox( sceneId, selfId, "бi th�nh c�ng!" )	
				
		local message;	
		local randMessage = random(2);
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		else
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	       end
      end

	elseif GetNumText() == 20 then
		BeginEvent( sceneId )
		AddText( sceneId, "  Thu th�p #cFF000088#Gr߽ng #Yc� th� t�n hi�t #G m� ra nh�n ���c #cFF0000t�o �a tr�n th�#G, c� th� l�nh #cFF0000T�o �a tuy�t k� #Gph�c h� h�ng long ch߷ng,#G �n #Ytr�n th� th߽ng nh�n #cFF0000V�n Mi�u Mi�u #G��i!" )	
		AddText( sceneId, "  #G[#YTuy�t k�: Ph�c h� h�ng long ch߷ng]#cFF0000 k� n�ng qu�n th�,#W ��nh tr߾c m�t,#G15 th߾c #Wtrong ph�m vi nhi�u nh�t #Y6 m�c ti�u #W�ng th�i b� th߽ng t�n tr�c ti�p,#G gi�m #cFF000025% huy�t,#W c�ng l�c m�c ti�u l�m v�o #cFF0000tr�ng th�i �nh th�n, #Y kh�ng th� di chuy�n #W v� #Ys� d�ng k� n�ng,#G li�n t�c #cFF00005#Ggi�y, #Wph�c h�i #cFF00005ph�t!" )	
		AddNumText( sceneId, x899994_g_ScriptId, "#cf30768Thu ���c [Ph�c h� h�ng long ch߷ng]", 5, 40 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 40 then

	petcount = LuaFnGetPetCount(sceneId, selfId) --ȡ �i�m��������
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --ȡ �i�m���ޱ��
		if petdataid==427 then
			nThisFound = 1
			break
		end
	end

	if nThisFound == 1 then
	       	local nStoneId0 = 30503026
		       c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
                          if c0 >=88 then
			         LuaFnDelAvailableItem(sceneId,selfId,30503026,88)--ɾ����Ʒ
		--����Ҷ���,���
		local nBagIndex = TryRecieveItem( sceneId, selfId, 30402289, 1 )
		
		BeginEvent(sceneId)
			strText = "бi th�nh c�ng!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		
		local message;	
		local randMessage = random(2);
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		else
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
                          else
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G��ng t�y t�y ti�n li�n �n l�a d�i ta! Ng߽i tr�n ng߶i c�n b�n kh�ng c� s� h� v�t ph�m" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
       	            end
	else
		x899994_NotifyFailTips(sceneId, selfId, "Ng߽i kh�ng c� t�o �a s�ng v�t, Ph�c h� h�ng long ch߷ng ch� c� k� n�ng t�o �a, th�nh ��t ���c t�o �a s�ng v�t sau l�i �n �i!")
	end


          elseif GetNumText() == 30 then

	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		BeginEvent(sceneId)
		AddText(sceneId,"  Tr�ng th�i c��i th�, kh�ng th� ti�n nh�p, c�m �n!");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end
	if LuaFnHasTeam( sceneId, selfId ) > 0 then
		BeginEvent( sceneId )
		AddText( sceneId, "Ch�ng ta t�n k�nh ngo�n gia, b�n � nhi�u nh�t m�t ng߶i �i v�o. Hu� b� t� �i �i!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return 
	end
     CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 540, 98,79,10 )--����
    end
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x899994_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x899994_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--��Ϣ��ʾ
--**********************************
function x899994_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�Ի���ʾ
--**********************************
function x899994_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end
