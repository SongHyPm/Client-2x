--����NPC
--����
--��ͨ

--�ű���
x892003_g_ScriptId = 892003

--��ӵ�е��¼�ID�б�
x892003_g_eventList={}

x892003_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#H Tr�i qua m�t phen c� g�ng, r�t c�c thu th�p ���c v�t ph�m nhu�m m�u trang ph�c th�i trang. #YY Thi�n Th�i #W�c ��a t�ng m�t c�i #{_INFOMSG%s}!", 
  "#{_INFOUSR%s} #cff99ccV� #YY Thi�n Th�i #cff99ccl�m cho nhu�m m�u #YTrang ph�c th�i trang#cff99cc, linh h�n trang b� s� gi� d�ng l�n #{_INFOMSG%s} l�m c�m t�!", 
  "#{_INFOUSR%s}#H � #YY Thi�n Th�i #Wti�n h�nh #RNhu�m m�u trang ph�c th�i trang #Ith�ng c�p trung, m�t �߶ng qu� quan tr�m t߾ng, kh�ng h� l� c�ng phu kh�ng ph� l�ng ng߶i, �c t�ng c�ng #{_INFOMSG%s}!",
  "#{_INFOUSR%s}#H Tr�i qua kh�ng ng�ng c� g�ng thu th�p #RThu�c nhu�m trang ph�c th�i trang #Is� h�u v�t ph�m, ��t ���c #W#{_INFOMSG%s}#H, th�t s� l� l�m ng߶i ta h�m m�!", 
}

-----ȾɫʱװID
x892003_XUEYU = { 10553167, 10553168, 10553169, 10553170,10553171, 10553172, 10553173, 10553174, }
x892003_XIANLV = { 10553176, 10553177, 10553178, 10553179, 10553180, 10553181, 10553182, 10553183, }
x892003_ANDAN = { 10553185, 10553186, 10553187, 10553188, 10553189, 10553190, 10553191, 10553192, }
x892003_SHUKUANG = { 10553194, 10553195, 10553196, 10553197, 10553198, 10553199, 10553200, 10553201, }
x892003_CHUNFENG = { 10553203, 10553204, 10553205, 10553206, 10553207, 10553208, 10553209, 10553210, }
x892003_QINGFENG = { 10553212, 10553213, 10553214, 10553215, 10553216, 10553217, 10553218, 10553219, }


--**********************************
--�¼��б�
--**********************************
function x892003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ch�n gh�t trang ph�c c� �n �i�u s�c th�i? Ch�n gh�t ch�nh l� trang ph�c �m ��m quang mang? Mu�n theo �u�i ch�nh m�nh m�i m� c�m c�ng c� t�nh, ta c� th� gi�p ng߽i gi�c m�ng tr� th�nh s� th�t.")
		AddText(sceneId,"Trang ph�c th�i trang nhu�m m�u c� th� cho ng߽i thay �i s�c th�i trang ph�c th�i trang, m�c ra mu�n t�a ngh�n h�ng.")
		AddText(sceneId,"H�u t�nh n�u l�n: Th�nh �em nhu�m m�u trang ph�c th�i �t � tay n�i.")

		for i, eventId in x892003_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText(sceneId,x892003_g_ScriptId,"Test",6,6)
		AddNumText(sceneId,x892003_g_ScriptId,"Nhu�m m�u",6,7)
		AddNumText(sceneId,x892003_g_ScriptId,"Gi�i thi�u nhu�m m�u",6,8)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x892003_OnDefaultEvent( sceneId, selfId,targetId )
	x892003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x892003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892003_g_eventList do
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
	elseif NumText == 7 then  --�������ȼ�
		BeginEvent(sceneId)
			AddText(sceneId,"M�i lo�i trang ph�c th�i trang �u c� #Gnhi�u lo�i ki�u d�ng phong c�ch kh�c nhau#W, c�n ti�u hao m�t c�i #cFF0000H�ng Di�u Th�ch #W� nhu�m m�u m�t l�n. Sau khi nhu�m m�u t�y c� ��t ���c m�t lo�i ki�u d�ng phong c�ch trang ph�c th�i trang.")
			AddText(sceneId,"Sau khi nhu�m m�u trang ph�c th�i trang v� ngo�i c�ng thu�c t�nh ���c t�ng l�n, nh�ng trang ph�c th�i trang ���c kh�m b�o th�ch, t� ch�t, c߶ng h�a c�p b�c s� b� m�t, c�n th�o xu�ng b�o th�ch ���c kh�m.")

			AddNumText(sceneId,x892003_g_ScriptId,"Nhu�m m�u Tuy�t v� s߽ng y",6,12)
			AddNumText(sceneId,x892003_g_ScriptId,"Nhu�m m�u Ti�n l� t�nh duy�n",6,13)
			AddNumText(sceneId,x892003_g_ScriptId,"Nhu�m m�u �m ��m �i�u linh",6,14)
			AddNumText(sceneId,x892003_g_ScriptId,"Nhu�m m�u S� Cu�ng �m H߽ng",6,15)
			AddNumText(sceneId,x892003_g_ScriptId,"Nhu�m m�u Xu�n phong d� tuy�t",6,16)
			AddNumText(sceneId,x892003_g_ScriptId,"Nhu�m m�u Thanh phong di giang",6,17)

			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,130)
	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --������
		BeginEvent(sceneId)
			AddText(sceneId,"#YB�t �ng  s�c th�i ch߽ng hi�n ng߽i �c ��o  m�i th߷ng th�c, hoa m� s�c th�i cho ng߽i v� h�n  th� gi�c h߷ng th�!")
			AddText(sceneId,"Trang ph�c th�i trang nhu�m m�u s� d�ng H�ng Di�u Th�ch c� th� bi�n h�a nhan s�c, m�i l�n nhu�m m�u �u t�y c� nhu�m m�u th�nh m�t kho�n h�nh th�c, c�n kh� n�ng th�t b�i. Sau khi th�t b�i trang ph�c m�t c�ng h�ng di�u th�ch �u bi�n m�t.")
			AddText(sceneId,"C�n kh�ng bi�t trang ph�c th�i trang c� th� nhu�m m�u sao? Xem ra ch�nh m�nh trang ph�c th�i trang ph�a d߾i bi�u hi�n thuy�t minh l� c� th� bi�t, c� th� nhu�m m�u trang ph�c th�i trang ph�a d߾i c� ch� d�n.")

		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 9 then   --�����չ����
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_31}")
			AddNumText(sceneId,x892003_g_ScriptId,"��ȡ ��꣨0���� ��չ����",6,19)
			AddNumText(sceneId,x892003_g_ScriptId,"��ȡ ��꣨1���� ��չ����",6,20)
			AddNumText(sceneId,x892003_g_ScriptId,"��ȡ ��꣨2���� ��չ����",6,21)
			AddNumText(sceneId,x892003_g_ScriptId,"��ȡ ��꣨3���� ��չ����",6,22)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,130)
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
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --Tuy�t v� s߽ng y
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124069)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124069,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--ɾ����Ʒ
			              local GemListSize = getn(x892003_XUEYU)
			              local RandomGem = x892003_XUEYU[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--������Ʒ
			              --local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					--x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, trang ph�c nhu�m m�u th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u nguy�n li�u!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 13 then                   --Ti�n l� t�nh duy�n
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124072)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124072,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--ɾ����Ʒ
			              local GemListSize = getn(x892003_XIANLV)
			              local RandomGem = x892003_XIANLV[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--������Ʒ
			              local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, trang ph�c nhu�m m�u th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u nguy�n li�u!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
		
	elseif NumText == 130 then
		x892003_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then        ---�m ��m �i�u linh
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124100)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124100,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--ɾ����Ʒ
			              local GemListSize = getn(x892003_ANDAN)
			              local RandomGem = x892003_ANDAN[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--������Ʒ
			              local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, trang ph�c nhu�m m�u th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u nguy�n li�u!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 15 then       ----�����
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124133)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124133,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--ɾ����Ʒ
			              local GemListSize = getn(x892003_SHUXIANG)
			              local RandomGem = x892003_SHUXIANG[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--������Ʒ
			              local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, trang ph�c nhu�m m�u th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u nguy�n li�u!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 16 then         ----������ѩ
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124140)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124140,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--ɾ����Ʒ
			              local GemListSize = getn(x892003_CHUNFENG)
			              local RandomGem = x892003_CHUNFENG[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--������Ʒ
			              local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, trang ph�c nhu�m m�u th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u nguy�n li�u!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 17 then         ----�������
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124103)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124103,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--ɾ����Ʒ
			              local GemListSize = getn(x892003_QINGFENG)
			              local RandomGem = x892003_QINGFENG[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--������Ʒ
			              local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, trang ph�c nhu�m m�u th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u nguy�n li�u!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 18 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156101)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910011)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156101,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910011,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156104, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#G��ϲ�㣬��������ɹ���"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#G���������������� ������൤ �Ƿ���ȫ��Ҫ�������Ӧ���ڰ����ڲſ���ע������Ŷ����"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
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
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#G��ϲ�㣬��������ɹ���"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#G���������������� ������൤ �Ƿ���ȫ��Ҫ�������Ӧ���ڰ����ڲſ���ע������Ŷ����"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 20 then
		BeginEvent( sceneId ) 
			AddText(sceneId,"��ѡ��Ҫ��ȡ����չ���ԣ�Ҫ��Ӧ��ͬ���������Ŷ��")
			AddNumText(sceneId,x892003_g_ScriptId,"���1���������ࣩ��չ����",6,51)
			AddNumText(sceneId,x892003_g_ScriptId,"���1���������ࣩ��չ����",6,52)
			AddNumText(sceneId,x892003_g_ScriptId,"���1���������ࣩ��չ����",6,53)
			AddNumText(sceneId,x892003_g_ScriptId,"���1���������ࣩ��չ����",6,54)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent( sceneId ) 
			AddText(sceneId,"��ѡ��Ҫ��ȡ����չ���ԣ�Ҫ��Ӧ��ͬ���������Ŷ��")
			AddNumText(sceneId,x892003_g_ScriptId,"���2���������ࣩ��չ����",6,55)
			AddNumText(sceneId,x892003_g_ScriptId,"���2���������ࣩ��չ����",6,56)
			AddNumText(sceneId,x892003_g_ScriptId,"���2���������ࣩ��չ����",6,57)
			AddNumText(sceneId,x892003_g_ScriptId,"���2���������ࣩ��չ����",6,58)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent( sceneId ) 
			AddText(sceneId,"��ѡ��Ҫ��ȡ����չ���ԣ�Ҫ��Ӧ��ͬ���������Ŷ��")
			AddNumText(sceneId,x892003_g_ScriptId,"���3���������ࣩ��չ����",6,59)
			AddNumText(sceneId,x892003_g_ScriptId,"���3���������ࣩ��չ����",6,60)
			AddNumText(sceneId,x892003_g_ScriptId,"���3���������ࣩ��չ����",6,61)
			AddNumText(sceneId,x892003_g_ScriptId,"���3���������ࣩ��չ����",6,62)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,130)
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
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_090304_02}",11,29)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_090304_01}",11,30)
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
function x892003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892003_g_eventList do
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
function x892003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x892003_g_eventList do
		if missionScriptId == findId then
			x892003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x892003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x892003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x892003_OnDie( sceneId, selfId, killerId )
end




--**********************************
--�ж��Ƿ��ܹ�ѧϰ
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892003_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892003_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892003_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--�����NPCѧϰ����ʹ�ü���
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892003_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892003_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892003_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--�����ж϶�ͨ�������Կ�Ǯ��������
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892003_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892003_g_DarkSkillName[nSkillIndex].id)
	x892003_ShowNotice(sceneId, selfId, targetId, x892003_g_DarkSkillTips[nSkillIndex]);
	x892003_NotifyTips( sceneId, selfId, x892003_g_DarkSkillTips[nSkillIndex] )
	
	x892003_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --�ü��ܰ�ť��˸
	
end


--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x892003_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--����Ƿ����㰵��ƿ������
--����ֵ��0����1��1Ϊ���㣬0
--**********************************
function x892003_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--�ж���������Ƿ�װ���а���
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж�������ϰ����Ƿ�ﵽƿ��
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���������Ƿ����㹻��Ǯ
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892003_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --�Է���һ����ûʲô��
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10��
			strNotice = "#{FBSJ_081209_25}";
			x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892003_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--�ж���������Ƿ�װ���а���
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж�������ϰ����Ƿ�ﵽƿ��
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--�ж���������Ƿ����㹻��Ǯ
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892003_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --�Է���һ����ûʲô��
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�����ж϶�ͨ�������Կ�Ǯͻ����
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--ͻ��ƿ�����ð�������
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892003_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--ͻ�Ƴɹ�����¼ͳ����־
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892003_ShowNotice(sceneId, selfId, targetId, "еt ph� th�t b�i");
	end
	
	return
end

function x892003_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892003_StudySkillImpact(sceneId, playerId)
	--��ʾѧϰ���¼��ܵ���Ч Ŀǰʹ��������Ч
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end

function x892003_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 4 )
	local str
	if nMsgIndex == 1 then
		str = format( x210531_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x210531_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	elseif nMsgIndex == 3 then
		str = format( x210531_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	else
		str = format( x210531_g_strGongGaoInfo[4], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end