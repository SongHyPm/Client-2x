--��翷帱��....   ____������ By��403413393 �޸�

--�ű���
x893063_g_ScriptId = 893063

x893063_g_CopySceneType = FUBEN_SIJUEZHUANG	--�������ͣ�������ScriptGlobal.lua����

x893063_g_TickTime		= 1				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x893063_g_NoUserTime	= 10			--������û���˺���Լ��������ʱ�䣨��λ���룩
x893063_g_Fuben_X			= 100			--���븱����λ��X
x893063_g_Fuben_Z			= 114			--���븱����λ��Z
x893063_g_FuBenTime		= 3*60*60	--�����ر�ʱ��....
x893063_g_LimitMembers = 3

--BOSS��....
x893063_g_BOSSList =
{
	["MinMo_NPC"]				= { DataID=14100, Title="", posX=96, posY=79, Dir=0, BaseAI=3, AIScript=0, ScriptID=893070 },
	["MinMo_BOSS"]				= { DataID=14106, Title="", posX=96, posY=79, Dir=0, BaseAI=27, AIScript=0, ScriptID=893064 },

	["QinYun_NPC"]		= { DataID=14100, Title="", posX=83, posY=23, Dir=0, BaseAI=3, AIScript=0, ScriptID=893071 },
	["QinYun_BOSS"]		= { DataID=14132, Title="", posX=83, posY=23, Dir=0, BaseAI=27, AIScript=0, ScriptID=893065 },
	["JiangShi_BOSS"]			= { DataID=14138, Title="", posX=0, posY=0, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },

	["TaoQin_NPC"]				= { DataID=14100, Title="", posX=36, posY=87, Dir=11, BaseAI=3, AIScript=0, ScriptID=893072 },
	["TaoQinLoss_NPC"]		= { DataID=14100, Title="", posX=22, posY=16, Dir=0, BaseAI=3, AIScript=0, ScriptID=893075 },
	["TaoQin_BOSS"]			= { DataID=14125, Title="", posX=36, posY=87, Dir=11, BaseAI=27, AIScript=0, ScriptID=893066 },

	["YaoBoDang_BOSS"]		= { DataID=42130, Title="", posX=129, posY=108, Dir=0, BaseAI=27, AIScript=0, ScriptID=893067 },
	["SiMaLing_BOSS"]	= { DataID=42131, Title="", posX=131, posY=109, Dir=0, BaseAI=27, AIScript=0, ScriptID=893068 },

	["YouDanZhi_BOSS"]		= { DataID=42132, Title="", posX=129, posY=126, Dir=0, BaseAI=0, AIScript=0, ScriptID=893074 },

	["LiFan_NPC"]				= { DataID=14100, Title="", posX=22, posY=16, Dir=27, BaseAI=3, AIScript=0, ScriptID=893075 },

	["PangQi_BOSS"]		= { DataID=14145, Title="", posX=22, posY=16, Dir=27, BaseAI=27, AIScript=0, ScriptID=893069 },

	["Panqinqin_NPC"]				= { DataID=60, Title="", posX=101, posY=111, Dir=0, BaseAI=3, AIScript=0, ScriptID=893080 },
	["Zhong_NPC"]				= { DataID=14119, Title="Chu�ng L�n", posX=100, posY=82, Dir=0, BaseAI=3, AIScript=0, ScriptID=893081 },
	["HuiYinFan_BOSS"]			= { DataID=14126, Title="", posX=0, posY=0, Dir=0, BaseAI=3, AIScript=0, ScriptID=-1 },
	["Jin_BOSS"]			= { DataID=14147, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["Mu_BOSS"]			= { DataID=14148, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["Shui_BOSS"]			= { DataID=14149, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["Huo_BOSS"]			= { DataID=14140, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["Tu_BOSS"]			= { DataID=14150, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },

}

x893063_g_FightBOSSList =
{
	[1] = x893063_g_BOSSList["MinMo_BOSS"].DataID,
	[2] = x893063_g_BOSSList["QinYun_BOSS"].DataID,
	[3] = x893063_g_BOSSList["TaoQin_BOSS"].DataID,
	[4] = x893063_g_BOSSList["YaoBoDang_BOSS"].DataID,
	[5] = x893063_g_BOSSList["SiMaLing_BOSS"].DataID,
	[6] = x893063_g_BOSSList["PangQi_BOSS"].DataID
}

--�Ƿ������սĳ��BOSS�ı���б�....
x893063_g_BattleFlagTbl = 
{
	["MinMo"]			= 8,	--�Ƿ������ս�����...
	["QinYun"]	= 9,	--�Ƿ������սɣ����....
	["TaoQin"]			= 10,	--�Ƿ������ս���ϴ�....
	["ShuangZi"]		= 11,	--�Ƿ������ս˫��....
	["PangQi"]		= 12,	--�Ƿ������ս����ˮ....
}

--������������....�Ƿ������սĳ��BOSS�ı��....
-- 0=������ս 1=������ս 2=�Ѿ���ս����
x893063_g_IDX_BattleFlag_MinMo			= 8
x893063_g_IDX_BattleFlag_QinYun	= 9
x893063_g_IDX_BattleFlag_TaoQin		= 10
x893063_g_IDX_BattleFlag_Shuangzi		= 11
x893063_g_IDX_BattleFlag_PangQi	= 12

x893063_g_IDX_FuBenOpenTime		= 13	--����������ʱ��....
x893063_g_IDX_FuBenLifeStep		= 14	--���������ڵ�step....(��������NPC....�رյ���ʱ��ʾ....)

--������������....ͨ�õ���翷��ʱ��....��Ҫ���ڼ���BOSSս��....
x893063_g_IDX_SJZTimerStep			= 15
x893063_g_IDX_SJZTimerScriptID	= 16

--������������....���ϴ������ļ�ʱ��....���ڴ��������߼�....
x893063_g_IDX_TaoQinDieStep				= 17
x893063_g_IDX_TaoQinDieScriptID		= 18
x893063_g_IDX_TaoQinDiePosX				=	19
x893063_g_IDX_TaoQinDiePosY				=	20


--**********************************
--������ں���....
--**********************************
function x893063_OnDefaultEvent( sceneId, selfId, targetId )

	--����Ƿ���Խ��븱��....
	local ret, msg = x893063_CheckCanEnter( sceneId, selfId, targetId )
	if 1 ~= ret then
		BeginEvent(sceneId)
			AddText(sceneId,msg)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�ر�NPC�Ի�����....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	x893063_MakeCopyScene( sceneId, selfId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#gffff00"..nam.."#gff00f0 c�ng t� �i �� ti�n v�o T� Tuy�t Trang, chu�n b� ti�u di�t t�n c�ng hung c�c �c B�ng X�, kh�i l�i �n o�n T� Tuy�t Trang n�m n�o...", 4 )

end

--**********************************
--�о��¼�
--**********************************
function x893063_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x893063_g_ScriptId, "#cFF0000�n o�n T� Tuy�t Trang", 10, 1 )

end

--**********************************
--����Ƿ���Խ���˸���....
--**********************************
function x893063_CheckCanEnter( sceneId, selfId, targetId )

	--�Ƿ��ж���....
	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "#{PMF_20080521_02}"
	end

	--�ǲ��Ƕӳ�....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "#{PMF_20080521_03}"
	end

	--�����Ƿ�....
	if GetTeamSize(sceneId,selfId) < 1 then
		return 0, "#{PMF_20080521_04}"
	end

	--�Ƿ��ڸ���....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "#{PMF_20080521_05}"
	end

	local Humanlist = {}
	local nHumanNum = 0

	--�Ƿ����˲���90��....
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if GetLevel( sceneId, PlayerId ) < 70 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end
	
	--����ﵽ����Ҫ��?
 	local teamSize = GetTeamSize(sceneId, selfId);
 	if teamSize < x893063_g_LimitMembers then
		return 0, "#{LLXB_8815_12}";		
 	end

	if nHumanNum > 0 then

		local msg = "Trong �i ng� "
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. ", "
		end
		msg = msg .. Humanlist[nHumanNum-1] .. " c�p � kh�ng ��, kh�ng th� ti�n v�o."
		return 0, msg

	end


	--�Ƿ����˽�������3����....
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_SPRING07DENGMI_DAYTIME )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )
	
		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 90 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end

	end

	if nHumanNum > 0 then

		local msg = ""
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. ", "
		end
		msg = msg .. Humanlist[nHumanNum-1] .. " ng�y h�m nay �� tham gia ph� b�n 3 l�n r�i."
		return 0, msg

	end

	return 1

end

--**********************************
--��������....
--**********************************
function x893063_MakeCopyScene( sceneId, selfId )

	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "sijuezhuang.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x893063_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x893063_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x893063_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x893063_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_BattleFlag_MinMo, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_BattleFlag_QinYun, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_BattleFlag_TaoQin, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_BattleFlag_Shuangzi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_BattleFlag_PangQi, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "sijuezhuang_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "sijuezhuang_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D�ch chuy�n th�nh c�ng");
		else
			AddText(sceneId,"S� l��ng b�n sao �� qu� t�i, h�y ��i m�t ch�t.");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--�����¼�....
--**********************************
function x893063_OnCopySceneReady( sceneId, destsceneId )

	--���븱���Ĺ���
	-- 1�����������û����ӣ��ʹ����������Լ����븱��
	-- 2, �������ж��飬������Ҳ��Ƕӳ����ʹ����Լ����븱��
	-- 3���������ж��飬�����������Ƕӳ����ʹ����Լ��͸�������һ���ȥ

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local CurDayTime = GetDayTime()
	for	i=0,nearteammembercount-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_SPRING07DENGMI_DAYTIME )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )

		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 3 then
			BeginEvent( sceneId )
				AddText( sceneId, "C�c h� h�m nay �� tham gia ph� b�n 3 l�n r�i, mai h�y quay l�i!" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		return
		end
	end


	--ͳ�ƴ�����������....
	--AuditSJZCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x893063_g_Fuben_X, x893063_g_Fuben_Z) ;
	else
		local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
			NewWorld( sceneId, mems[i], destsceneId, x893063_g_Fuben_X, x893063_g_Fuben_Z)
		end
	end

end

--**********************************
--����������ʱ���¼�....
--**********************************
function x893063_OnCopySceneTimer( sceneId, nowTime )

	x893063_TickFubenLife( sceneId, nowTime )

	x893063_TickSJZTimer( sceneId, nowTime )

	x893063_TickTaoQinDieTimer( sceneId, nowTime )

	x893063_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--����ҽ��븱���¼�....
--**********************************
function x893063_OnPlayerEnter( sceneId, selfId )

	--���������¼�....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x893063_g_Fuben_X, x893063_g_Fuben_Z )

	--������ս��һ����翷�....
	local lastTime = GetMissionData( sceneId, selfId, MD_SPRING07DENGMI_DAYTIME )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_SPRING07DENGMI_DAYTIME, lastTime )

end

--**********************************
--������ڸ����������¼�....
--**********************************
function x893063_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--��ʾ���и��������....
--**********************************
function x893063_TipAllHuman( sceneId, Str )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end

end

--**********************************
--Tick����������....
--**********************************
function x893063_TickFubenLife( sceneId, nowTime )

	local openTime = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x893063_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep )

	if lifeStep == 15 then

		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 16 )

		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		local oldSceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )
		local oldX = LuaFnGetCopySceneData_Param( sceneId, 4 )
		local oldZ = LuaFnGetCopySceneData_Param( sceneId, 5 )
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
				NewWorld( sceneId, PlayerId, oldSceneId, oldX, oldZ )
			end
		end

		return

	end

	if lifeStep == 14 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 15 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 1 gi�y!" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 14 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 2 gi�y!" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 13 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 3 gi�y!" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 12 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 4 gi�y!" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 11 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 5 gi�y!" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 10 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 10 gi�y!" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 9 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 30 gi�y!" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 8 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 1 ph�t!" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 7 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 2 ph�t!" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 6 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 3 ph�t!" )
		return
	end

	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 5 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 5 ph�t!" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 4 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 15 ph�t!" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 3 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 30 ph�t!" )
		return
	end

	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 2 )
		x893063_TipAllHuman( sceneId, "C�c h� s� r�i kh�i ��y sau 60 ph�t!" )
		return
	end

	--��ʼ�������ڵ�NPC....
	if lifeStep == 0 then

		local MstId = x893063_CreateBOSS( sceneId, "MinMo_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x893063_CreateBOSS( sceneId, "QinYun_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x893063_CreateBOSS( sceneId, "TaoQin_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x893063_CreateBOSS( sceneId, "LiFan_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x893063_CreateBOSS( sceneId, "Panqinqin_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x893063_CreateBOSS( sceneId, "Zhong_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 1 )

		return
	end

end

--**********************************
--Tick��翷��ʱ��....
--**********************************
function x893063_TickSJZTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep )
	if step <= 0 then
		return
	end
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerScriptID )

	--�ص�ָ���ű���OnTimer....
	CallScriptFunction( scriptID, "OnSJZTimer", sceneId, step )

	--����Ѿ���������step��رռ�ʱ��....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep, step )
	end

end

--**********************************
--������翷��ʱ��....
--**********************************
function x893063_OpenSJZTimer( sceneId, allstep, ScriptID )

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerScriptID, ScriptID )

end

--**********************************
--��ǰ��翷��ʱ���Ƿ񼤻�....
--**********************************
function x893063_IsSJZTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--Tick���ϴ�������ʱ��....
--**********************************
function x893063_TickTaoQinDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosY )

	--�ص�ָ���ű���OnTimer....
	CallScriptFunction( scriptID, "OnMinMoDieTimer", sceneId, step, posX, posY )

	--����Ѿ���������step��رռ�ʱ��....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieStep, step )
	end

end

--**********************************
--�������ϴ�������ʱ��....
--**********************************
function x893063_OpenTaoQinDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosY, posY )

end

--**********************************
--Tick��������....
--ֻҪ���վ�ڳ������6��������....ÿ�붼�ܻ��һ�����߽����buff....
--**********************************
function x893063_TickJianWuArea( sceneId, nowTime )
	local nMonsterNum = GetMonsterCount( sceneId )
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId, i)
		if GetName(sceneId, MonsterId) == "B�ng X�" then

			local x,z = GetWorldPos( sceneId, MonsterId )
			local buff1 = -1
			local buff2 = -1

			if x>=38 and x<=42 and z>=22 and z<=27 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22446) == 1 then
					buff1 = 22446
					buff2 = 22451
                            end
			elseif x>=37 and x<=41 and z>=34 and z<=38 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22447) == 1 then
					buff1 = 22447
					buff2 = 22452
                            end
			elseif x>=18 and x<=23 and z>=35 and z<=39 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22448) == 1 then
					buff1 = 22448
					buff2 = 22453
                            end
			elseif x>=16 and x<=21 and z>=23 and z<=27 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22449) == 1 then
					buff1 = 22449
					buff2 = 22454
                            end
			elseif x>=27 and x<=32 and z>=15 and z<=20 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22450) == 1 then
					buff1 = 22450
					buff2 = 22455
                            end
			end

			if buff1 ~= -1 then
				LuaFnCancelSpecificImpact(sceneId, MonsterId, buff1)
				LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, buff2, 0)
			end

		end
	end

end

--**********************************
--����ָ��BOSS....
--**********************************
function x893063_CreateBOSS( sceneId, name, x, y )

	local BOSSData = x893063_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local posX = 0
	local posY = 0
	if x ~= -1 and y ~= -1 then
		posX = x
		posY = y
	else
		posX = BOSSData.posX
		posY = BOSSData.posY
	end

	local MstId = LuaFnCreateMonster( sceneId, BOSSData.DataID, posX, posY, BOSSData.BaseAI, BOSSData.AIScript, BOSSData.ScriptID )
	--SetUnitReputationID(sceneId, selfId, nMonsterId, 29)   --by yaya
	SetUnitCampID(sceneId, MstId, MstId, 110)

	--SetObjDir( sceneId, MstId, BOSSData.Dir )
	SetMonsterFightWithNpcFlag( sceneId, MstId, 0 )
	if BOSSData.Title ~= "" then
		SetCharacterTitle(sceneId, MstId, BOSSData.Title)
	end

	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)

	--ͳ�ƴ���BOSS....
	--AuditSJZCreateBoss( sceneId, BOSSData.DataID )

	return MstId

end

--**********************************
--ɾ��ָ��BOSS....
--**********************************
function x893063_DeleteBOSS( sceneId, name )

	local BOSSData = x893063_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			--LuaFnDeleteMonster( sceneId, MonsterId )
			LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			SetCharacterDieTime( sceneId, MonsterId, 1000 )
		end
	end

end

--**********************************
--Ѱ��ָ��BOSS....
--**********************************
function x893063_FindBOSS( sceneId, name )

	local BOSSData = x893063_g_BOSSList[name]
	if not BOSSData then
		return -1
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			return MonsterId
		end
	end

	return -1

end

--**********************************
--��⵱ǰ�Ƿ��Ѿ�����һ��BOSS��....
--**********************************
function x893063_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local DataID = GetMonsterDataID( sceneId, MonsterId )
			for j, dataId in x893063_g_FightBOSSList do
				if DataID == dataId then
					BossList[nBossNum] = GetName( sceneId, MonsterId )
					nBossNum = nBossNum + 1
				end
			end
		end
	end

	if nBossNum > 0 then
		local msg = "�ang c�ng "
		for i=0, nBossNum-2 do
			msg = msg .. BossList[i] .. ", "
		end
		msg = msg .. BossList[nBossNum-1] .. " huy�t chi�n t�i T� Tuy�t Trang"
		return 1, msg
	end

	return 0, ""

end

--**********************************
--��ȡ�Ƿ������սĳ��BOSS�ı��....
--**********************************
function x893063_GetBossBattleFlag( sceneId, bossName )

	local idx = x893063_g_BattleFlagTbl[ bossName ]
	return LuaFnGetCopySceneData_Param( sceneId, idx )

end

--**********************************
--�����Ƿ������սĳ��BOSS�ı��....
--**********************************
function x893063_SetBossBattleFlag( sceneId, bossName, bCan )

	local idx = x893063_g_BattleFlagTbl[ bossName ]
	LuaFnSetCopySceneData_Param( sceneId, idx, bCan )

end
