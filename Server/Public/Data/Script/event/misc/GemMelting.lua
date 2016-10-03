--��ʯ����

--�ű���
x800118_g_ScriptId	= 800118


function x800118_OnGemMelting( sceneId, selfId, GemItemPos1, GemItemPos2, GemItemPos3, NeedItemPos )

	if GemItemPos1 == -1 or GemItemPos2 == -1 or GemItemPos3 == -1 or NeedItemPos == -1 then
		return
	end

	--��ng��T�i ��ȫʱ����....C�i n�y �жϺ��������Լ�����ʾ��Ϣ....
	if IsPilferLockFlag(sceneId, selfId) <= 0 then
		return
	end
	
	-- ���������ظ�to� � bagIndexList���� added by dun.liu 2009.2.5
	if ScriptGlobal_IsUniqueNumberTable({GemItemPos1, GemItemPos2, GemItemPos3}) == 0 then
		return
	end

	local GemItemID1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemItemPos1 )
	local GemItemID2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemItemPos2 )
	local GemItemID3 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemItemPos3 )
	local NeedItemID = LuaFnGetItemTableIndexByIndex( sceneId, selfId, NeedItemPos )

	--�����ng����ng��ͬ��to� � ��ʯ....
	if GemItemID1 ~= GemItemID2 or GemItemID1 ~= GemItemID3 then
		x800118_NotifyTip( sceneId, selfId, "��ʯ���Ͳ�m�t ��,��ʯ����th�t b�i." )
		return
	end

	--�����ng���������....
	local ProductID, NeedID, NeedMoney = LuaFnGetGemMeltingInfo( GemItemID1 )
	if  -1 == ProductID then
		x800118_NotifyTip( sceneId, selfId, "�ñ�ʯ�޷�����,��ʯ����th�t b�i." )
		return
	end

	--�����ng����������Ʒ....
	if NeedID ~= NeedItemID then
		x800118_NotifyTip( sceneId, selfId, "����������Ʒ����,��ʯ����th�t b�i." )
		return
	end

	--����Ǯ��ng���㹻....
	local PlayerMoney = GetMoney( sceneId, selfId ) +  GetMoneyJZ(sceneId, selfId)  --�����ռ� Vega
	if PlayerMoney < NeedMoney then
		x800118_NotifyTip( sceneId, selfId, "Kh�ng �� ng�n l��ng.,��ʯ����th�t b�i." )
		return
	end

	--��������ng��C�n ��....
	local bNeedBind = 0
	if LuaFnGetItemBindStatus(sceneId, selfId, GemItemPos1) == 1 then
	  bNeedBind = 1
	end
	if LuaFnGetItemBindStatus(sceneId, selfId, GemItemPos2) == 1 then
	  bNeedBind = 1
	end
	if LuaFnGetItemBindStatus(sceneId, selfId, GemItemPos3) == 1 then
	  bNeedBind = 1
	end
	if LuaFnGetItemBindStatus(sceneId, selfId, NeedItemPos) == 1 then
	  bNeedBind = 1
	end

	--�۳���ʯ��������Ʒ....
	--local GemItemInfo = GetBagItemTransfer( sceneId, selfId, GemItemPos1 )
	local NeedItemInfo = GetBagItemTransfer( sceneId, selfId, NeedItemPos )

	local ret = -1
	ret = LuaFnIsItemAvailable( sceneId, selfId, GemItemPos1 )
	if ret ~= 1 then
		x800118_NotifyTip( sceneId, selfId, "��ʯ�޷�ʹ��,��ʯ����th�t b�i." )
		return
	end
	ret = LuaFnIsItemAvailable( sceneId, selfId, GemItemPos2 )
	if ret ~= 1 then
		x800118_NotifyTip( sceneId, selfId, "��ʯ�޷�ʹ��,��ʯ����th�t b�i." )
		return
	end
	ret = LuaFnIsItemAvailable( sceneId, selfId, GemItemPos3 )
	if ret ~= 1 then
		x800118_NotifyTip( sceneId, selfId, "��ʯ�޷�ʹ��,��ʯ����th�t b�i." )
		return
	end
	ret = LuaFnIsItemAvailable( sceneId, selfId, NeedItemPos )
	if ret ~= 1 then
		x800118_NotifyTip( sceneId, selfId, "������Ʒ�޷�ʹ��,��ʯ����th�t b�i." )
		return
	end


	-- ���뱣֤�۳���Ʒȫ���ɹ�,�κ�m�t ��th�t b�i�������޷��ϳɱ�ʯ,�����Ѿ��۳�to� � ��ʯ���黹,added by dun.liu 2009.2.5
	if LuaFnEraseItem( sceneId, selfId, GemItemPos1 ) == 0 then
		x800118_NotifyTip( sceneId, selfId, "�۳���Ʒth�t b�i,�޷�������ʯ." )
		return
	end
	
	if LuaFnEraseItem( sceneId, selfId, GemItemPos2 ) == 0 then
		x800118_NotifyTip( sceneId, selfId, "�۳���Ʒth�t b�i,�޷�������ʯ." )
		return
	end
	
	if LuaFnEraseItem( sceneId, selfId, GemItemPos3 ) == 0 then
		x800118_NotifyTip( sceneId, selfId, "�۳���Ʒth�t b�i,�޷�������ʯ." )
		return
	end
	
	if LuaFnEraseItem( sceneId, selfId, NeedItemPos ) == 0 then
		x800118_NotifyTip( sceneId, selfId, "�۳���Ʒth�t b�i,�޷�������ʯ." )
		return
	end


	--��Ǯ....
	ret = LuaFnCostMoneyWithPriority( sceneId, selfId, NeedMoney )      --�����ռ� Vega
	if ret < 0 then
		x800118_NotifyTip( sceneId, selfId, "Kh�ng �� ng�n l��ng.,��ʯ����th�t b�i." )
		return
	end

	--�����������to� � ��ʯ....���ü�ⱳ����ng���еط�....û�ط�ǰ��Ҳdel���ط���....
	local BagIndex = TryRecieveItem( sceneId, selfId, ProductID, QUALITY_MUST_BE_CHANGE )
	if BagIndex == -1 then
		x800118_NotifyTip( sceneId, selfId, "��������,��ʯ����th�t b�i." )
		return
	end
	if bNeedBind == 1 then
		LuaFnItemBind(sceneId, selfId, BagIndex)
	end
	local ProductItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )

	--ͳ��....
	LuaFnAuditGemMelting( sceneId, selfId, GemItemID1, GemItemID2, GemItemID3, NeedItemID, ProductID )

	--��Ŀ��ʾ....
	x800118_NotifyTip( sceneId, selfId, "3��(#{_ITEM"..GemItemID1.."})���ɹ�������m�t ��(#{_ITEM"..ProductID.."})" )

	--����....
	if LuaFnGetItemQuality(ProductID) >= 3 then
		local MeltingNPCTbl =
		{
			[0]   = "L�c D߽ng(178,185)����",
			[420] = "Th�c H� C� Tr�n(134,84)��Ƕʵ",
			[186] = "L�u Lan(74,161)����ľ",
		}
		local NPCInfo = MeltingNPCTbl[sceneId]
		local PlayerName = GetName(sceneId, selfId)
		local strText = format("#{JKBS_081021_016}#{_INFOUSR%s}#{JKBS_081021_017}#{_ITEM%s}#{JKBS_081021_018}#{_INFOMSG%s}#{JKBS_081021_019}%s#{JKBS_081021_020}#{_INFOMSG%s}#{JKBS_081021_021}", PlayerName, GemItemID1, NeedItemInfo, NPCInfo, ProductItemInfo )
		BroadMsgByChatPipe(sceneId,selfId, strText, 4)
	end

	--�����ɹ���Ч....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)

end

--**********************************
--��Ŀ��ʾ
--**********************************
function x800118_NotifyTip( sceneId, selfId, Msg )

	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
