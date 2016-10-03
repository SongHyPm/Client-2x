--����NPC
--����
--��ͨ

--�ű���
x892004_g_ScriptId = 892004

--��ӵ�е��¼�ID�б�
x892004_g_eventList={}

x892004_g_DarkSkillName = { [40] = {name = "N�m �m kh�", id = 274, needmoney = 20000},
                            [70] = {name = "�m kh� �� huy�t", id = 275, needmoney = 100000},
                            [90] = {name = "�m kh� h� th�", id = 276, needmoney = 500000},
                          }                
x892004_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x892004_g_DarkBreachPointNeedMoney = 
{
	[39] = 40000,
	[49] = 50000,
	[59] = 60000,
	[69] = 70000,
	[79] = 80000,
	[89] = 90000,
	[99] = 100000,
	[109] = 110000,
	[119] = 120000,
	[129] = 130000,
}  --ͻ��ƿ����Ҫ��Ǯ

--**********************************
--�¼��б�
--**********************************
function x892004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Ch�ng ta Long Th� tam huynh � �em su�t �i tinh l�c �u �t � Long V�n nghi�n c�u......#rMu�n bi�t? B� m�t...... B� m�t......")
		for i, eventId in x892004_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x892004_g_ScriptId,"H�p th�nh C�u Thi�n Th�i",6,7)
		AddNumText(sceneId,x892004_g_ScriptId,"#gFF0FA0Long v�n m� r�ng thu�c t�nh h�c t�p",6,8)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x892004_OnDefaultEvent( sceneId, selfId,targetId )
	x892004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x892004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	local NumText = GetNumText();
	if NumText == 6 then  --ȡ����
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	elseif NumText == 7 then  --����Long V�n c�p �ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"M�i 2 c�i ��ng c�p t߽ng �߽ng C�u Thi�n Th�i c� th� h�p th�nh m�t c�i cao c�p C�u Thi�n Th�i.#r C�u Thi�n Th�i c� th� t�m ta huynh � cho ng߽i Long V�n ti�n h�nh th�ng c�p.")

			AddNumText(sceneId,x892004_g_ScriptId,"H�p th�nh trung c�p C�u Thi�n Th�i",6,12)
			AddNumText(sceneId,x892004_g_ScriptId,"H�p th�nh cao c�p C�u Thi�n Th�i",6,13)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l�i",8,130)
	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --������
		BeginEvent(sceneId)
			AddText(sceneId,"S� d�ng #GCh� Long Th�ch #Wc� th� l�m Long V�n h�c t�p m�t lo�i c�m tinh. C�m tinh Long V�n c� ���c kh� m� r�ng thu�c t�nh, c� th� t�ng l�n Long V�n c�p b�c. C� th� gi�i thi�u ng߽i c� th� t�m ta. #GLong V�n h�c t�p m�t lo�i c�m tinh th� kh�ng th� �i �i c�m tinh.#r#c00ffff(Thao t�c n�y c�n �em Long V�n �� ���c kh�m b�o th�ch th�o xu�ng, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddText(sceneId,"#cfff263M� r�ng thu�c t�nh M�u gi�i h�n tr�n c�n: #cFF0000Ch� Long Th�ch - Nguy�n")
			AddText(sceneId,"#cfff263M� r�ng thu�c t�nh Gi�m Kh�ng c�n: #cFF0000Chu� Long Th�ch - B�o")
			AddText(sceneId,"#cfff263M� r�ng thu�c t�nh C�ng k�ch c�n: #cFF0000Ch� Long Th�ch - Th߽ng")
			AddText(sceneId,"Long v�n m� r�ng thu�c t�nh h�c t�p #Yph�i theo th� t� ti�n h�nh#W, �u ti�n h�c t�p M�u th��ng h�n, sau �� h�c t�p gi�m kh�ng, cu�i c�ng h�c t�p thu�c t�nh c�ng k�ch.")

			AddNumText(sceneId,x892004_g_ScriptId,"M� r�ng thu�c t�nh M�u gi�i h�n tr�n",6,16)
			AddNumText(sceneId,x892004_g_ScriptId,"M� r�ng thu�c t�nh Gi�m Kh�ng",6,17)
			AddNumText(sceneId,x892004_g_ScriptId,"M� r�ng thu�c t�nh C�ng k�ch",6,18)
			--AddNumText(sceneId,x892004_g_ScriptId,"H�c t�p #ccc33cc �c c�m tinh",6,19)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 9 then   --Long V�n c�p ��չ����
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_31}")
			AddNumText(sceneId,x892004_g_ScriptId,"M� r�ng thu�c t�nh Long V�n (C�p 0)",6,19)
			AddNumText(sceneId,x892004_g_ScriptId,"M� r�ng thu�c t�nh Long V�n (C�p 1)",6,20)
			AddNumText(sceneId,x892004_g_ScriptId,"M� r�ng thu�c t�nh Long V�n (C�p 2)",6,21)
			AddNumText(sceneId,x892004_g_ScriptId,"M� r�ng thu�c t�nh Long V�n (C�p 3)",6,22)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 10 then  --��ϴ��������
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 6 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)

	elseif NumText == 11 then  --���ð���
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_84}")
			AddNumText(sceneId,x892004_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892004_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l�i",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --���� �� �ȼ�
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,20310177,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 20310178, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, trung c�p C�u Thi�n Th�i h�p th�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 13 then                   --���� �� �ȼ�
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,20310178,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 20310179, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, cao c�p C�u Thi�n Th�i h�p th�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
		
	elseif NumText == 130 then
		x892004_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910014,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910015, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, C�u Thi�n Th�i h�p th�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 15 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910015,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910016, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, C�u Thi�n Th�i h�p th�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 16 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157001)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310181)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157001,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310181,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157002, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#H h�c xong m�t lo�i thu�c t�nh k� n�ng#H! Th��ng c� th�n kh� l�m h�ng thi�n th�i c� c�nh, xem ra nh�n gian v�a mu�n ngh�nh ��n m�t h�i huy�t v� tinh phong!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#YCh�c m�ng ng߽i, long v�n huy�t th��ng h�n thu�c t�nh h�c t�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u nguy�n li�u. Long v�n thu�c t�nh ph�i theo th� t� h�c t�p!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 17 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157002)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310182)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157002,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310182,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157003, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#H h�c xong m�t lo�i thu�c t�nh k� n�ng#H! Th��ng c� th�n kh� l�m h�ng thi�n th�i c� c�nh, xem ra nh�n gian v�a mu�n ngh�nh ��n m�t h�i huy�t v� tinh phong!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#YCh�c m�ng ng߽i, long v�n gi�m kh�ng h�n cu�i thu�c t�nh h�c t�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u nguy�n li�u. Long v�n thu�c t�nh ph�i theo th� t� h�c t�p!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 18 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157003)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310183)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157003,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,20310183,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157004, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#H h�c xong m�t lo�i thu�c t�nh k� n�ng#H! Th��ng c� th�n kh� l�m h�ng thi�n th�i c� c�nh, xem ra nh�n gian v�a mu�n ngh�nh ��n m�t h�i huy�t v� tinh phong!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n thu�c t�nh c�ng k�ch h�c t�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u nguy�n li�u. Long v�n thu�c t�nh ph�i theo th� t� h�c t�p!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 19 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156101)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910011)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156101,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910011,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156105, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, long v�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u nguy�n li�u!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 20 then
		BeginEvent(sceneId)

			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng!")
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 1 (B�ng c�m tinh) m� r�ng thu�c t�nh",6,51)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 1 (H�a c�m tinh) m� r�ng thu�c t�nh",6,52)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 1 (Huy�n c�m tinh) m� r�ng thu�c t�nh",6,53)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 1 (еc c�m tinh) m� r�ng thu�c t�nh",6,54)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent(sceneId)

			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng!")
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 2 (B�ng c�m tinh) m� r�ng thu�c t�nh",6,55)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 2 (H�a c�m tinh) m� r�ng thu�c t�nh",6,56)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 2 (Huy�n c�m tinh) m� r�ng thu�c t�nh",6,57)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 2 (еc c�m tinh) m� r�ng thu�c t�nh",6,58)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent(sceneId)

			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng!")
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 3 (B�ng c�m tinh) m� r�ng thu�c t�nh",6,59)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 3 (H�a c�m tinh) m� r�ng thu�c t�nh",6,60)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 3 (Huy�n c�m tinh) m� r�ng thu�c t�nh",6,61)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V�n c�p 3 (еc c�m tinh) m� r�ng thu�c t�nh",6,62)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l�i",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 23 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 3 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 24 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 4 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 25 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 5 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 26 then
	 	BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 7 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 27 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 8 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 28 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_69}")
			AddNumText(sceneId,x892004_g_ScriptId,"#{FBSJ_090304_02}",11,29)
			AddNumText(sceneId,x892004_g_ScriptId,"#{FBSJ_090304_01}",11,30)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 29 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_090304_03}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 30 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_090304_04}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 31 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 9 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x892004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892004_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x892004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x892004_g_eventList do
		if missionScriptId == findId then
			x892004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x892004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x892004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x892004_OnDie( sceneId, selfId, killerId )
end




--**********************************
--�ж��Ƿ��ܹ�ѧϰ
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892004_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
	if (nSkillIndex ~= 40 and nSkillIndex ~= 70 and nSkillIndex ~= 90) then
		return 0;
	end
	
	--�ж���ҵȼ��Ƿ���
	local strNotice = "";
	local nLevel = GetLevel(sceneId, selfId);
	if ( nLevel < nSkillIndex) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_24}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_27}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_29}";
		end
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892004_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892004_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--�����NPCѧϰ����ʹ�ü���
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892004_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
	if (nSkillIndex ~= 40 and nSkillIndex ~= 70 and nSkillIndex ~= 90) then
		return
	end
	
	--�ж���ҵȼ��Ƿ���
	local strNotice = "";
	local nLevel = GetLevel(sceneId, selfId);
	if ( nLevel < nSkillIndex) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_24}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_27}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_29}";
		end
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892004_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892004_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--�����ж϶�ͨ�������Կ�Ǯ��������
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892004_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892004_g_DarkSkillName[nSkillIndex].id)
	x892004_ShowNotice(sceneId, selfId, targetId, x892004_g_DarkSkillTips[nSkillIndex]);
	x892004_NotifyTips( sceneId, selfId, x892004_g_DarkSkillTips[nSkillIndex] )
	
	x892004_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --�ü��ܰ�ť��˸
	
end


--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x892004_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--����Ƿ����㰵��ƿ������
--����ֵ��0����1��1Ϊ���㣬0
--**********************************
function x892004_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--�ж���������Ƿ�װ���а���
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж�������ϰ����Ƿ�ﵽƿ��
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���������Ƿ����㹻��Ǯ
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892004_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --�Է���һ����ûʲô��
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10��
			strNotice = "#{FBSJ_081209_25}";
			x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892004_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--�ж���������Ƿ�װ���а���
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж�������ϰ����Ƿ�ﵽƿ��
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--�ж���������Ƿ����㹻��Ǯ
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892004_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --�Է���һ����ûʲô��
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�����ж϶�ͨ�������Կ�Ǯͻ����
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--ͻ��ƿ�����ð�������
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892004_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--ͻ�Ƴɹ�����¼ͳ����־
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892004_ShowNotice(sceneId, selfId, targetId, "еt ph� th�t b�i");
	end
	
	return
end

function x892004_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892004_StudySkillImpact(sceneId, playerId)
	--��ʾѧϰ���¼��ܵ���Ч Ŀǰʹ��������Ч
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end

