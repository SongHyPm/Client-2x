--���� �i�m�ű�,�϶�2
--�ű���
--g_ScriptId = 711028

--������ �i�m���
x711028_g_GpId = 529

--��m�t c�i���� �i�mto� � ���
x711028_g_GpIdNext = 530

function	 x711028_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711028_g_GpIdNext,sceneId,QUALITY_MUST_BE_CHANGE,1,20104010)
	
	-- �i�m������ �i�mto� � ����ID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--������ngSceneID,ItemBoxID
	--��ItemBox�趨����
	SetItemBoxOwner(sceneId,ItemBoxId,ItemBoxOwnerGUID)
	SetItemBoxPickOwnerTime(sceneId,ItemBoxId,600000)	--�趨��ʱ��
	EnableItemBoxPickOwnerTime(sceneId,ItemBoxId)		--����ʱ�俪ʼ��ʱ

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,600000)	--�趨����ʱ��

	--ȡ �i�m���� �i�mto� � ����
	GP_X = GetItemBoxWorldPosX(sceneId,targetId)
	GP_Z = GetItemBoxWorldPosZ(sceneId,targetId)
	--��ȡ��
	GP_X = floor(GP_X)
	GP_Z = floor(GP_Z)
	--�ж���ֲ��to� � λ��T�i ��c�i��ֲ�ƹ�Ͻto� � ��Χ��
	local num = 0
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

	--�ж���ֲ����ng����ng8,�����ng8��֪ͨ���
	if PLANTFLAG[num] == 8 then
		LuaFnSendMailToGUID(sceneId,ItemBoxOwnerGUID,"����ֲto� � ֲ���Ѿ�������,��T�i 10 ph�t���ջ�.")
	end
	--�ҵ���ȷto� � ���,����ֲ��-1
	PLANTFLAG[num] = PLANTFLAG[num] - 1

	return 1
end
