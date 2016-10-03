--Th�p nh� S�t Tinh
--C�ng T�n Th�nh
--Author: Ho�ng Steven

--******************--
x910102_g_ScriptId=910102
--******************--
x910102_g_Boss_Name="C�ng T�n Th�nh"															--T�n c�a BOSS
--******************--
x910102_g_Next_Time_Call_Avarta=1																--Th�i gian g�i b�n sao m�i
x910102_g_Next_Time_Use_Skill_1=2																--Th�i gian t�i s� d�ng k� n�ng s� 1
x910102_g_Next_Time_Use_Skill_2=3																--Th�i gian t�i s� d�ng k� n�ng s� 2
x910102_g_Next_Time_Use_Skill_3=4																--Th�i gian t�i s� d�ng k� n�ng s� 3
--******************--
x910102_g_Recall_Time=30000																		--N�u ti�u di�t 1 b�n sao th� sau th�i gian n�y b�n c�n l�i s� t� ph�n th�n ti�p
--******************--
x910102_g_Avarta_Index=13713																	--ID c�a b�n sao
--******************--
x910102_g_Skill_Avarta=1321																		--Ph�n th�n ph�
--******************--
x910102_g_Skill_1=1322																			--иnh th�n ph�
x910102_g_Skill_1_CD=20000																		--Th�i gian gi�n c�ch k� n�ng иnh th�n ph�
x910102_g_Skill_1_Impact=9751																	--Hi�u �ng иnh th�n ph�
x910102_g_Skill_2=1323																			--Phong huy�t ph�
x910102_g_Skill_2_CD=25000																		--Th�i gian gi�n c�ch k� n�ng Phong huy�t ph�
x910102_g_Skill_2_Impact=9752																	--Hi�u �ng Phong huy�t ph�
x910102_g_Skill_3=1324																			--H�n th�y ph�
x910102_g_Skill_3_CD=40000																		--Th�i gian gi�n c�ch k� n�ng H�n th�y ph�
x910102_g_Skill_3_Impact=9750																	--Hi�u �ng H�n th�y ph�
--******************--
x910102_g_Monster_Dialogue={																	--L�i n�i c�a Boss
	[1]="M�y t�n ��ng gh�t n�y. L�o phu kh�ng d�y c�c ng߽i m�t b�i h�c th� kh�ng xong...",		--Boss m�i xu�t hi�n
	[2]="Ha ha... C�c ng߽i tr�ng k� c�a l�o phu r�i. Mu�n gi�t ta �. D� th� sao... Ha ha...",	--Tri�u t�p Ph�n th�n
	[3]=x910102_g_Boss_Name.." �� v�o chi�n �u!",												--Boss v�o chi�n �u
	[4]="L� c�c ng߽i s� b� tr�i tru �t di�t, ch�t kh�ng to�n th�y...!",						--Boss t� n�n
	[5]="L� c�c ng߽i ngh� ta d� ch�t th� sao... Ha ha... L�o phu ��y n�y...!",					--Boss n�i khi b�n sao v�n c�n s�ng
	[6]="%s, v�i c�i иnh Th�n Ph� n�y, ng߽i n�n ��ng �� ch� ch�t �i, ��ng h�ng ch�y!",		--Boss n�i khi ng߶i ch�i d�nh иnh Th�n Ph�
	[7]="%s, v�i c�i Phong Huy�t Ph� n�y, ng߽i ��ng h�ng ch�y tho�t kh�i tay l�o phu!",		--Boss n�i khi ng߶i ch�i d�nh Phong Huy�t Ph�
	[8]="%s, ng� �i n�o... Ь l�o phu ru ng߽i ng� nh�!",										--Boss n�i khi ng߶i ch�i d�nh H�n Th�y Ph�
}
--******************--

--**********************************--
--*             On Init            *-- 
--**********************************--
function x910102_OnInit(sceneId,selfId)

	--******************--
	x910102_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	local Current_Hitpoint=GetHp(sceneId,selfId)												--Hp hi�n t�i c�a Boss
	local Total_Hitpoint=GetMaxHp(sceneId,selfId)												--Hp th��ng h�n c�a Boss
	if Current_Hitpoint~=Total_Hitpoint then													--��y l� ph�n th�n m�i ���c g�i ra
		return
	end
	--******************--
	MonsterTalk(sceneId,selfId,"",x910102_g_Monster_Dialogue[1])								--C�u n�i khai chi�n c�a Boss
	x910102_GlobalNews(sceneId,x910102_g_Monster_Dialogue[3])									--Th�ng b�o Boss �� v�o chi�n �u cho to�n th� ng߶i ch�i
	--******************--

end
--**********************************--
--*         On Heart Beat          *--
--**********************************--
function x910102_OnHeartBeat(sceneId,selfId,nTick)												--H�m n�y s� check li�n t�c m�i mili gi�y khi n�o Boss c�n s�ng

	--******************--
	if LuaFnIsCharacterLiving(sceneId,selfId)~=1 then											--N�u Boss �� ch�t th� ng�ng ho�t �ng c�a Script
		return
	end
	--******************--
	local nCheck=x910102_CheckCondition(sceneId,selfId)											--Ki�m tra xem c� ng߶i ch�i n�o ��ng xung quanh boss kh�ng, n�u kh�ng c�n th� Boss t� reset
	if nCheck==0 then
		x910102_ResetMyAI(sceneId,selfId)														--Set l�i c�c thu�c t�nh cho Boss
		x910102_DeleteMyAvarta(sceneId)															--X�a b�n sao
		return
	end
	--******************--
	x910102_UseMySkills(sceneId,selfId,nTick)													--Boss s� d�ng c�c k� n�ng
	--******************--
	local Recall_Time=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Call_Avarta)--Th�i gian g�i b�n sao
	if Recall_Time~=99999999 and Recall_Time>0 then
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Call_Avarta,Recall_Time-nTick)--C�p nh�t th�i gian t�o b�n sao
	end
	--******************--
	local nBoss=x910102_CheckMyAvarta(sceneId)													--Ъm s� b�n sao c�a Boss
	if nBoss>=2 then
		return
	end
	--******************--
	local Current_Hitpoint=GetHp(sceneId,selfId)												--Hp hi�n t�i c�a Boss
	local Total_Hitpoint=GetMaxHp(sceneId,selfId)												--Hp th��ng h�n c�a Boss
	local Recall_Time=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Call_Avarta)--Th�i gian g�i b�n sao
	if Current_Hitpoint/Total_Hitpoint<=0.5 and (Recall_Time<=0 or Recall_Time==99999999) then	--Boss �� m�t n�a �ng m�u ho�c gi�t ch�t 1 b�n sao nh�ng sau m�t kho�ng th�i gian kh�ng gi�t ���c b�n sao c�n l�i
		x910102_CreatMyAvarta(sceneId,selfId)													--T�o b�n sao m�i c�ng m�c m�u hi�n t�i
	end
	--******************--

end
--**********************************--
--*        Check Condition         *--
--**********************************--
function x910102_CheckCondition(sceneId,selfId,enmeyId)

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
function x910102_OnEnterCombat(sceneId,selfId,enmeyId)

	--******************--
	x910102_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	--******************--

end
--**********************************--
--*        On Leave Combat         *--
--**********************************--
function x910102_OnLeaveCombat(sceneId,selfId)

	--******************--
	x910102_ResetMyAI(sceneId,selfId)															--Set l�i c�c thu�c t�nh cho Boss
	x910102_DeleteMyAvarta(sceneId)																--X�a b�n sao
	--******************--

end
--**********************************--
--*       On Kill Character        *--
--**********************************--
function x910102_OnKillCharacter(sceneId,selfId,targetId)
	
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if nHumanId==targetId then
			local PlayerName=GetName(sceneId,targetId)
			MonsterTalk(sceneId,selfId,"","L� ch�t nh�t nh� ng߽i m� c�ng ph�i � l�o phu ra tay h� "..PlayerName.."... M�y t�n kh�c th� n�o, �n c� ��y � l�o phu ti�n c�c ng߽i v� M�nh B� lu�n m�t th�... Ha ha...!")	--Boss ch� di�u ng߶i ch�i b� gi�t
		end
	end
	
end
--**********************************--
--*             On Die             *--
--**********************************--
function x910102_OnDie(sceneId,selfId,killerId)

	--******************--
	local Recall_Time=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Call_Avarta)--Th�i gian g�i b�n sao
	if Recall_Time>0 and Recall_Time~=99999999 then
		MonsterTalk(sceneId,selfId,"",x910102_g_Monster_Dialogue[4])							--C�u n�i c�a Boss l�c ch�t khi kh�ng c�n b�n sao n�o
		x910102_GiveAllHumanRank(sceneId,killerId)												--C�p nh�t s� l�n th�ng Boss cho t�t c� ng߶i ch�i
		local nBoss=LuaFnGetCopySceneData_Param(sceneId,22)											--Ki�m tra xem c� bao nhi�u Boss �ang chi�n �u
		LuaFnSetCopySceneData_Param(sceneId,22,nBoss-1)												--Gi�m s� Boss �ang chi�n �u xu�ng
		if nBoss-1==0 then
			LuaFnSetCopySceneData_Param(sceneId,16,30000)											--C�p nh�t th�i gian g�i Boss ti�p theo l� 30 gi�y
		end
	else
		local My_Avarta=0
		local nMonsterNum=GetMonsterCount(sceneId)
		for i=0,nMonsterNum-1 do
			local MonsterId=GetMonsterObjID(sceneId,i)
			if GetName(sceneId,MonsterId)==x910102_g_Boss_Name and LuaFnIsCharacterLiving(sceneId,MonsterId) and MonsterId~=selfId then--N�u b�n sao c�n s�ng
				My_Avarta=MonsterId																--ID b�n sao c�n l�i
				break
			end
		end
		MonsterTalk(sceneId,My_Avarta,"",x910102_g_Monster_Dialogue[5])							--C�u n�i c�a Boss l�c ch�t khi b�n sao v�n c�n
	end
	--******************--
	local My_Avarta=0
	local nMonsterNum=GetMonsterCount(sceneId)
	for i=0,nMonsterNum-1 do
		local MonsterId=GetMonsterObjID(sceneId,i)
		if GetName(sceneId,MonsterId)==x910102_g_Boss_Name and LuaFnIsCharacterLiving(sceneId,MonsterId) and MonsterId~=selfId then--N�u b�n sao c�n s�ng
			My_Avarta=MonsterId																--ID b�n sao c�n l�i
			break
		end
	end
	--******************--
	if My_Avarta~=0 then																		--N�u c�n t�n t�i b�n sao
		MonsterAI_SetIntParamByIndex(sceneId,My_Avarta,x910102_g_Next_Time_Call_Avarta,x910102_g_Recall_Time)--Th�i gian g�i b�n sao m�i
	end
	--******************--
	
end
--**********************************--
--*       Give All Human Rank      *--
--**********************************--
function x910102_GiveAllHumanRank(sceneId,killerId)

	--******************--
	local Team_Index=GetTeamId(sceneId,killerId)
	--******************--
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 
		and GetTeamId(sceneId,nHumanId)==Team_Index then
			local Last_Time=GetMissionData(sceneId,nHumanId,SHENGSI_CONGTONTHANH)
			SetMissionData(sceneId,nHumanId,SHENGSI_CONGTONTHANH,Last_Time+1)					--C�p nh�t s� l�n th�ng Boss cho ng߶i ch�i
			BeginEvent(sceneId)
				AddText(sceneId,"S� l�n chi�n th�ng "..x910102_g_Boss_Name.." c�a c�c h� t�ng l�n "..(Last_Time+1).." l�n!")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nHumanId)
		end
	end
	--******************--

end
--**********************************--
--*          Reset My AI           *--
--**********************************--
function x910102_ResetMyAI(sceneId,selfId)

	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Call_Avarta,99999999)			--Th�i gian g�i b�n sao m�i
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_1,x910102_g_Skill_1_CD)--Th�i gian t�i s� d�ng k� n�ng s� 1
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_2,x910102_g_Skill_2_CD)--Th�i gian t�i s� d�ng k� n�ng s� 2
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_3,x910102_g_Skill_3_CD)--Th�i gian t�i s� d�ng k� n�ng s� 3
	--******************--
	
end
--**********************************--
--*         Use My Skills          *--
--**********************************--
function x910102_UseMySkills(sceneId,selfId,nTick)

	--******************--
	local Time_Skill_1=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_1)		--L�y th�i gian l�nh kh߾c hi�n t�i c�a k� n�ng s� 1
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_1,Time_Skill_1-nTick)		--C�p nh�t th�i gian l�nh kh߾c k� n�ng s� 1
	if Time_Skill_1<0 then
		x910102_UseSkill1(sceneId,selfId)																--S� d�ng k� n�ng s� 1
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_1,x910102_g_Skill_1_CD)--C�p nh�t th�i gian l�nh kh߾c cho k� n�ng s� 1
	end
	--******************--
	local Time_Skill_2=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_2)		--L�y th�i gian l�nh kh߾c hi�n t�i c�a k� n�ng s� 2
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_2,Time_Skill_2-nTick)		--C�p nh�t th�i gian l�nh kh߾c k� n�ng s� 2
	if Time_Skill_2<0 then
		x910102_UseSkill2(sceneId,selfId)																--S� d�ng k� n�ng s� 2
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_2,x910102_g_Skill_2_CD)--C�p nh�t th�i gian l�nh kh߾c cho k� n�ng s� 2
	end
	--******************--
	local Time_Skill_3=MonsterAI_GetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_3)		--L�y th�i gian l�nh kh߾c hi�n t�i c�a k� n�ng s� 3
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_3,Time_Skill_3-nTick)		--C�p nh�t th�i gian l�nh kh߾c k� n�ng s� 3
	if Time_Skill_3<0 then
		x910102_UseSkill3(sceneId,selfId)																--S� d�ng k� n�ng s� 3
		MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Use_Skill_3,x910102_g_Skill_3_CD)--C�p nh�t th�i gian l�nh kh߾c cho k� n�ng s� 3
	end
	--******************--
	
end
--**********************************--
--*          Use Skill 1           *--
--**********************************--
function x910102_UseSkill1(sceneId,selfId)

	--******************--
	local Human_List={}
	local nSize=0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			nSize=nSize+1
			Human_List[nSize]=nHumanId
		end
	end
	--******************--
	local Victim=Human_List[random(nSize)]														--L�y n�n nh�n ng�u nhi�n s� d�nh k� n�ng n�y
	--******************--
	local x,y=GetWorldPos(sceneId,selfId)														--L�y t�a � c�a Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910102_g_Skill_1,x,y,Victim,1)							--Boss s� d�ng k� n�ng s� 1 l�n n�n nh�n
	--******************--
	local nTalk=format(x910102_g_Monster_Dialogue[6],GetName(sceneId,Victim))
	MonsterTalk(sceneId,selfId,"",nTalk)
	--******************--
	LuaFnSendSpecificImpactToUnit(sceneId,Victim,Victim,Victim,x910102_g_Skill_1_Impact,0)		--Hi�u �ng k� n�ng 1
	--******************--
	
end
--**********************************--
--*          Use Skill 2           *--
--**********************************--
function x910102_UseSkill2(sceneId,selfId)

	--******************--
	local Human_List={}
	local nSize=0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			nSize=nSize+1
			Human_List[nSize]=nHumanId
		end
	end
	--******************--
	local Victim=Human_List[random(nSize)]														--L�y n�n nh�n ng�u nhi�n s� d�nh k� n�ng n�y
	--******************--
	local x,y=GetWorldPos(sceneId,selfId)														--L�y t�a � c�a Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910102_g_Skill_2,x,y,Victim,1)							--Boss s� d�ng k� n�ng s� 2 l�n n�n nh�n
	--******************--
	local nTalk=format(x910102_g_Monster_Dialogue[7],GetName(sceneId,Victim))
	MonsterTalk(sceneId,selfId,"",nTalk)
	--******************--
	LuaFnSendSpecificImpactToUnit(sceneId,Victim,Victim,Victim,x910102_g_Skill_2_Impact,0)		--Hi�u �ng k� n�ng 2
	--******************--
	
end
--**********************************--
--*          Use Skill 3           *--
--**********************************--
function x910102_UseSkill3(sceneId,selfId)

	--******************--
	local Human_List={}
	local nSize=0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0,nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanId)==1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanId)==1 and LuaFnIsCharacterLiving(sceneId,nHumanId)==1 then
			nSize=nSize+1
			Human_List[nSize]=nHumanId
		end
	end
	--******************--
	local Victim=Human_List[random(nSize)]														--L�y n�n nh�n ng�u nhi�n s� d�nh k� n�ng n�y
	--******************--
	local x,y=GetWorldPos(sceneId,selfId)														--L�y t�a � c�a Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910102_g_Skill_3,x,y,Victim,1)							--Boss s� d�ng k� n�ng s� 3 l�n n�n nh�n
	--******************--
	local nTalk=format(x910102_g_Monster_Dialogue[8],GetName(sceneId,Victim))
	MonsterTalk(sceneId,selfId,"",nTalk)
	--******************--
	LuaFnSendSpecificImpactToUnit(sceneId,Victim,Victim,Victim,x910102_g_Skill_3_Impact,0)		--Hi�u �ng k� n�ng 3
	--******************--
	
end
--**********************************--
--*        Creat My Avarta         *--
--**********************************--
function x910102_CreatMyAvarta(sceneId,selfId)

	--******************--
	local My_Level=GetLevel(sceneId,selfId)														--L�y level c�a Boss
	local nDec=-2
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
	local x,y=GetWorldPos(sceneId,selfId)														--L�y t�a � c�a Boss
	LuaFnUnitUseSkill(sceneId,selfId,x910102_g_Skill_Avarta,x,y,0,1)							--Boss s� d�ng k� n�ng � ph�n th�n
	local Avarta_Index=LuaFnCreateMonster(sceneId,x910102_g_Avarta_Index+nDec,x+random(2)-random(2),y+random(2)-random(2),27,0,x910102_g_ScriptId)--T�o b�n sao m�i
	--******************--
	local Current_Hitpoint=GetHp(sceneId,selfId)												--Hp hi�n t�i c�a Boss
	SetHp(sceneId,Avarta_Index,Current_Hitpoint)												--Set Hp cho b�n sao ��ng b�ng c�a Boss
	--******************--
	MonsterAI_SetIntParamByIndex(sceneId,selfId,x910102_g_Next_Time_Call_Avarta,99999999)		--Th�i gian g�i b�n sao m�i
	--******************--
	MonsterTalk(sceneId,selfId,"",x910102_g_Monster_Dialogue[2])								--Boss n�i l�c g�i b�n sao
	--******************--
	
end
--**********************************--
--*        Check My Avarta         *--
--**********************************--
function x910102_CheckMyAvarta(sceneId)

	--******************--
	local Result=0
	--******************--
	local nMonsterNum=GetMonsterCount(sceneId)
	for i=0,nMonsterNum-1 do
		local MonsterId=GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId,MonsterId)==1 and GetName(sceneId,MonsterId)==x910102_g_Boss_Name then
			Result=Result+1
		end
	end
	--******************--
	return Result
	--******************--
	
end
--**********************************--
--*        Delete My Avarta        *--
--**********************************--
function x910102_DeleteMyAvarta(sceneId)

	--******************--
	local Res=0
	--******************--
	local nMonsterNum=GetMonsterCount(sceneId)
	for i=0,nMonsterNum-1 do
		local MonsterId=GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId,MonsterId)==1 and GetName(sceneId,MonsterId)==x910102_g_Boss_Name then
			if Res==0 then
				Res=1
			else
				SetCharacterDieTime(sceneId,selfId,100)
			end
		end
	end
	--******************--
	
end
--**********************************--
--*           Global News          *--
--**********************************--
function x910102_GlobalNews(sceneId,Tips)

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