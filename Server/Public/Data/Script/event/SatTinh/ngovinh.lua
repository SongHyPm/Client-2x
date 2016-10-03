--Th�p nh� S�t Tinh
--Ng� V�nh
--Author: Ho�ng Steven

--******************--
x910100_g_ScriptId=910100
--******************--
x910100_g_Boss_Name="Ng� V�nh"																	--T�n c�a BOSS
--******************--
x910100_g_Last_Time=1																			--Th�i gian l�n tr߾c g�i ph�c binh
x910100_g_Last_Color=2																			--M�u s�c ph�c binh (1~��, 2~V�ng, 3~T�m)
x910100_g_Last_Died=3																			--Ph�c binh l�n tr߾c �� ch�t
x910100_g_Last_Told=4																			--�� n�i sau khi ph�c binh l�n tr߾c ch�t ch�a
--******************--
x910100_g_Soldier_Index={
	[1]=13704,																					--H�ng s�c ph�c binh
	[2]=13704,																					--Ho�ng s�c ph�c binh
	[3]=13704																					--T� s�c ph�c binh
}
x910100_g_Soldier_Name={
	[1]="H�ng s�c ph�c binh",																	--H�ng s�c ph�c binh
	[2]="Ho�ng s�c ph�c binh",																	--Ho�ng s�c ph�c binh
	[3]="T� s�c ph�c binh"																		--T� s�c ph�c binh
}
--******************--
x910100_g_Impact_Immune=9759																	--Hi�u �ng mi�n d�ch
x910100_g_Impact_Lost_HP=9754																	--M�t m�u sau khi ti�u di�t ��ng ph�c binh
x910100_g_Impact_Prepair=9777																	--�ang v�n kh� chu�n b� tung chi�u
--******************--
x910100_g_Next_Time_Call=60000																	--Kho�ng c�ch 2 l�n g�i ph�c binh li�n ti�p
--******************--
x910100_g_Monster_Dialogue={																	--L�i n�i c�a Boss
	[1]="Ng�y n�y n�m sau s� l� ng�y d� c�a c�c ng߽i... Ъn c� ��y...",						--Boss m�i xu�t hi�n
	[2]="Ph�c binh nghe l�nh c�a ta... H�ng trang t� kh�a...",									--G�i ph�c binh ��
	[3]="Ph�c binh nghe l�nh c�a ta... Ho�ng l߽ng m� m�ng...",									--G�i ph�c binh v�ng
	[4]="Ph�c binh nghe l�nh c�a ta... T� kh� ��ng l�i...",										--G�i ph�c binh t�m
	[5]="C�c ng߽i �� gi�t ch�t ph�c binh c�a ta r�i...S� nh�c ta qu�...",						--Khi ph�c binh ch�t
	[6]=x910100_g_Boss_Name.." �� v�o chi�n �u!",												--Boss v�o chi�n �u
	[7]="Ta... Ta... D� c� ch�t ta c�ng kh�ng tha cho c�c ng߽i!",								--Boss t� n�n
}
--******************--

--**********************************--
--*             On Init            *-- 
--**********************************--
function x910100_OnInit(sceneId,selfId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910100_g_Monster_Dialogue[1])								--C�u n�i khai chi�n c�a Boss
	x910100_GlobalNews(sceneId,x910100_g_Monster_Dialogue[6])									--Th�ng b�o Boss �� v�o chi�n �u cho to�n th� ng߶i ch�i
	x910100_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--
	
end
--**********************************--
--*         On Heart Beat          *--
--**********************************--
function x910100_OnHeartBeat(sceneId,selfId,nTick)												--H�m n�y s� check li�n t�c m�i mili gi�y khi n�o Boss c�n s�ng

	--******************--
	if LuaFnIsCharacterLiving(sceneId,selfId)~=1 then											--N�u Boss �� ch�t th� ng�ng ho�t �ng c�a Script
		return
	end
	--******************--
	local nCheck=x910100_CheckCondition(sceneId,selfId)											--Ki�m tra xem c� ng߶i ch�i n�o ��ng xung quanh boss kh�ng
	if nCheck==0 then
		x910100_ResetMyAI(sceneId,selfId)														--Set l�i c�c thu�c t�nh cho Boss
		return
	end
	--******************--
	local nColor=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910100_g_Last_Color)				--L�y m�u s�c c�a ph�c binh
	if nColor==0 then
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Died,1)						--��nh d�u ph�c binh l�n tr߾c �� ch�t
	else
		if x910100_IsLastSoldierDied(sceneId,selfId)==1 then									--Ph�c binh l�n tr߾c �� ch�t
			MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Died,1)					--��nh d�u ph�c binh l�n tr߾c �� ch�t
		else
			MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Died,0)					--��nh d�u ph�c binh l�n tr߾c ch�a ch�t
		end
	end
	--******************--
	local Last_Died=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910100_g_Last_Died)			--Ki�m tra ph�c binh l�n tr߾c �� ch�t ch�a (0~Ch�a, 1~�� ch�t)
	if Last_Died==0 then																		--N�u ph�c binh ch�a ch�t th� kh�ng l�m g� n�a
		return
	end
	--******************--
	local Last_Time=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910100_g_Last_Time)			--L�y th�i gian tr߾c �� g�i ph�c binh
	if Last_Time<=0 then
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Time,x910100_g_Next_Time_Call)--Reset th�i gian g�i ph�c binh l�n t�i
	else
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Time,Last_Time-nTick)		--C�p nh�t l��t g�i ph�c binh t�i
	end
	--******************--
	local Last_Told=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910100_g_Last_Told)			--Boss �� n�i sau khi ph�c binh l�n tr߾c ch�t ch�a
	if Last_Told==0 and nColor>0 then															--N�u ph�c binh �� ch�t m� ch�a ���c th�ng b�o
		MonsterTalk(sceneId,selfId,"",x910100_g_Monster_Dialogue[5])							--Boss ph�n n�n ph�c binh �� ch�t
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Told,1)						--��nh d�u Boss �� n�i
		LuaFnCancelSpecificImpact(sceneId,selfId,x910100_g_Impact_Immune)						--X�a b� tr�ng th�i mi�n d�ch c�a Boss
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910100_g_Impact_Lost_HP,0)	--Boss b� gi�m 10% m�u
		x910100_DelSoldiersBeside(sceneId)														--Del c�c ph�c binh kh�c kh�ng li�n quan
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Time,x910100_g_Next_Time_Call+1)--Reset th�i gian g�i ph�c binh l�n t�i
	end
	--******************--
	if Last_Time-nTick<=5000 and Last_Time-nTick>4000 and LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,x910100_g_Impact_Prepair)<1 then--Ch�a v�n kh�
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910100_g_Impact_Prepair,0)	--V�n kh� chu�n b� g�i ph�c binh
	end
	--******************--
	if Last_Time==x910100_g_Next_Time_Call then													--N�u �� qua 1 ph�t
		local x,y=GetWorldPos(sceneId,selfId)													--L�y t�a � c�a Boss
		x910100_CallSoldiers(sceneId,selfId,x,y)												--G�i ph�c binh xung quanh Boss
		local Talk_Index=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910100_g_Last_Color)		--L�y m�u s�c c�a ph�c binh ch�nh l� ch� s� t߽ng �ng trong l�i n�i c�a Boss
		MonsterTalk(sceneId,selfId,"",x910100_g_Monster_Dialogue[Talk_Index+1])					--C�u g�i ph�c binh c�a Boss
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Told,0)						--Ch�a th�ng b�o
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x910100_g_Impact_Immune,0)	--Boss ���c mi�n d�ch
	end
	--******************--

end
--**********************************--
--*        Check Condition         *--
--**********************************--
function x910100_CheckCondition(sceneId,selfId,enmeyId)

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
function x910100_OnEnterCombat(sceneId,selfId,enmeyId)

	--******************--
	x910100_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*        On Leave Combat         *--
--**********************************--
function x910100_OnLeaveCombat(sceneId,selfId)

	--******************--
	x910100_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	x910100_DelSoldiersBeside(sceneId)															--X�a c�c ph�c binh c�
	--******************--

end
--**********************************--
--*       On Kill Character        *--
--**********************************--
function x910100_OnKillCharacter(sceneId,selfId,targetId)
	
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if nHumanId==targetId then
			local PlayerName=GetName(sceneId,targetId)
			MonsterTalk(sceneId,selfId,"","Ha ha... "..PlayerName..", ng߽i �� t� n�n r�i, t�n n�o s� l� n�n nh�n ti�p theo ��y... Ha ha...!")	--Boss ch� di�u ng߶i ch�i b� gi�t
		end
	end
	--******************--
	
end
--**********************************--
--*             On Die             *--
--**********************************--
function x910100_OnDie(sceneId,selfId,killerId)

	--******************--
	MonsterTalk(sceneId,selfId,"",x910100_g_Monster_Dialogue[7])								--C�u n�i c�a Boss l�c ch�t
	--******************--
	x910100_DelSoldiersBeside(sceneId)															--X�a c�c ph�c binh
	--******************--
	local nBoss=LuaFnGetCopySceneData_Param(sceneId,22)											--Ki�m tra xem c� bao nhi�u Boss �ang chi�n �u
	LuaFnSetCopySceneData_Param(sceneId,22,nBoss-1)												--Gi�m s� Boss �ang chi�n �u xu�ng
	if nBoss-1==0 then
		LuaFnSetCopySceneData_Param(sceneId,16,30000)											--C�p nh�t th�i gian g�i Boss ti�p theo l� 30 gi�y
	end
	--******************--
	x910100_GiveAllHumanRank(sceneId,killerId)													--C�p nh�t rank cho ng߶i ch�i
	--******************--
	
end
--**********************************--
--*       Give All Human Rank      *--
--**********************************--
function x910100_GiveAllHumanRank(sceneId,killerId)

	--******************--
	local Team_Index=GetTeamId(sceneId,killerId)
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and GetTeamId(sceneId,nHumanId)==Team_Index then
			local Last_Time=GetMissionData(sceneId,nHumanId,SHENGSI_NGOVINH)
			SetMissionData(sceneId,nHumanId,SHENGSI_NGOVINH,Last_Time+1)						--C�p nh�t s� l�n th�ng Boss cho ng߶i ch�i
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng "..x910100_g_Boss_Name.." c�a c�c h� t�ng l�n "..(Last_Time+1).." l�n!")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end
--**********************************--
--*          Reset My AI           *--
--**********************************--
function x910100_ResetMyAI(sceneId,selfId)

	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Time,x910100_g_Next_Time_Call+1)	--Kh�i t�o th�i gian ra ph�c binh tr� v� th�i gian xu�t hi�n Boss
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Color,0)							--Kh�i t�o m�u s�c v�a ra l� 0
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Told,0)							--�� n�i sau khi ph�c binh binh l�n tr߾c ch�t
	--******************--
	
end
--**********************************--
--*      Is Last Soldier Died      *--
--**********************************--
function x910100_IsLastSoldierDied(sceneId,selfId)

	--******************--
	local nMonsterNum=GetMonsterCount(sceneId)
	local nColor=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910100_g_Last_Color)				--L�y m�u s�c c�a ph�c binh
	for i=0,nMonsterNum-1 do
		local MonsterId=GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId,MonsterId)==1 and (GetName(sceneId,MonsterId)==x910100_g_Soldier_Name[nColor]) then	--N�u ph�c binh m�c ti�u �� ch�t
			return 0
		end
	end
	--******************--
	return 1
	--******************--

end
--**********************************--
--*       Del Soldiers Beside      *--
--**********************************--
function x910100_DelSoldiersBeside(sceneId)

	--******************--
	local nMonsterNum=GetMonsterCount(sceneId)
	for i=0,nMonsterNum-1 do
		local MonsterId=GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId,MonsterId)==1 and (GetName(sceneId,MonsterId)==x910100_g_Soldier_Name[1] or GetName(sceneId,MonsterId)==x910100_g_Soldier_Name[2] or GetName(sceneId,MonsterId)==x910100_g_Soldier_Name[3]) then	--N�u ph�c binh m�c ti�u �� ch�t
			SetCharacterDieTime(sceneId,MonsterId,100)
		end
	end
	--******************--

end
--**********************************--
--*          Call Soldiers         *--
--**********************************--
function x910100_CallSoldiers(sceneId,selfId,Boss_X,Boss_Y)

	--******************--
	local My_Level=GetLevel(sceneId,selfId)												--L�y level c�a Boss
	local nDec
	if My_Level>=80 and My_Level<90 then
		nDec=0
	elseif My_Level>=90 and My_Level<100 then
		nDec=1
	elseif My_Level>=100 and My_Level<110 then
		nDec=2
	elseif My_Level>=110 and My_Level<120 then
		nDec=3
	else
		nDec=4
	end
	--******************--
	local x,y
	local ran=random(3)																	--Ph�c binh ng�u nhi�n s� ���c ch�n l�m �i�m y�u c�a Boss
	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910100_g_Last_Color,ran)				--��nh d�u m�u s�c ph�c binh y�u �i�m c�a Boss
	--******************--
	x=Boss_X+random(2)-random(2)														--Ng�u nhi�n t�a � c�a ph�c binh xung quanh Boss
	y=Boss_Y+random(2)-random(2)
	local MonsterID=LuaFnCreateMonster(sceneId,x910100_g_Soldier_Index[1]+nDec,x,y,27,1,-1)	--G�i ph�c binh m�u ��
	SetCharacterName(sceneId,MonsterID,x910100_g_Soldier_Name[1])						--Set t�n cho ph�c binh
	--******************--
	x=Boss_X+random(2)-random(2)														--Ng�u nhi�n t�a � c�a ph�c binh xung quanh Boss
	y=Boss_Y+random(2)-random(2)
	local MonsterID=LuaFnCreateMonster(sceneId,x910100_g_Soldier_Index[2]+nDec,x,y,27,1,-1)	--G�i ph�c binh m�u v�ng
	SetCharacterName(sceneId,MonsterID,x910100_g_Soldier_Name[2])						--Set t�n cho ph�c binh
	--******************--
	x=Boss_X+random(2)-random(2)														--Ng�u nhi�n t�a � c�a ph�c binh xung quanh Boss
	y=Boss_Y+random(2)-random(2)
	local MonsterID=LuaFnCreateMonster(sceneId,x910100_g_Soldier_Index[3]+nDec,x,y,27,1,-1)	--G�i ph�c binh m�u t�m
	SetCharacterName(sceneId,MonsterID,x910100_g_Soldier_Name[3])						--Set t�n cho ph�c binh
	--******************--

end
--**********************************--
--*           Global News          *--
--**********************************--
function x910100_GlobalNews(sceneId,Tips)

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