--���� �i�m Thanh Long th�ch
--��ս����
--�ű���710015
----��c�p1

--ÿ�δ򿪱ض� ��t ���cto� � ��Ʒ
x710015_g_MainItemId = 30900051
----�����
--x710015_g_MissionId = 1070

--���ɺ�����ʼ************************************************************************
--ÿc�iItemBox�����10c�i��Ʒ
function	x710015_OnCreate(sceneId,growPointType,x,y)
	
	--����ItemBoxͬʱ����m�t c�i��Ʒ
	local targetId = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x710015_g_MainItemId)	--ÿc�i���� �i�m������ �i�m��m�t c�i��Ʒ,����ֱ�ӷ���itembox��m�t c�i
	
	local rand = random(1,100)
	if rand >= 70 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710015_g_MainItemId)
	end
	
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x710015_OnOpen(sceneId,selfId,targetId)
--	local ret = CallScriptFunction(SHIMEN_MISSION_SCRIPT_ID, "IsCaiJiMission", sceneId,selfId,x710015_g_MissionId,x710015_g_MainItemId)
	if CallScriptFunction(402047, "HaveTankBuff", sceneId, selfId) ~= 0 then
		return OR_U_CANNT_DO_THIS_RIGHT_NOW
	else
		return OR_OK
	end
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	x710015_OnRecycle(sceneId,selfId,targetId)
	--Tr� v�1,���� �i�m����
	return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710015_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x710015_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
