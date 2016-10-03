-- �m�t ���������

-- �ű���
x050017_g_ScriptId = 050017

x050017_g_eventId_cancel = 0;		-- Hu� b�
x050017_g_eventId_redeem = 1;		-- �m�t �
x050017_g_eventId_redeem_5 = 2;		-- �m�t �5c�p
x050017_g_eventId_redeem_45 = 3;	-- �m�t �45c�p
x050017_g_eventId_redeem_55 = 4;	-- �m�t �55c�p
x050017_g_eventId_redeem_65 = 5;	-- �m�t �65c�p
x050017_g_eventId_about = 10;		-- ����

--�m�t ��б�
x050017_g_redeemList = {};
 x050017_g_redeemList[x050017_g_eventId_redeem_5] = {count=10, level=5, item=30505126, petName="Th� ng�c"}
x050017_g_redeemList[x050017_g_eventId_redeem_45] = {count=45, level=45, item=30505127, petName="H�o Nguy�t Ng�c Th�"}
x050017_g_redeemList[x050017_g_eventId_redeem_55] = {count=55, level=55, item=30505128, petName="Thi�m Cung Ng�c Th�"}
x050017_g_redeemList[x050017_g_eventId_redeem_65] = {count=65, level=65, item=30505129, petName="H�ng Nga Ng�c Th�"}

--�������
x050017_g_redeemItemId = 30505125;

--�ʱ��
x050017_g_StartDayTime = 8257   --���ʼʱ�� 2008-9-14,��������
x050017_g_EndDayTime = 8304   --�����ʱ�� 2008-10-31,��������

--**********************************
--�о��¼�
--**********************************
function x050017_OnEnumerate( sceneId, selfId, targetId )
	local check = x050017_IsMidAutumnPeriod(sceneId, selfId);
	if not check or check ~= 1 then
		return
	end
	AddNumText(sceneId, x050017_g_ScriptId, "Ta mu�n �i Ng�c Th�", 6, x050017_g_eventId_redeem);
	--AddNumText(sceneId, x050017_g_ScriptId, "���ڶm�t ���������", 11, x050017_g_eventId_about);
end

--**********************************
--������ں���
--**********************************
function x050017_OnDefaultEvent( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	local selEventId = GetNumText();
	if selEventId then
		if selEventId == x050017_g_eventId_redeem then
			BeginEvent(sceneId);
				AddText( sceneId, "#{YUTUXIAFAN_DB1}");
				AddNumText(sceneId, x050017_g_ScriptId, "бi Ng�c Th� ��ng c�p mang theo c�p 5", 6, x050017_g_eventId_redeem_5);
				AddNumText(sceneId, x050017_g_ScriptId, "бi H�o Nguy�t Ng�c Th� ��ng c�p mang theo c�p 45", 6, x050017_g_eventId_redeem_45);
				AddNumText(sceneId, x050017_g_ScriptId, "бi Thi�m Cung Ng�c Th� ��ng c�p mang theo c�p 55", 6, x050017_g_eventId_redeem_55);
				AddNumText(sceneId, x050017_g_ScriptId, "бi H�ng Nga Ng�c Th� ��ng c�p mang theo c�p 65", 6, x050017_g_eventId_redeem_65);
				AddNumText(sceneId, x050017_g_ScriptId, "T�m th�i kh�ng �i Ng�c Th�", 6, x050017_g_eventId_cancel);
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
			return 1;
		elseif selEventId == x050017_g_eventId_redeem_5
			or selEventId == x050017_g_eventId_redeem_45
			or selEventId == x050017_g_eventId_redeem_55
			or selEventId == x050017_g_eventId_redeem_65 then
			local redeemItem = x050017_g_redeemList[selEventId];
			if not redeemItem then
				x050017_NotifyBox(sceneId, selfId, targetId, "Ch�a m� ��o c�, kh�ng th� �i!");
				return 0;
			end
			
			local redeemItemName = GetItemName(sceneId, x050017_g_redeemItemId);
			local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050017_g_redeemItemId);
			if not itemCount or itemCount < redeemItem.count then
				x050017_NotifyBox(sceneId, selfId, targetId, "бi"..GetItemName(sceneId, redeemItem.item).."C�n "..redeemItem.count.."C�i"..redeemItemName..", tr�n ng߶i c�c h�"..redeemItemName.."Kh�ng ��! Kh�ng th� �i!");
				return 0;
			end
			
			local addItemIndex;
			BeginAddItem(sceneId);
				addItemIndex = AddItem(sceneId, redeemItem.item, 1);
			local ret = EndAddItem(sceneId, selfId);
			if not ret or ret ~= 1 then
				x050017_NotifyBox(sceneId, selfId, targetId, "Xin l�i, c�t v�t ph�m c�a c�c h� �� kh�ng c�n ch� tr�ng ho�c c�c h� �ang trong tr�ng th�i m�t m�i!");
				return 0;
			end
			
			local delRet = LuaFnDelAvailableItem(sceneId, selfId, x050017_g_redeemItemId, redeemItem.count);
			if not delRet or delRet ~= 1 then
				x050017_NotifyBox(sceneId, selfId, targetId, "Kh�ng th� kh�u tr� "..GetItemName(sceneId, redeemItem.item).."!");
				return 0;
			end
			
			AddItemListToHuman(sceneId, selfId);
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
			
			local itemTransfer;
			if addItemIndex and addItemIndex  > -1 then
				itemTransfer = GetItemTransfer(sceneId, selfId, addItemIndex);
			end
			
			if itemTransfer then
				if selEventId == x050017_g_eventId_redeem_45 then
					msg = "#Y Nh�c Th߶ng Vi�n: #cff99ccc�c v� quan kh�ch, #W#{_INFOUSR"..GetName(sceneId, selfId).."}#l l� c� th� d�ng n� �i #{_INFOMSG"..itemTransfer.."}#cff99cc m�i ra #G H�o Nguy�t Ng�c Th�#cff99cc ��ng y�u c�a ch�ng ta, m�i ng߶i xin h�y ch� ��i nh�!";
				elseif selEventId == x050017_g_eventId_redeem_55 then
					msg = "#Y Nh�c Th߶ng Vi�n: #cff99ccN߽ng t�, mau ra ��y xem #W#{_INFOUSR"..GetName(sceneId, selfId).."}#l l�i d�ng#{_INFOMSG"..itemTransfer.."}tri�u g�i #G Thi�m Cung Ng�c Th�#cff99cc r�i!";
				elseif selEventId == x050017_g_eventId_redeem_65 then
					msg = "#Y Nh�c Th߶ng Vi�n: #cff99ccKh�ng l� l� Ng�c Th� trong t߽ng truy�n t�ng �ng vi�n kh�ng th�nh, #W#{_INFOUSR"..GetName(sceneId, selfId).."}#l c�ng �i #{_INFOMSG"..itemTransfer.."} tri�u g�i #G H�ng Nga Ng�c Th�#cff99cc n�o! ";
				else
					msg = "#Y Nh�c Th߶ng Vi�n: #cff99ccS�m s�t �i! Tr�i m�a �i! Ng�c Th� l�i h� ph�m r�i! #W#{_INFOUSR"..GetName(sceneId, selfId).."}#l ��t ���c c�i m� t߽ng truy�n r�ng #{_INFOMSG"..itemTransfer.."}, cu�i c�ng �� tri�u g�i ���c #GNg�c Th�#cff99cc r�i! ";
				end
				
				if msg then
					BroadMsgByChatPipe(sceneId, selfId, msg, 4);
				end
			end
			
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
			return 1;
		elseif selEventId == x050017_g_eventId_cancel then
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		elseif selEventId == x050017_g_eventId_about then
			BeginEvent(sceneId);
				AddText( sceneId, "#{YUTUXIAFAN_ABOUT}");
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
			return 1;
		end
	end
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x050017_NotifyBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--��Ŀ��Ϣ��ʾ
--**********************************
function x050017_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--���ng��M� ra 
--**********************************
function x050017_IsMidAutumnPeriod(sceneId, selfId)
	local curDay = GetDayTime();
	if not curDay then
		return 0;
	end

	if curDay < x050017_g_StartDayTime or curDay > x050017_g_EndDayTime then
		return 0;
	end

	return 1
end
