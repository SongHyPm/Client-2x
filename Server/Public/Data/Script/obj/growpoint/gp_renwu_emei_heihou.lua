--���� �i�m
--�ں�
--�ű���715023
--�ں�100%
--��c�p1

--ÿ�δ򿪱ض� ��t ���cto� � ��Ʒ
x715023_g_MainItemId = 40003032
--�����
x715023_g_MissionId = 1090

--���ɺ�����ʼ************************************************************************
--ÿc�iItemBox�����10c�i��Ʒ
function	x715023_OnCreate(sceneId,growPointType,x,y)
	--����ItemBoxͬʱ����m�t c�i��Ʒ
	ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x715023_g_MainItemId)	--ÿc�i���� �i�m������ �i�m��m�t c�i��Ʒ,����ֱ�ӷ���itembox��m�t c�i
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x715023_OnOpen(sceneId,selfId,targetId)
	local ret = CallScriptFunction(SHIMEN_MISSION_SCRIPT_ID, "IsCaiJiMission", sceneId,selfId,x715023_g_MissionId,x715023_g_MainItemId)
	if ret > 0 then
		return OR_OK
	else
		return OR_U_CANNT_DO_THIS_RIGHT_NOW
	end

end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	x715023_OnRecycle(sceneId,selfId,targetId)
	--Tr� v�1,���� �i�m����
	return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x715023_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x715023_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
