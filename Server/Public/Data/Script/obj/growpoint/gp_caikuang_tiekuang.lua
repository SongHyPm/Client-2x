--���� �i�m
--��Ӧ�����: �ɿ�	�ɿ���to� � ���7
--����
--�ű���710002
--����ʯ1	0.6		2	0.3		3	0.1		�Ʊ�ʯ1%
--��20%���� �i�m������Ʒ20103014,20103026,20103038,20103050 ��to� � m�t ��,����1	0.6		2	0.3		3	0.1
--��c�p1

--ÿ�δ򿪱ض� ��t ���cto� � ��Ʒ
x710002_g_MainItemId = 20103002
--���� �i�m��to� � ��Ʒ
x710002_g_SubItemId = 50113001
--����Ʒ
x710002_g_Byproduct = {20103014,20103026,20103038,20103050}
--C�n ����Id
x710002_g_AbilityId = 7
--C�n ���ܵ�c�p
x710002_g_AbilityLevel = 2


--���ɺ�����ʼ************************************************************************
--ÿc�iItemBox�����10c�i��Ʒ
function 		x710002_OnCreate(sceneId,growPointType,x,y)
	--����ItemBoxͬʱ����m�t c�i��Ʒ
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x710002_g_MainItemId)	--ÿc�i���� �i�m������ �i�m��m�t c�i��Ʒ,����ֱ�ӷ���itembox��m�t c�i
	-- ��t ���c1~100to� � �����,������������Ʒ�͸���Ʒ�Լ���Ҫ��Ʒ(��ʯ)
	--����Ʒ1~60����,61~90��1c�i,91~100��2c�i
	--����Ʒ1~12��1c�i,13~18��2c�i,19~20��3c�i
	--��Ҫ��Ʒ(��ʯ)1��1c�i
	local ItemCount = random(1,100)
	if ItemCount >= 61 and ItemCount <= 90 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710002_g_MainItemId)
	elseif ItemCount >= 91 and ItemCount <= 100 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710002_g_MainItemId,x710002_g_MainItemId)
	end
	--�����Ҫ��Ʒ
	if ItemCount == 1 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710002_g_SubItemId)
	end
	--���븱��Ʒ
	if ItemCount >= 51 and ItemCount <= 70 then
		local ByproductId = random(1,4)
		if ItemCount >= 51 and ItemCount <= 62 then
			AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710002_g_Byproduct[ByproductId])
		elseif ItemCount >= 63 and ItemCount <= 68 then
			AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710002_g_Byproduct[ByproductId],x710002_g_Byproduct[ByproductId])
		elseif ItemCount >= 69 and ItemCount <= 70 then
			AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,3,x710002_g_Byproduct[ByproductId],x710002_g_Byproduct[ByproductId],x710002_g_Byproduct[ByproductId])
		end
	end
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x710002_OnOpen(sceneId,selfId,targetId)
--Tr� v�����
-- 0 ��ʾ�򿪳ɹ�
	ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	res = x710002_OpenCheck(sceneId,selfId,ABilityID,AbilityLevel)
	return res
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	 x710002_OnRecycle(sceneId,selfId,targetId)
	-- ����������
	ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x710002_g_AbilityLevel)
	--Tr� v�1,���� �i�m����
	return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710002_OnProcOver( sceneId, selfId, targetId )
	local ABilityID = GetItemBoxRequireAbilityID( sceneId, targetId )
	CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, ABilityID, x710002_g_AbilityLevel )
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710002_OpenCheck(sceneId,selfId,AbilityId,AbilityLevel)
	--�������ܵ�c�p
	if AbilityLevel<x710002_g_AbilityLevel then
		return OR_NO_LEVEL
	end
	--���Tinh��
	if GetHumanEnergy(sceneId,selfId)< (floor(x710002_g_AbilityLevel * 1.5 +2) * 2) then
		return OR_NOT_ENOUGH_ENERGY
	end
	return OR_OK
end
