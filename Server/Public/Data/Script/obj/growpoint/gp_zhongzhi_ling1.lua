--���� �i�m�ű�,�����
--�ű���
--g_ScriptId = 711057

--������ �i�m���
x711057_g_GpId = 558

--��m�t c�i���� �i�mto� � ���
x711057_g_GpIdNext = 559

function	 x711057_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711057_g_GpIdNext,sceneId,QUALITY_MUST_BE_CHANGE,0)
	-- �i�m������ �i�mto� � ����GUID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--������ngSceneID,ItemBoxID
	--��ItemBox�趨����
	SetItemBoxOwner(sceneId,ItemBoxId,ItemBoxOwnerGUID)

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,450000)	--�趨����ʱ��
	return 1
end
