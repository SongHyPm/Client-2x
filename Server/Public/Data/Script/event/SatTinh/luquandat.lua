--Th�p nh� S�t Tinh
--L� Qu�n D�t
--Author: Ho�ng Steven

--******************--
x910105_g_ScriptId=910105
--******************--
x910105_g_Boss_Name="L� Qu�n D�t"																--T�n c�a BOSS
--******************--
x910105_g_Last_Time=1																			--Th�i gian l�n tr߾c ra k� n�ng
--******************--
x910105_g_Skill_Armor=1307																		--K� n�ng gi�m s�t th߽ng
x910105_g_Impact_Armor=9768																		--ID c�a hi�u �ng gi�m s�t th߽ng
x910105_g_Skill_Return_Attack=1308																--K� n�ng ph�n ��n
x910105_g_Impact_Return_Attack=9769																--ID c�a hi�u �ng ph�n ��n
x910105_g_Skill_Weak=1309																		--K� n�ng t� g�y suy y�u c�a Boss
x910105_g_Impact_Weak=9770																		--ID hi�u �ng t� g�y suy y�u c�a Boss
--******************--
x910105_g_Cool_Down=30000																		--Th�i gian l�nh kh߾c m�i l�n ra k� n�ng
--******************--
x910105_g_Impact_Prepare=9777																	--�ang v�n kh�
--******************--
x910105_g_Monster_Dialogue={																	--L�i n�i c�a Boss
	[1]="C�c ng߶i ch�n s�ng r�i hay sao m� d�m khi�u chi�n ta?",								--Boss khai chi�n
	[2]="Thi�n Cang B� Kh� ph� th�. D�m ��nh ta, c�c ng߶i t� t�m �߶ng ch�t r�i...",			--Boss nh�n hi�u �ng gi�m s�t th߽ng v� ph�n ��n
	[3]="Thi�n Nh�n Ng� Suy. Tr�ng th�i n�y tuy c� h�i b�t l�i cho ta nh�ng c�c ng߽i ��ng h�ng qua m�t ���c...",--Boss nh�n hi�u �ng Mi�n d�ch
	[4]=x910105_g_Boss_Name.." �� v�o chi�n �u!",												--Boss v�o chi�n �u
	[5]="Qu� nhi�n v� c�ng cao c߶ng, ch� ti�c l� do ta s� h�, l�n n�y c�c ng߽i may m�n th�ng r�i!",--Boss t� n�n
}
--******************--

--**********************************--
--*             On Init            *-- 
--**********************************--
function x910105_OnInit(sceneId,selfId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910105_g_Monster_Dialogue[1])								--C�u n�i khai chi�n c�a Boss
	x910105_GlobalNews(sceneId,x910105_g_Monster_Dialogue[4])									--Th�ng b�o Boss �� v�o chi�n �u cho to�n th� ng߶i ch�i
	x910105_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*         On Heart Beat          *--
--**********************************--
function x910105_OnHeartBeat(sceneId,selfId,nTick)												--H�m n�y s� check li�n t�c m�i mili gi�y khi n�o Boss c�n s�ng

	--******************--
	if LuaFnIsCharacterLiving(sceneId,selfId)~=1 then											--N�u Boss �� ch�t th� ng�ng ho�t �ng c�a Script
		return
	end
	--******************--
	local nCheck=x910105_CheckCondition(sceneId,selfId)											--Ki�m tra xem c� ng߶i ch�i n�o ��ng xung quanh boss kh�ng
	if nCheck==0 then
		x910105_ResetMyAI(sceneId,selfId)														--Set l�i c�c thu�c t�nh cho Boss
		return
	end
	--******************--
	local Last_Time=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910105_g_Last_Time)			--Th�i gian l�n tr߾c Boss b� m�t m�u b�i k� n�ng c�a Kh� Vinh ��i S�
	if Last_Time>0 then
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910105_g_Last_Time,Last_Time-nTick)		--C�p nh�t l�i th�i gian ra k� n�ng
		if Last_Time<=5000 and Last_Time>0 and LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910105_g_Impact_Prepare)<1 then--Ъn th�i gian v�n kh�
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910105_g_Impact_Prepare,0)	--B�t �u v�n kh�
		end
	elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910105_g_Impact_Prepare)<1 and Last_Time<=0 then
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910105_g_Last_Time,x910105_g_Cool_Down)	--Reset l�i th�i gian l�nh kh߾c
		local Ran=random(4)																		--Random v�i t� l� 75% ���c tr�ng th�i ph�n ��n, h� th� v� 25% b� h� nh��c
		if Ran==3 then
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910105_g_Impact_Weak,0)	--Boss ch�u hi�u �ng h� nh��c
			MonsterTalk(sceneId,selfId,"",x910105_g_Monster_Dialogue[3])						--Boss th�ng b�o b� h� nh��c
		else
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910105_g_Impact_Armor,0)--Boss nh�n hi�u �ng h� th�
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910105_g_Impact_Return_Attack,0)--Boss nh�n hi�u �ng ph�n ��n
			MonsterTalk(sceneId,selfId,"",x910105_g_Monster_Dialogue[2])						--Boss th�ng b�o nh�n ���c tr�ng th�i h� th� v� ph�n ��n
		end
	end
	--******************--

end
--**********************************--
--*        Check Condition         *--
--**********************************--
function x910105_CheckCondition(sceneId,selfId,enmeyId)

	--******************--
	local Pos_x,Pos_y=GetWorldPos(sceneId,selfId)												--L�y t�a � hi�n t�i c�a Boss
	local PlayerList={}
	local nHumanCount=LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId=LuaFnGetCopyScene_HumanObjId(sceneId,i)
		local x,y=GetWorldPos(sceneId,nHumanId)													--L�y t�a � hi�n t�i c�a ng߶i ch�i
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and floor(sqrt((Pos_x-x)*(Pos_x-x)+(Pos_y-y)*(Pos_y-y)))<=100 then						--N�u ng߶i ch�i v�n ��ng g�n Boss
			return 1
		end
	end
	--******************--
	return 0
	--******************--

end
--**********************************--
--*        On Enter Combat         *--
--**********************************--
function x910105_OnEnterCombat(sceneId,selfId,enmeyId)

	--******************--
	x910105_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*        On Leave Combat         *--
--**********************************--
function x910105_OnLeaveCombat(sceneId,selfId)

	--******************--
	x910105_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*       On Kill Character        *--
--**********************************--
function x910105_OnKillCharacter(sceneId,selfId,targetId)
	
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if nHumanId==targetId then
			local PlayerName=GetName(sceneId,targetId)
			MonsterTalk(sceneId,selfId,"","C�c h� l�m ta r�t th�t v�ng �� "..PlayerName.."...")	--Boss ch� di�u ng߶i ch�i b� gi�t
		end
	end
	--******************--
	
end
--**********************************--
--*             On Die             *--
--**********************************--
function x910105_OnDie(sceneId,selfId,killerId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910105_g_Monster_Dialogue[5])								--C�u n�i c�a Boss l�c ch�t
	--******************--
	local nBoss=LuaFnGetCopySceneData_Param(sceneId,22)											--Ki�m tra xem c� bao nhi�u Boss �ang chi�n �u
	LuaFnSetCopySceneData_Param(sceneId,22,nBoss-1)												--Gi�m s� Boss �ang chi�n �u xu�ng
	if nBoss-1==0 then
		LuaFnSetCopySceneData_Param(sceneId,16,30000)											--C�p nh�t th�i gian g�i Boss ti�p theo l� 30 gi�y
	end
	--******************--
	x910105_GiveAllHumanRank(sceneId,killerId)													--C�p nh�t rank cho ng߶i ch�i
	--******************--
	
end
--**********************************--
--*       Give All Human Rank      *--
--**********************************--
function x910105_GiveAllHumanRank(sceneId,killerId)

	--******************--
	local Team_Index=GetTeamId(sceneId,killerId)
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and GetTeamId(sceneId,nHumanId)==Team_Index then
			local Last_Time=GetMissionData(sceneId,nHumanId,SHENGSI_LUQUANDAT)
			SetMissionData(sceneId,nHumanId,SHENGSI_LUQUANDAT,Last_Time+1)						--C�p nh�t s� l�n th�ng Boss cho ng߶i ch�i
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng "..x910105_g_Boss_Name.." c�a c�c h� t�ng l�n "..(Last_Time+1).." l�n!")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end
--**********************************--
--*          Reset My AI           *--
--**********************************--
function x910105_ResetMyAI(sceneId,selfId)

	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910105_g_Last_Time,x910105_g_Cool_Down)		--Th�i gian l�nh kh߾c k� n�ng hi�u �ng
	--******************--
	
end
--**********************************--
--*           Global News          *--
--**********************************--
function x910105_GlobalNews(sceneId,Tips)

	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			BeginEvent(sceneId)
				AddText(sceneId,Tips)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end