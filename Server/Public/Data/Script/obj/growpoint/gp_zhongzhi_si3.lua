--���� �i�m�ű�,˿3
--�ű���
--g_ScriptId = 711053

--������ �i�m���
x711053_g_GpId = 554

--���� �i�mC�n to� � ��c�p
x711053_g_ItemBoxNeedLevel = 6

function	x711053_OnOpen(sceneId,selfId,targetId)
	-- �i�m������ �i�mto� � ����GUID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--������ngSceneID,ItemBoxID
	-- �i�m�� �i�m������ �i�mto� � ���to� � guid
	PlayerGuid = GetHumanGUID(sceneId,selfId)
	if ItemBoxOwnerGUID~= PlayerGuid then
		BeginEvent(sceneId)
	  		AddText(sceneId,"����ո������to� � ׯ�ڿɲ�����!");
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
		return OR_INVALID_TARGET_POS
	end
	-- �i�m�����ܵ�c�p
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)
	if AbilityLevel >= x711053_g_ItemBoxNeedLevel then
		return OR_OK
	else
		return OR_NO_LEVEL
	end
end

function	x711053_OnProcOver(sceneId,selfId,targetId)
	return OR_OK
end

function	 x711053_OnRecycle(sceneId,selfId,targetId)
	local num = 0
	--ȡ �i�m���� �i�mto� � ����
	GP_X = GetItemBoxWorldPosX(sceneId,targetId)
	GP_Z = GetItemBoxWorldPosZ(sceneId,targetId)
	--��ȡ��
	GP_X = floor(GP_X)
	GP_Z = floor(GP_Z)
	--�ж���ֲ��to� � λ��T�i ��c�i��ֲ�ƹ�Ͻto� � ��Χ��
	for i, findid in PLANTNPC_ADDRESS do
		if	(GP_X >= findid.X_MIN)  and (GP_Z >= findid.Z_MIN) and (GP_X <= findid.X_MAX)  and (GP_Z <= findid.Z_MAX) and (sceneId == findid.Scene) then
			num = i	
			break
		end
	end
	
	--����Ҳ�����ȷto� � λ����Tr� v�
	if num == 0 then
		return
	end
	--�ҵ���ȷto� � ���,����ֲ��-1
	PLANTFLAG[num] = PLANTFLAG[num] - 1
	return 1
end
