--���� �i�m�ű�,������
--�ű���
--g_ScriptId = 711054

--������ �i�m���
x711054_g_GpId = 555

--��m�t c�i���� �i�mto� � ���
x711054_g_GpIdNext = 556

function	 x711054_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711054_g_GpIdNext,sceneId,QUALITY_MUST_BE_CHANGE,0)
	-- �i�m������ �i�mto� � ����GUID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--������ngSceneID,ItemBoxID
	--��ItemBox�趨����
	SetItemBoxOwner(sceneId,ItemBoxId,ItemBoxOwnerGUID)

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,450000)	--�趨����ʱ��
	return 1
end
