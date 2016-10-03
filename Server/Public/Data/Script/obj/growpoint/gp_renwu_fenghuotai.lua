--����
--���̨

-- scriptId = 715001
x715001_g_missionId = 552

function  x715001_OnCreate(sceneId,growPointType,x,y)
	ItemCount = 0-- ��Ʒ����
	ItemBoxId = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,ItemCount)	--��������
end

--Tr� v�����
-- 0 ��ʾ�򿪳ɹ�
--��ǰ
--T�i CONFIG/ABILITY.TXT�ļ���
function	 x715001_OnOpen(sceneId,selfId,targetId)
	if HaveItem(sceneId,selfId,40002070) <0 then
		BeginEvent(sceneId)
			strText = "C�n ������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_NOT_ENOUGH_ITEM
	end

	if HaveItem(sceneId,selfId,40002069) <0	then
		BeginEvent(sceneId)
			strText = "C�n �Ƿ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_NOT_ENOUGH_ITEM
	end
	
	return OR_OK
end

--����  (������3c�i�෴,Tr� v�1 ��ʾҪ����,����ng���� �i�m��ʧ,������ʹ��)
function	 x715001_OnRecycle(sceneId,selfId,targetId)
 	return 0;
end

--�򿪺�
function	x715001_OnProcOver(sceneId,selfId,targetId)
	
	local Ret1 = DelItem( sceneId, selfId, 40002069, 1 )
	local Ret2 = DelItem( sceneId, selfId, 40002070, 1 )
	
	if( Ret1 > 0 and Ret2 > 0 ) then
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x715001_g_missionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	BeginEvent(sceneId)
	  	strText = "�u�i theo H�c Phong(���)"
	  	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

    end
    
	return OR_OK
end

function x715001_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
