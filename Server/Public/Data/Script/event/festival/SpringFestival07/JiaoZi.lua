--ע��: 

--��Ʒ����to� � �߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--������ng�ű�����:


--JiaoZi.lua
------------------------------------------------------------------------------------------
--m�t ����Ʒto� � Ĭ�Ͻű�

--�ű���
x050057_g_scriptId = 050057 --��ʱдC�i n�y ,������to� � ʱ��m�t ��Ҫ��.

--buffto� � �б�
x050057_g_Impact = {

		3004,
}

x050057_g_Impact1 = {
					10490,
					10491,
					10492,
					10493,
}

--�Ե��ö���to� � ����
x050057_g_strGetItem = {

	"",
	"",
	"",
}

x050057_g_GetItem =
{
	30505167,
	30505168,
	30505169,
}
--**********************************
--�¼��������
--**********************************
function x050057_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ��C�n C�i n�y �ӿ�,��Ҫ�����պ���
end

--**********************************
--C�i n�y ��Ʒto� � ʹ�ù�����ng�������ڼ���: 
--H� th�ng��T�i ִ�п�ʼʱ���C�i n�y ����to� � Tr� v�ֵ,���Tr� v�th�t b�i����Ժ���to� � ���Ƽ���to� � ִ��.
--Tr� v�1: ��������to� � ��Ʒ,���Լ������Ƽ���to� � ִ�У�Tr� v�0: ���Ժ���to� � ����.
--**********************************
function x050057_IsSkillLikeScript( sceneId, selfId)
	return 1; --C�i n�y �ű�C�n ����֧��
end

--**********************************
--ֱ��Hu� b�Ч��: 
--H� th�ng��ֱ�ӵ���C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �Ѿ�Hu� b���ӦЧ��,����ִ�к���������Tr� v�0: û�м�⵽���Ч��,����ִ��.
--**********************************
function x050057_CancelImpacts( sceneId, selfId )
	return 0; --��C�n C�i n�y �ӿ�,��Ҫ�����պ���,����ʼ��Tr� v�0.
end

--**********************************
--����������: 
--H� th�ng��T�i ���ܼ��to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �������ͨ��,���Լ���ִ�У�Tr� v�0: �������th�t b�i,�жϺ���ִ��.
--**********************************
function x050057_OnConditionCheck( sceneId, selfId )
	--У��ʹ��to� � ��Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	local OwnGUID	= GetBagItemParam( sceneId, selfId, bagId, 4, 2 )
	OwnGUID = OwnGUID + 2147483648
	local SelfGUID = LuaFnGetGUID( sceneId, selfId )
	if OwnGUID == SelfGUID then
		BeginEvent( sceneId )
			AddText( sceneId, "��Ʒ����ֻ�ܽ��׸�����ʹ��." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	if LuaFnGetPropertyBagSpace(sceneId, selfId) == 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{LLFB_80821_6}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	
	--local id = selfId
	--local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	--if 30001035 < itemTblIndex then
		--id = LuaFnGetTargetObjID(sceneId, selfId)
		--if(1~=LuaFnUnitIsFriend(sceneId, selfId, id)) then
		--	SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			--return 0;
	--	end	
	--end
	--��Ѫto� � ��Ѫ���
	--if(GetHp(sceneId, id) >= GetMaxHp(sceneId, id)) then
	--	LuaFnSendOResultToPlayer(sceneId, selfId, OR_HEALTH_IS_FULL)
	--	return 0
	--end
	

	return 1;
end

--**********************************
--���ļ�⼰�������: 
--H� th�ng��T�i ��������to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: ���Ĵ���ͨ��,���Լ���ִ�У�Tr� v�0: ���ļ��th�t b�i,�жϺ���ִ��.
--ע��: �ⲻ�⸺������to� � ���Ҳ��������to� � ִ��.
--**********************************
function x050057_OnDeplete( sceneId, selfId )
	--������....��߻�Ҫʹ�ô浽��Ʒ��to� � ��Ϣ��....
	return 1;
end

--**********************************
--ֻ��ִ��m�t �����: 
--������˲�����ܻ�T�i ������ɺ����C�i n�y �ӿ�(�����������Ҹ���������Th�a m�nto� � ʱ��),������
--����Ҳ��T�i ������ɺ����C�i n�y �ӿ�(����to� � m�t ��ʼ,���ĳɹ�ִ��֮��).
--Tr� v�1: ����ɹ���Tr� v�0: ����th�t b�i.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x050057_OnActivateOnce( sceneId, selfId )

	--�Լ�����ʹ��....
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return
	end
	
	local OwnGUID	= GetBagItemParam( sceneId, selfId, bagId, 4, 2 )
	OwnGUID = OwnGUID + 2147483648
	local SelfGUID = LuaFnGetGUID( sceneId, selfId )
	if OwnGUID == SelfGUID then
		BeginEvent( sceneId )
			AddText( sceneId, "��Ʒ����ֻ�ܽ��׸�����ʹ��." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--����Ʒ....
	if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end

	--��buff....������Ч
	local id = selfId
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	--if 30001035 < itemTblIndex then
		--id = LuaFnGetTargetObjID(sceneId, selfId)
		--if(1~=LuaFnUnitIsFriend(sceneId, selfId, id)) then
			--SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			--return 0;
		--end
		
	--end
	
	local impactID = x050057_g_Impact[1]
	LuaFnSendSpecificImpactToUnit(sceneId, id, id, id, impactID, 0);

	local randImpact = random(4)
	LuaFnSendSpecificImpactToUnit(sceneId, id, id, id, x050057_g_Impact1[randImpact], 0);
	
	local level = GetLevel( sceneId, selfId )
	local rand10 = random(10)
	
	if level < 30 and rand10 > 1 then
			return 0
	end
	
	--���������ͬto� � ���
	local GoodLuck = random(4000)
	
	
	if GoodLuck < 5 then
	
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[1], QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then
			--������....
			local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local str = format("#W#{_INFOUSR%s}#PT�i ������to� � ����ҧ��m�t c�iӲ��,�³�m�t ������ngm�t ö#cB3DB35#{_INFOMSG%s}#P,����ϲЦ�տ�.ףţ���Դ����,��������.", GetName(sceneId,selfId), ItemInfo)
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	elseif GoodLuck > 1500 and GoodLuck < 1511 then
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[2], QUALITY_MUST_BE_CHANGE )
		
		if BagIndex ~= -1 then
			local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local str = format("#W#{_INFOUSR%s}#PT�i ������to� � ����ҧ��m�t c�iӲ��,�³�m�t ������ngm�t ö#cB3DB35#{_INFOMSG%s}#P,����ϲЦ�տ�.ףţ���Դ����,��������.", GetName(sceneId,selfId), ItemInfo)
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	elseif GoodLuck > 2500 and GoodLuck < 2901 then
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[3], QUALITY_MUST_BE_CHANGE )
		
		if BagIndex ~= -1 then
			--local str = format("#W#{_INFOUSR%s}#PT�i ������to� � ����ҧ��m�t c�iӲ��,�³�m�t ������ngm�t ö#H#{_ITEM%d}#P,����ϲЦ�տ�.ףţ���Դ����,��������.", GetName(sceneId,selfId), x050057_g_GetItem[3])
			--BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	end
	
	return 1;
end

--**********************************
--���������������: 
--�������ܻ�T�i ÿ����������ʱ����C�i n�y �ӿ�.
--Tr� v�: 1�����´�������0: �ж�����.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x050057_OnActivateEachTick( sceneId, selfId)
	return 1; --����ng�����Խű�, ֻ�����պ���.
end
