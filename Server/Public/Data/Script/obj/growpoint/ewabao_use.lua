-- �Լ�id,����index,�������
function		x713552_OnUse(sceneId,selfId,targetId)	
		-- ��t ���c�ر�ͼλ�úͳ������
		StoreMapX = GetStoreMapX(sceneId,selfId,targetId)
		StoreMapZ = GetStoreMapZ(sceneId,selfId,targetId)		
		
		StoreMapSceneID = GetStoreMapSceneID(sceneId,selfId,targetId)
		--������ɫ��T�i ���������Ͼ�Tr� v�th�t b�i
		if StoreMapSceneID~=sceneId then
			return USEITEM_SKILL_FAIL
		end
		
		--�жϽ�ɫλ�úͲر�ͼλ����ng��T�i m�t c�i��Χ��
		HumanX	=	GetHumanWorldX(sceneId,selfId)
		HumanX = StoreMapX - HumanX
		
		if abs(HumanX)>2.0 then
			return USEITEM_SKILL_FAIL
		end
		
		HumanZ	=	GetHumanWorldZ(sceneId,selfId)	
		
		HumanZ = StoreMapZ - HumanZ
		
		if abs(HumanZ)>2.0 then
			return USEITEM_SKILL_FAIL
		end
		--T�i ��������m�t c�i��ر�ͼ����to� � �ر� �i�m
		StoreMapIndex = FindStorePointOnScene(sceneId,0,StoreMapX,StoreMapZ)
		
		if StoreMapIndex	== -1 then	
			return USEITEM_CANNT_USE			
		end
		-- ��t ���c�ر�ͼ����
		StoreMapType = GetStorePointType(sceneId,StoreMapIndex)
		--ɾ���ر� �i�m
		DelStorePointOnScene(sceneId,StoreMapType,StoreMapIndex)
		--����
		TryRecieveItem(sceneId,selfId,10222001,QUALITY_MUST_BE_CHANGE)
		
		
	return USEITEM_SUCCESS
	
end
