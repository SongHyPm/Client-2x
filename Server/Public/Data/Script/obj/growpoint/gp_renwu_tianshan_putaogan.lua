--���� �i�m
--���Ѹ�
--�ű���715028
--���Ѹ�100%
--��c�p1

--ÿ�δ򿪱ض� ��t ���cto� � ��Ʒ
x715028_g_MainItemId = 40003042
--�����
x715028_g_MissionId = 1100

--���ɺ�����ʼ************************************************************************
--ÿc�iItemBox�����10c�i��Ʒ
function	x715028_OnCreate(sceneId,growPointType,x,y)
	--����ItemBoxͬʱ����m�t c�i��Ʒ
	ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x715028_g_MainItemId)	--ÿc�i���� �i�m������ �i�m��m�t c�i��Ʒ,����ֱ�ӷ���itembox��m�t c�i
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x715028_OnOpen(sceneId,selfId,targetId)
	local ret = CallScriptFunction(SHIMEN_MISSION_SCRIPT_ID, "IsCaiJiMission", sceneId,selfId,x715028_g_MissionId,x715028_g_MainItemId)
	if ret > 0 then
		return OR_OK
	else
		return OR_U_CANNT_DO_THIS_RIGHT_NOW
	end
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	x715028_OnRecycle(sceneId,selfId,targetId)
	--Tr� v�1,���� �i�m����
	return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x715028_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x715028_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
