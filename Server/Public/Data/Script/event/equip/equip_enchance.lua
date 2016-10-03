--װ��ǿ��
--�ű���
x809262_g_ScriptId = 809262

x809262_g_QianghualuId = 30900045

x809262_g_QianghualuTime = 11
gem_index = 30900045
--װ��ǿ��UI 1002

--**********************************
--�о��¼�
--**********************************
function x809262_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--װ��ǿ�����
--**********************************
function x809262_FinishEnhance( sceneId, selfId, itemidx1, itemidx2 )
	local ret = LuaFnIsItemAvailable( sceneId, selfId, itemidx1 )
	
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Trang b� hi�n �ang b� kho� ho�c kh�ng th� c߶ng ho�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsItemAvailable( sceneId, selfId, itemidx2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		--AddText(sceneId,"��ǿ��Tinh��������.");
		AddText(sceneId,"Kh�ng th� s� d�ng ".. GetItemName( sceneId, itemidx2 ));
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	equip_level = GetBagItemLevel( sceneId, selfId, itemidx1 )
	gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, itemidx2 )
	if equip_level < 40 then
	
		if gem_index ~= 30900005 then
			--��c�pǿ��Tinh��
			str	= format( "Mu�n c߶ng h�a trang b� c�n %s ", GetItemName( sceneId, 30900005 ) )
			BeginEvent(sceneId)
			AddText(sceneId,str);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	else

		if gem_index ~= 30900006 and gem_index ~= x809262_g_QianghualuId then
			--��c�pǿ��Tinh��
			str	= format( "Mu�n c߶ng h�a trang b� c�n %s��%s ", GetItemName( sceneId, 30900006 ), GetItemName( sceneId, x809262_g_QianghualuId ) )
			BeginEvent(sceneId)
			AddText(sceneId,str);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	end

	--�����ng���ܹ�ǿ�� 
	ret, arg0 = LuaFnEquipEnhanceCheck( sceneId, selfId, itemidx1, itemidx2 )
	local text="װ��ǿ���ɹ�!"
	if ret == 0 then
		--ǿ�����ļ��ɹ�
		x809262_DoFinishEnhance( sceneId, selfId, itemidx1*1000+itemidx2)
		return
	end
	
	if ret == -1 then
		text="L�i kh�ng x�c �nh"
	end
	
	if ret == -2 then
		text="Kh�ng d�ng ���c trang b� n�y"
	end
	
	if ret == -3 then
		--text="ǿ��Tinh��������."
		text="C߶ng h�a tinh hoa kh�ng th� d�ng."
	end
	
	if ret == -4 then
		text="��ng c�p C߶ng h�a c�a trang b� n�y �� l�n nh�t"
	end

	if ret == -5 then
		text="C߶ng h�a trang b� c�n #{_EXCHG%d}, ng�n l��ng tr�n ng߶i c�c h� kh�ng ��." --zchw
		text=format( text, arg0 )
	end
	
	if ret == -7 then
		text="Trang b� n�y kh�ng c߶ng h�a ���c"
	end

	if ret == -6 then
		--C�n ȷ�Ͻ���
		--text="ǿ��th�t b�i֮��,ǿ����c�p������"..tostring(arg0)..",��ng�����ǿ��?"
		--BeginUICommand(sceneId)
			--UICommand_AddInt(sceneId,x809262_g_ScriptId);
			--UICommand_AddInt(sceneId,targetId);
			--UICommand_AddInt(sceneId,itemidx1*1000+itemidx2);
			--UICommand_AddString(sceneId,"DoFinishEnhance");
			--UICommand_AddString(sceneId,text);
			--EndUICommand(sceneId)
		--DispatchUICommand(sceneId,selfId, 24)
		x809262_DoFinishEnhance( sceneId, selfId, itemidx1*1000+itemidx2)
		return
	end
	
	BeginEvent(sceneId)
	AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--װ��ǿ��
--**********************************
function x809262_DoFinishEnhance( sceneId, selfId, index )
	local itemidx1 = floor(index / 1000)
	local itemidx2 = mod(index , 1000)
	local text = "C߶ng h�a trang b� th�nh c�ng"

	--ǿ��
	local ret,arg0 = LuaFnEquipEnhance( sceneId, selfId, itemidx1, itemidx2 )

	if ret == 0 then
		if arg0 >= 5 then
			local	szTranItm1	= GetBagItemTransfer( sceneId, selfId, itemidx1 )
			local	szTranItm2	= GetBagItemTransfer( sceneId, selfId, itemidx2 )
			local	szMsg				= format( "#W#{_INFOUSR%s}#{EQ_1}#{_INFOMSG%s}#{EQ_2}%d#{EQ_3} #{_INFOMSG%s}#{EQ_4}",
														LuaFnGetName( sceneId, selfId ), szTranItm2, arg0, szTranItm1 )
			--����Tinh��,С��5c�pto� � ǿ��,��������
			AddGlobalCountNews( sceneId, szMsg )
			--BroadMsgByChatPipe( sceneId, selfId, szMsg, 4 )
		end
		
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);

		gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, itemidx2 )
		
		if x809262_g_QianghualuId == gem_index then
			--local r, t = LuaFnEraseItemTimes( sceneId, selfId, itemidx2, x809262_g_QianghualuTime )
			LuaFnEraseItemTimes( sceneId, selfId, itemidx2, x809262_g_QianghualuTime )
			--PrintNum(r);
			--PrintNum(t)
			
			-- BeginEvent(sceneId)
			-- --local str = "���ǿ��¶ʣ��ʹ�ô���%d"
			-- local	szMsg				= format( "T�n su�t % c߶ng h�a c�n l�i %d/%d", tonumber(t), tonumber(x809262_g_QianghualuTime) );
			-- AddText(sceneId,szMsg);
			-- EndEvent(sceneId)
			-- DispatchMissionTips(sceneId,selfId)
		else
			LuaFnEraseItem( sceneId, selfId, itemidx2 )
		end
	end

	if ret == -1 then
		text="L�i kh�ng x�c �nh"
	end
	
	if ret == -2 then
		text="Trang b� hi�n �ang b� kho� ho�c kh�ng th� c߶ng ho�"
	end
	
	if ret == -3 then
		text="C߶ng h�a tinh hoa kh�ng th� d�ng."
	end
	
	if ret == -4 then
		text="��ng c�p C߶ng h�a c�a trang b� n�y �� l�n nh�t"
	end

	if ret == -5 then
		text="C߶ng h�a trang b� c�n #{_EXCHG%d}, ng�n l��ng tr�n ng߶i c�c h� kh�ng ��"
		text=format( text, arg0 )
	end

	if ret == -6 then
		text="��ng ti�c, c߶ng h�a th�t b�i"
		if x809262_g_QianghualuId == gem_index then
			--local r, t = LuaFnEraseItemTimes( sceneId, selfId, itemidx2, x809262_g_QianghualuTime )
			LuaFnEraseItemTimes( sceneId, selfId, itemidx2, x809262_g_QianghualuTime )
			--PrintNum(r);
			--PrintNum(t)
			
			-- BeginEvent(sceneId)
			-- local	szMsg				= format( "T�n su�t % c߶ng h�a c�n l�i %d/%d", tonumber(t), tonumber(x809262_g_QianghualuTime) );
			-- AddText(sceneId,szMsg);
			-- EndEvent(sceneId)
			-- DispatchMissionTips(sceneId,selfId)
	
		else
			LuaFnEraseItem( sceneId, selfId, itemidx2 )
		end
		--LuaFnEraseItem( sceneId, selfId, itemidx2 )
	end

	BeginEvent(sceneId)
	AddText(sceneId,text);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
