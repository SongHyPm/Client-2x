--ע��: 

--��Ʒ����to� � �߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--������ng�ű�����:


--4846.lua
------------------------------------------------------------------------------------------
--m�t ����Ʒto� � Ĭ�Ͻű�
--��λ��(��ɫ����ɫ����ɫ����ɫ����ɫ����ɫ)
--�ű���
x334846_g_ScriptId	= 334846

--Ч��to� � ID
x334846_g_Impact		= -1	--ʹ��m�t c�i�ض�to� � ��Ч���

--������
x334846_g_Key				= {}
x334846_g_Key["nul"]= 0		--ɶ��û��
x334846_g_Key["log"]= 1		--��¼����
x334846_g_Key["bus"]= 2		--�ɹ�����

--��ͬ��c�pto� � ��λ��ʹ�ô�����ͬ
x334846_g_UseTim		= { 8, 13, 20,30 }

x334846_g_Yinpiao = 40002000

x334846_g_Impact_NotTransportList = { 5929 } -- ��ֹ����to� � Impact
x334846_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- ��ֹ����to� � Impact��ʾ��Ϣ

--��ֹ���͵�L�u Lan������c�p����	--add by xindefeng
x334846_g_LimitTransLevel = 75

--**********************************
--�¼��������
--**********************************
function x334846_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ��C�n C�i n�y �ӿ�,��Ҫ�����պ���
end

--**********************************
--C�i n�y ��Ʒto� � ʹ�ù�����ng�������ڼ���: 
--H� th�ng��T�i ִ�п�ʼʱ���C�i n�y ����to� � Tr� v�ֵ,���Tr� v�th�t b�i����Ժ���to� � ���Ƽ���to� � ִ��.
--Tr� v�1: ��������to� � ��Ʒ,���Լ������Ƽ���to� � ִ�У�Tr� v�0: ���Ժ���to� � ����.
--**********************************
function x334846_IsSkillLikeScript( sceneId, selfId )
	return 1	 --C�i n�y �ű�C�n ����֧��
end

--**********************************
--ֱ��Hu� b�Ч��: 
--H� th�ng��ֱ�ӵ���C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �Ѿ�Hu� b���ӦЧ��,����ִ�к���������Tr� v�0: û�м�⵽���Ч��,����ִ��.
--**********************************
function x334846_CancelImpacts( sceneId, selfId )
	return 0	 --��C�n C�i n�y �ӿ�,��Ҫ�����պ���,����ʼ��Tr� v�0.
end

--**********************************
--����������: 
--H� th�ng��T�i ���ܼ��to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �������ͨ��,���Լ���ִ�У�Tr� v�0: �������th�t b�i,�жϺ���ִ��.
--**********************************
function x334846_OnConditionCheck( sceneId, selfId )

	--������to� � λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--�жϵ�ǰ״̬��ng���ʹ�ö�λ��
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x334846_MsgBox( sceneId, selfId, "�����ڲ�������to� � ״̬,����ʹ�ö�λ��!" )
		return 0
	end

	--�����Ʒ��ng�����
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x334846_MsgBox( sceneId, selfId, "V�t ph�m n�y �� b� kh�a!" )
		return 0
	end

	--������������ng����ng�С���Ʊ��C�i n�y ����,�оͲ���ʹ������to� � ����
	if GetItemCount(sceneId, selfId, x334846_g_Yinpiao) >= 1  then
		x334846_MsgBox(sceneId, selfId, "����������״̬,����ʹ�ö�λ��!")
		return 0
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x334846_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x334846_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	local	opx, opy	--��������
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )
	local osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )--�Ѷ�λ����ID
	--��δ��¼����λ��Ϣ
	if opx <= 0 and opy <= 0 then
		--�жϵ�ǰ������ng���ʹ�ö�λ��
		if sceneId ~= SCENE_DALI and sceneId ~= SCENE_LUOYANG and sceneId ~= SCENE_SUZHOU and sceneId ~= SCENE_LOULAN then	--L�u LanҲ��ng����--modify by xindefeng
			x334846_MsgBox( sceneId, selfId, "����T� Ch�u��L�c D߽ng����i L���L�u Lan��,����T�i ��������ʹ�ö�λ��!" )
			return 0
		end		
	else	
		--�Ѿ���λ,���Ҷ�λ��L�u Lan,���ж�c�p��,<90c�p����!--add by xindefeng
		if (osid == SCENE_LOULAN) and (GetLevel(sceneId, selfId) < x334846_g_LimitTransLevel) then
			local szMsg = format("L�u LanC�n %dc�pm�i c� th� ti�n v�o", x334846_g_LimitTransLevel)
			x334846_MsgBox( sceneId, selfId, szMsg )
			return 0
		end
	end

	--У��ʹ��to� � ��Ʒ
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	return 1

end

--**********************************
--���ļ�⼰�������: 
--H� th�ng��T�i ��������to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: ���Ĵ���ͨ��,���Լ���ִ�У�Tr� v�0: ���ļ��th�t b�i,�жϺ���ִ��.
--ע��: �ⲻ�⸺������to� � ���Ҳ��������to� � ִ��.
--**********************************
function x334846_OnDeplete( sceneId, selfId )
--if( 0 < LuaFnDepletingUsedItem( sceneId, selfId ) ) then
--	return 1
--end
--return 0

	return 1
end

--**********************************
--ֻ��ִ��m�t �����: 
--������˲�����ܻ�T�i ������ɺ����C�i n�y �ӿ�(�����������Ҹ���������Th�a m�nto� � ʱ��),������
--����Ҳ��T�i ������ɺ����C�i n�y �ӿ�(����to� � m�t ��ʼ,���ĳɹ�ִ��֮��).
--Tr� v�1: ����ɹ���Tr� v�0: ����th�t b�i.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x334846_OnActivateOnce( sceneId, selfId )
	if( -1 ~= x334846_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x334846_g_Impact, 0 )
	end
	
	--������to� � λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	local	key, tim	= x334846_OnUse( sceneId, selfId )
	
	--�ж���ng��������Ʒ
	if key == x334846_g_Key["bus"] and tim <= 0 then
--	LuaFnDepletingUsedItem( sceneId, selfId )
		if bagId >= 0 then
			EraseItem( sceneId, selfId, bagId )
		end
	end

	return 1
end

--**********************************
--���������������: 
--�������ܻ�T�i ÿ����������ʱ����C�i n�y �ӿ�.
--Tr� v�: 1�����´�������0: �ж�����.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x334846_OnActivateEachTick( sceneId, selfId )
	return 1	 --����ng�����Խű�, ֻ�����պ���.
end

--**********************************
--ʹ��,Tr� v�����ָ���Լ�ʣ��ʹ�ô���
--**********************************
function x334846_OnUse( sceneId, selfId )

	--������to� � λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return x334846_g_Key["nul"]
	end

	--�жϵ�ǰ״̬��ng���ʹ�ö�λ��
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x334846_MsgBox( sceneId, selfId, "�����ڲ�������to� � ״̬,����ʹ�ö�λ��!" )
		return x334846_g_Key["nul"]
	end

	--�����Ʒ��ng�����
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x334846_MsgBox( sceneId, selfId, "V�t ph�m n�y �� b� kh�a!" )
		return x334846_g_Key["nul"]
	end

	--������������ng����ng�С���Ʊ��C�i n�y ����,�оͲ���ʹ������to� � ����
	if GetItemCount(sceneId, selfId, x334846_g_Yinpiao) >= 1  then
		x334846_MsgBox(sceneId, selfId, "����������״̬,����ʹ�ö�λ��!")
		return x334846_g_Key["nul"]
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x334846_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x334846_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	--��λ��to� � ���ʹ�ô���
	local	oid		= LuaFnGetItemTableIndexByIndex( sceneId, selfId, bagId )
	local	olev	= GetCommonItemGrade( oid )
	local	omax	= x334846_g_UseTim[olev]

	--��ȡ��¼T�i ��Ʒ����to� � ���ݽṹ
	local	otim			--��λ��to� � ʣ��ʹ�ô���
	local	osid			--�������
	local	opx, opy	--��������
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	--���Ѽ�¼����λ��Ϣ����,�����¼��ǰ��Ϣ
	--ͬʱ��ʹ�ô�����1,����ֵΪ0ʱɾ������Ʒ
	if opx > 0 and opy > 0 then
		if sceneId == osid then
			--ͬm�t ��������
			SetPos( sceneId, selfId, opx, opy )
		else
			--L�u Lan<90c�p����--add by xindefeng
			if (osid == SCENE_LOULAN) and (GetLevel(sceneId, selfId) < x334846_g_LimitTransLevel) then
				local szMsg = format("L�u LanC�n %dc�pm�i c� th� ti�n v�o", x334846_g_LimitTransLevel)
				x334846_MsgBox( sceneId, selfId, szMsg )
				return x334846_g_Key["nul"]
			end
			--�����ng������л���Ŀ�곡��
			if IsCanNewWorld( sceneId, selfId, osid, opx, opy ) ~= 1 then
				return x334846_g_Key["nul"]
			end
			--��ͬ��������
			NewWorld( sceneId, selfId, osid, opx, opy )
		end
		SetBagItemParam( sceneId, selfId, bagId, 3, 0, (otim-1) )
		--��¼ͳ����Ϣ
		LuaFnAuditGPS(sceneId, selfId, 0)

		--ˢ��Client��to� � ������Ʒ��Ϣ
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )
		return x334846_g_Key["bus"], (otim-1)
	end

	--���c�p�λ��Ϣ	
	--�жϵ�ǰ������ng���ʹ�ö�λ��
	if sceneId ~= SCENE_DALI and sceneId ~= SCENE_LUOYANG and sceneId ~= SCENE_SUZHOU and sceneId ~= SCENE_LOULAN then	--L�u LanҲ��ng����--modify by xindefeng
		x334846_MsgBox( sceneId, selfId, "����T� Ch�u��L�c D߽ng����i L���L�u Lan��,����T�i ��������ʹ�ö�λ��!" )
		return x334846_g_Key["nul"]
	end	

	--��ȡ���to� � ��ǰ����
	osid			= sceneId
	opx, opy	= LuaFnGetUnitPosition( sceneId, selfId )
	opx	= floor( opx )
	opy	= floor( opy )

	SetBagItemParam( sceneId, selfId, bagId, 0, 1, 10 )		--Key,��λ��ʶ��������,Ҳ��ngClient����Tooltipsto� � ����
	SetBagItemParam( sceneId, selfId, bagId, 2, 0, omax )	--���ʹ�ô���
	SetBagItemParam( sceneId, selfId, bagId, 3, 0, omax )	--ʣ��ʹ�ô���
	SetBagItemParam( sceneId, selfId, bagId, 4, 1, osid )	--�������
	SetBagItemParam( sceneId, selfId, bagId, 6, 1, opx )	--X����
	SetBagItemParam( sceneId, selfId, bagId, 8, 1, opy )	--Y����
	--ˢ��Client��to� � ������Ʒ��Ϣ
	LuaFnRefreshItemInfo( sceneId, selfId, bagId )
	--��¼ͳ����Ϣ
	LuaFnAuditGPS(sceneId, selfId, 1)

	return x334846_g_Key["log"], omax
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x334846_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
