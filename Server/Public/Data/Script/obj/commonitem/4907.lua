-- ��c�p���޻�ͯ����


-- ����ͨ�ù��ܽű�
x334907_g_petCommonId = PETCOMMON

--******************************************************************************
-- ���²���C�n ��ngC�n �޸�to� � ����
--******************************************************************************

--�ű��� (�ĳ���ȷ�ű���)
x334907_g_scriptId = 334907

--��׼Ч��ID (�ĳɳ���ʹ��ѱ������to� � ��Ч)
--g_ImpactID = 0

--******************************************************************************
-- ���ϲ���C�n ��ngC�n �޸�to� � ����
--******************************************************************************

--�ű�

--**********************************
--����Tr� v� 1 ������ȷִ����������
--**********************************
function x334907_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--����������: 
--H� th�ng��T�i ���ܼ��to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �������ͨ��,���Լ���ִ�У�Tr� v�0: �������th�t b�i,�жϺ���ִ��.
--**********************************
function x334907_OnConditionCheck( sceneId, selfId )
	--У��ʹ��to� � ��Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )
	
	local petDataID = LuaFnGetPetDataIDByGUID(sceneId, selfId, petGUID_H, petGUID_L);
	if not petDataID or petDataID < 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "�޷���ָ�����޽��л�ͯ." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
	
	local petTakeLevel = GetPetTakeLevel(petDataID);
	if not petTakeLevel or petTakeLevel < 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "�޷�ʶ������to� � Я����c�p." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
	
	if petTakeLevel > 85 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{95ZSH_081121_01}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	if LuaFnPetCanReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 0, -1) == 0 then
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
function x334907_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--ֻ��ִ��m�t �����: 
--������˲�����ܻ�T�i ������ɺ����C�i n�y �ӿ�(�����������Ҹ���������Th�a m�nto� � ʱ��),������
--����Ҳ��T�i ������ɺ����C�i n�y �ӿ�(����to� � m�t ��ʼ,���ĳɹ�ִ��֮��).
--Tr� v�1: ����ɹ���Tr� v�0: ����th�t b�i.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x334907_OnActivateOnce( sceneId, selfId )
	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	local ret,curLevel = LuaFnPetReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 0, -1)
	
		--��ͯ�ɹ�Ҫ����Ŀ��ʾ--add by xindefeng
	if((ret ~= nil) or (ret == 1))then
		BeginEvent( sceneId )
			AddText( sceneId, "���޻�ͯ�ɹ�!" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )	
	end

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--���������������: 
--�������ܻ�T�i ÿ����������ʱ����C�i n�y �ӿ�.
--Tr� v�: 1�����´�������0: �ж�����.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x334907_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- C�i n�y ����û��ʲô��,����ng������
function x334907_CancelImpacts( sceneId, selfId )
	return 0
end
