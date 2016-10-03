--����NPC
--����
--��ͨ

--�ű���
x892001_g_ScriptId = 892001

--��ӵ�е��¼�ID�б�
x892001_g_eventList={}


x892001_g_DarkSkillName = { [40] = {name = "N�m �m kh�", id = 274, needmoney = 20000},
                            [70] = {name = "�m kh� �� huy�t", id = 275, needmoney = 100000},
                            [90] = {name = "�m kh� h� th�", id = 276, needmoney = 500000},
                          }                
x892001_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x892001_g_DarkBreachPointNeedMoney = 
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

x892001_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#HTr�i qua m�t phen c� g�ng, r�t c�c ho�n th�nh thu th�p h�p th�nh V� H�n. #YV� аng #W��a t�ng m�t c�i #{_INFOMSG%s} c�p 1!", 
  "#{_INFOUSR%s} #cff99ccV� #YV� аng #cff99ccl�m cho �u #YLinh H�n trang b� tinh hoa#cff99cc, linh h�n trang b� s� gi� d�ng l�n #{_INFOMSG%s} l�m c�m t�!", 
  "#{_INFOUSR%s}#H� #YV� аng ti�n h�nh #RV� H�n #Ith�ng c�p, m�t �߶ng qu� quan tr�m t߾ng, kh�ng h� l� c�ng phu kh�ng ph� l�ng ng߶i, �c t�ng c�ng #{_INFOMSG%s}!",
  "#{_INFOUSR%s}#HKh�ng ng�ng c� g�ng thu th�p #RV� H�n trang b� th�ng c�p #Iv�t ph�m, ��t ���c #W#{_INFOMSG%s}#H, th�t s� l� l�m ng߶i ta h�m m�!", 
}

--**********************************
--�¼��б�
--**********************************
function x892001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{WH_NPC_17}")
		for i, eventId in x892001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x892001_g_ScriptId,"H�p th�nh H�n B�ng Ch�u",6,7)
		AddNumText(sceneId,x892001_g_ScriptId,"C�m tinh V� H�n",6,8)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x892001_OnDefaultEvent( sceneId, selfId,targetId )
	x892001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x892001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892001_g_eventList do
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
			AddText(sceneId,"C� 5 H�n B�ng Ch�u c�ng ��ng c�p c� th� h�p th�nh m�t c�i H�n B�ng Ch�u c�p cao h�n.#r H�n B�ng Ch�u c� th� t�m s� ph� Ti�u Dao T� cho ng߽i ti�n h�nh th�ng c�p V� H�n c�m tinh.")

			AddNumText(sceneId,x892001_g_ScriptId,"H�p th�nh H�n B�ng Ch�u c�p 2",6,12)
			AddNumText(sceneId,x892001_g_ScriptId,"H�p th�nh H�n B�ng Ch�u c�p 3",6,13)
			AddNumText(sceneId,x892001_g_ScriptId,"H�p th�nh H�n B�ng Ch�u c�p 4",6,14)
			AddNumText(sceneId,x892001_g_ScriptId,"H�p th�nh H�n B�ng Ch�u c�p 5",6,15)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --������
		BeginEvent(sceneId)
			AddText(sceneId,"S� d�ng #GV� H�n D�ch T߽ng �an #Wc� th� c�m tinh V� H�n. C�m tinh v� h�n c� ���c kh� n�ng m� r�ng thu�c t�nh, c� th� h�c t�p k� n�ng v� h�n, c� th� t�ng l�n v� h�n c�p b�c. C� th� gi�i thi�u ng߽i c� th� t�m s� ph� Ti�u Dao T�.#r #GV� h�n c�m tinh xong kh�ng th� �i �i c�m tinh.#r#c00ffff(Thao t�c n�y c�n th�o g� b�o th�ch ra, n�u kh�ng b�o th�ch s� bi�n m�t)")
			AddNumText(sceneId,x892001_g_ScriptId,"C�m tinh h� #GB�ng",6,16)
			AddNumText(sceneId,x892001_g_ScriptId,"C�m tinh h� #cFF0000H�a",6,17)
			AddNumText(sceneId,x892001_g_ScriptId,"C�m tinh h� #YHuy�n",6,18)
			AddNumText(sceneId,x892001_g_ScriptId,"C�m tinh h� #ccc33ccеc",6,19)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 9 then   --�����չ����
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_31}")
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� H�n (C�p 0)",6,19)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� H�n (C�p 1)",6,20)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� H�n (C�p 2)",6,21)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� H�n (C�p 3)",6,22)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
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
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --���� �� �ȼ�
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910012)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910012,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910013, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, h�n b�ng ch�u h�p th�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
				x892001_ShowNotice(sceneId, selfId, targetId, strText);
             else
		     strNotice = "#GThi�u Nguy�n li�u"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 13 then                   --���� �� �ȼ�
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910013)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910013,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910014, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, h�n b�ng ch�u h�p th�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
				x892001_ShowNotice(sceneId, selfId, targetId, strText);
             else
		     strNotice = "#GThi�u Nguy�n li�u"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
		
	elseif NumText == 130 then
		x892001_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910014,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910015, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, h�n b�ng ch�u h�p th�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
				x892001_ShowNotice(sceneId, selfId, targetId, strText);
             else
		     strNotice = "#GThi�u Nguy�n li�u"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 15 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910015,5)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910016, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, h�n b�ng ch�u h�p th�nh th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
				x892001_ShowNotice(sceneId, selfId, targetId, strText);
             else
		     strNotice = "#GThi�u Nguy�n li�u"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 16 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156101)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910011)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156101,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910011,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156102, 1)--������Ʒ
				    local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		            LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
				x892001_ShowNotice(sceneId, selfId, targetId, strText);
             else
		     strNotice = "#GThi�u Nguy�n li�u"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 17 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156101)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910011)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156101,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,39910011,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156103, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
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
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
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
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh�c m�ng ng߽i, v� h�n th�ng c�p th�nh c�ng!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi�u Nguy�n li�u"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 20 then
		BeginEvent(sceneId)

			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng, s� �i �ng gi�ng nhau V� H�n thu�c t�nh!")
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 1 (B�ng c�m tinh)",6,51)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 1 (H�a c�m tinh)",6,52)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 1 (Huy�n c�m tinh)",6,53)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 1 (еc c�m tinh)",6,54)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent(sceneId)

			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng, s� �i �ng gi�ng nhau V� H�n thu�c t�nh!")
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 2 (B�ng c�m tinh)",6,55)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 2 (H�a c�m tinh)",6,56)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 2 (Huy�n c�m tinh)",6,57)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 2 (еc c�m tinh)",6,58)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent(sceneId)

			AddText(sceneId,"M�i l�a ch�n thu�c t�nh m� r�ng, s� �i �ng gi�ng nhau V� H�n thu�c t�nh!")
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 3 (B�ng c�m tinh)",6,59)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 3 (H�a c�m tinh)",6,60)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 3 (Huy�n c�m tinh)",6,61)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r�ng thu�c t�nh V� h�n c�p 3 (еc c�m tinh)",6,62)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
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
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_090304_02}",11,29)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_090304_01}",11,30)
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
function x892001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892001_g_eventList do
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
function x892001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x892001_g_eventList do
		if missionScriptId == findId then
			x892001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x892001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x892001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x892001_OnDie( sceneId, selfId, killerId )
end




--**********************************
--�ж��Ƿ��ܹ�ѧϰ
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892001_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892001_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892001_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--�����NPCѧϰ����ʹ�ü���
--nSkillIndex��������ֵΪ��40��70��90���ֱ�ѧϰ��Ӧ����ļ���
--**********************************
function x892001_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж��Ƿ��Ѿ�ѧ���˶�Ӧ����
	if  (HaveSkill(sceneId, selfId, x892001_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�ж���������Ƿ����㹻��Ǯ
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892001_g_DarkSkillName[nSkillIndex].needmoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--�����ж϶�ͨ�������Կ�Ǯ��������
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892001_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892001_g_DarkSkillName[nSkillIndex].id)
	x892001_ShowNotice(sceneId, selfId, targetId, x892001_g_DarkSkillTips[nSkillIndex]);
	x892001_NotifyTips( sceneId, selfId, x892001_g_DarkSkillTips[nSkillIndex] )
	
	x892001_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --�ü��ܰ�ť��˸
	
end


--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x892001_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--����Ƿ����㰵��ƿ������
--����ֵ��0����1��1Ϊ���㣬0
--**********************************
function x892001_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--�ж���������Ƿ�װ���а���
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж�������ϰ����Ƿ�ﵽƿ��
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--�ж���������Ƿ����㹻��Ǯ
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892001_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --�Է���һ����ûʲô��
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10��
			strNotice = "#{FBSJ_081209_25}";
			x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892001_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--�ж���������Ƿ�װ���а���
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж�������ϰ����Ƿ�ﵽƿ��
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--�ж���ҵȼ��Ƿ�Ͱ����ȼ���Ȼ���û�а����ȼ���
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--�ж���������Ƿ����㹻��Ǯ
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892001_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --�Է���һ����ûʲô��
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10��
		strNotice = "#{FBSJ_081209_25}";
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--�����ж϶�ͨ�������Կ�Ǯͻ����
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--ͻ��ƿ�����ð�������
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892001_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--ͻ�Ƴɹ�����¼ͳ����־
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892001_ShowNotice(sceneId, selfId, targetId, "еt ph� th�t b�i");
	end
	
	return
end

function x892001_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892001_StudySkillImpact(sceneId, playerId)
	--��ʾѧϰ���¼��ܵ���Ч Ŀǰʹ��������Ч
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end

function x892001_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
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
