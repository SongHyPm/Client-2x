-- ���޻ش�����
-- �ű���
-- UI_COMMAND 888901

x888901_g_ScriptId = 888901  -- ������Ҳʹ��C�i n�y �����.�Ͻ��޸�
x888901_g_Item		 = 30505134

-- �����
x888901_g_FemaleType = 6
x888901_g_MaleType = 7

x888901_g_OptPos = {
	{1,2,3},{1,3,2},{2,1,3},{2,3,1},{3,1,2},{3,2,1}
}

-- �ͻ��˶�����
x888901_g_ClientOp = {
	"answer","clientstop","askstop"
}

-- ��m�t ��to� � �ش����
x888901_g_AnswerState = {
	["start"]			= "��ʼ",
	["timeout"]		= "��ʱ",
	["oknext"]		= "��ȷ",
	["failnext"]	= "����",
	["cancel"]		= "δ֪",
}

--**********************************
-- �о��¼�
--**********************************
function x888901_OnEnumerate( sceneId, selfId, targetId )
	local CurMonthDay = LuaFnGetDayOfThisMonth()
	if CurMonthDay and mod(CurMonthDay,2) == 0 then
		AddNumText( sceneId, x888901_g_ScriptId, "����LinhϬ", 2, 100 )
	end
	--AddNumText(sceneId,x888901_g_ScriptId,"ֱ�ӽ��", 5, 2)
end

--**********************************
-- �¼��б�ѡ��m�t ��
--**********************************
function x888901_OnDefaultEvent( sceneId, selfId, targetId, eventId )
	local opt = GetNumText()
	if opt == 1 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		x888901_BeginCoupleQuestion(sceneId,selfId,targetId)
	elseif opt == 2 then
		x888901_DirectMary(sceneId,selfId)
	elseif opt == 3 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif opt == 100 then
		BeginEvent( sceneId )
			local strText = "    ����ٳ��֪��������ng��������ͨ��?��������m�t c�iССto� � ����#R����LinhϬ#W,C�n ����T�i ��ʱ���ڸ��Զ���ͬto� � ���������ش�,���ǲ�������m�t ��,������������to� � ѡ����ng��m�t ��,�ò���ÿ����ֻ��m�t �λ��ᱨ���μ�,Ҫ���ضԴ���.#r    ��Ը��μ�����LinhϬto� � ������?"
			AddText( sceneId, strText )
			AddNumText( sceneId, x888901_g_ScriptId, "Ta mu�n tham gia", 2, 1)
			AddNumText( sceneId, x888901_g_ScriptId, "��������", 8, 3);
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

-- ������to� � ����,���Դ���
function x888901_DirectMary(sceneId,selfId)
	--1.��ng�����
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_noteam")
		return
	end
	
	--2.��ng���������
	if GetTeamSize(sceneId,selfId)~=2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_musttwo")
		return
	end
	
	--3.��ng��T�i ����
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_mustnear")
		return
	end
	
	--4.��ng����ng����
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	
	LuaFnMarry(sceneId, tid1, tid2, 1)
	x888901_NotifySystemMsg(sceneId,tid1,"directmarry")
	x888901_NotifySystemMsg(sceneId,tid2,"directmarry")
end

-- ��鿪ʼ��������
function x888901_BeginCoupleQuestion(sceneId,selfId,targetId)
	--1.��ng�����
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_noteam")
		return
	end
	
	--2.��ng������
	if GetTeamSize(sceneId,selfId)~=2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_musttwo")
		return
	end
	
	--3.��ng��T�i ����
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_mustnear")
		return
	end
	
	--4.��ng����ng����
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	if LuaFnIsMarried(sceneId,tid1)<=0 or LuaFnIsMarried(sceneId,tid2)<=0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_nomarry")
		return
	else
		if LuaFnGetSpouseGUID(sceneId,tid1) ~= LuaFnGetGUID(sceneId,tid2) or LuaFnGetSpouseGUID(sceneId,tid2) ~= LuaFnGetGUID(sceneId,tid1) then
			x888901_NotifySystemMsg(sceneId,selfId,"err_mustcouple")
			return
		end
	end
	
	--5.��ng��MAC��ͬ
	if IsSameMAC(sceneId,tid1,tid2) > 0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_samemac")
		return
	end
	
	--6.��ng��ӳ�
	if LuaFnIsTeamLeader(sceneId,selfId)<=0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_mustleader")
		return
	end
	
	local CurDayTime = GetDayTime()
	local LastCoupleQuestionDayTime1 = GetMissionData(sceneId, tid1, MD_COUPLEQUESTION_DAYTIME)
	local LastCoupleQuestionDayTime2 = GetMissionData(sceneId, tid2, MD_COUPLEQUESTION_DAYTIME)
	
	--7.������ng��δ�μ�
	if CurDayTime <= LastCoupleQuestionDayTime1 or CurDayTime <= LastCoupleQuestionDayTime2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_already")
		return
	end
	
	--8.������ng����ng˫��
	local CurMonthDay = LuaFnGetDayOfThisMonth()
	if not CurMonthDay or mod(CurMonthDay,2) > 0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_notday")
		return
	end
	
	--���ɹ�,���Կ�ʼ��ʼ��������
	SetMissionData( sceneId, tid1, MD_COUPLEQUESTION_DAYTIME, CurDayTime )
	SetMissionData( sceneId, tid2, MD_COUPLEQUESTION_DAYTIME, CurDayTime )
	
	local FriendPoint = LuaFnGetFriendPoint(sceneId,tid1,tid2)
	local MaxQuestion = 25

	if FriendPoint >=9000 then
		MaxQuestion = 100
	elseif FriendPoint >=6000 then
		MaxQuestion = 75
	elseif FriendPoint >= 3000 then
		MaxQuestion = 50
	end
	
	--��� gi�y�������to� � ����
	StopCoupleQuestion(sceneId,tid1)
	StopCoupleQuestion(sceneId,tid2)
	
	StartCoupleQuestion(sceneId,tid1,tid2,targetId,MaxQuestion)
	SetMissionData(sceneId, tid1, MD_COUPLEQUESTION_DAYTIME,CurDayTime)
	StartCoupleQuestion(sceneId,tid2,tid1,targetId,MaxQuestion)
	SetMissionData(sceneId, tid2, MD_COUPLEQUESTION_DAYTIME,CurDayTime)

	--��¼ͳ����־
	x888901_LogCoupleAction(sceneId,tid1,tid2,COUPLE_LOG_STARTQUESTION)

	local question,qtype = x888901_RandomQuestion(sceneId,tid1)	
	x888901_SendCoupleQuestion(sceneId,tid1,targetId,question,qtype,"start")
	x888901_SendCoupleQuestion(sceneId,tid2,targetId,question,qtype,"start")
end

function x888901_RandomQuestion(sceneId,userId)
	local coupleId = GetCoupleID(sceneId,userId)
	local nm = ""
	
	if coupleId>=0 then
		--��Ů�ж�
		local maleId = userId
		local femaleId = coupleId
		if GetSex(sceneId,userId) == 0 then
			maleId = coupleId
			femaleId = userId
		end
		
		--������Ů��ͬ�������ƺ����
		local rp = random(1,2)
		if rp == 1 then
			nm = format("#G%s#W",GetName(sceneId,femaleId))
			return GetRandomQuestionsIndex(x888901_g_FemaleType),nm
		else
			nm = format("#G%s#W",GetName(sceneId,maleId))
			return GetRandomQuestionsIndex(x888901_g_MaleType),nm
		end
	else
		return GetRandomQuestionsIndex(x888901_g_FemaleType),nm
	end
end

-- ����m�t c�i������ͻ���
function x888901_SendCoupleQuestion(sceneId,userId,targetId,question,qtype,act)
	local bStart,qmax,qcur,privity,maxprivity,samenum = GetCoupleQuestionState(sceneId,userId)
	if bStart > 0 then
		local con,opt0,opt1,opt2=GetQuestionsRecord(question)
		con = format(con,qtype)
		local coupleId = GetCoupleID(sceneId,userId)
		
		local rpos = random(1,getn(x888901_g_OptPos))
		local pt = x888901_g_OptPos[rpos]
	
		if act == "timeout" then privity=0 end
		if act == "oknext" then 
			privity=privity+1
			samenum=samenum+1
			LuaFnSendSpecificImpactToUnit(sceneId,userId,userId,userId,51,100)
		end
		if act == "failnext" then privity=0 end
		if act == "start" then qcur=0 else qcur=qcur+1 end
	
		--�Ѿ�û����ɴ���
		if qcur == qmax then
			--�������⽱��
				if qmax == 100 and privity == 100 and bStart > 0 then
				x888901_SendCoupleQuestionPrize(sceneId,userId,coupleId)
			end
			--֪ͨ�ͻ��˽�������
			NextCoupleQuestion(sceneId,userId,qcur,privity,samenum)
			x888901_StopCoupleQuestionScript(sceneId,userId,coupleId,"finish")
			return
		end
	
		--��m�t ��to� � �ش����
		local premsg = x888901_g_AnswerState[act]
		if not premsg then
			premsg = x888901_g_AnswerState["cancel"]
		end
		
		--֪ͨ�ͻ�����ʾ��Ŀ
		BeginUICommand(sceneId)
			UICommand_AddString(sceneId,act)
			UICommand_AddInt(sceneId,targetId)
			UICommand_AddInt(sceneId,qmax) --������
			UICommand_AddInt(sceneId,qcur+1) --��ǰ����
			UICommand_AddInt(sceneId,privity) --Ĭ����
			UICommand_AddString(sceneId,con)	--����
			UICommand_AddInt(sceneId,3)			--������
			UICommand_AddString(sceneId,opt0)	--��1
			UICommand_AddString(sceneId,opt1)	--��2
			UICommand_AddString(sceneId,opt2)	--��3
			UICommand_AddInt(sceneId,pt[1])	--��ʾλ��1
			UICommand_AddInt(sceneId,pt[2]) --��ʾλ��2
			UICommand_AddInt(sceneId,pt[3]) --��ʾλ��3
			UICommand_AddString(sceneId,premsg)	--��m�t ��to� � �ش����
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,userId, x888901_g_ScriptId)
	
		--�޸ķ�����������״̬
		NextCoupleQuestion(sceneId,userId,qcur,privity,samenum)
		SetCurCoupleQuestion(sceneId,userId,question,3,-1)
	end
end

function x888901_SendCoupleQuestionPrize(sceneId,userId,coupleId)
	if coupleId>=0 then
		--��userId��Ʒ
		LuaFnBeginAddItem( sceneId )
		LuaFnAddItem( sceneId, x888901_g_Item, 1)
		local uret = LuaFnEndAddItem( sceneId, userId )
		if 1 == uret then
			AddItemListToHuman(sceneId,userId)
		end
		--��coupleId��Ʒ
		LuaFnBeginAddItem( sceneId )
		LuaFnAddItem( sceneId, x888901_g_Item, 1)
		local oret = LuaFnEndAddItem( sceneId, coupleId )
		if 1 == oret then
			AddItemListToHuman(sceneId,coupleId)
		end
		--������
		if 1 == oret and 1 == uret then
			local uname = format("#{_INFOUSR%s}",GetName(sceneId,userId))
			local oname = format("#{_INFOUSR%s}",GetName(sceneId,coupleId))
			local itemt = format("#{_INFOMSG%s}",GetItemTransfer(sceneId,coupleId,0))
			local str = format("%s#I��%s#IT�i Nguy�t L�o������#R����LinhϬ#Ito� � ������,m�t ·����ն�����߸��ͽ�,������ng����ͬ�������Ͻ�.������%s.",uname,oname,itemt)
			BroadMsgByChatPipe(sceneId, userId, str, 4)
		end
	end
end

-- ���޴���ͻ��˽ӿ�(�ͻ��˵���)
function x888901_CoupleQuestion_ClientAction(sceneId,selfId,op,num,sequence)--modi:lby ������ż�����鵱ǰ������ng����ng��T�i ����
	if nil == op or 1 > op then return end
	local client_op = x888901_g_ClientOp[op]
	
	if client_op == "answer" then
		x888901_ClientAnswerCoupleQuestion(sceneId,selfId,num,sequence)
	elseif client_op == "clientstop" then
		x888901_ClientStopCoupleQuestion(sceneId,selfId)
	elseif client_op == "askstop" then
		x888901_AskClientRealStop(sceneId,selfId)
	end
end

-- �ͻ��˻ش�����
function x888901_ClientAnswerCoupleQuestion(sceneId,selfId, num, sequence)--modi:lby ������ż�����鵱ǰ������ng����ng��T�i ��to� � ��
	local bStart,_,qcur,privity = GetCoupleQuestionState(sceneId,selfId)
	if bStart>0 then
		local cq,_,_ = GetCurCoupleQuestion(sceneId,selfId)
		local ca = num
		local coupleId = GetCoupleID(sceneId,selfId)
		
		if coupleId>=0 and cq>=0 then
			local _,_,ocur,_ = GetCoupleQuestionState(sceneId,coupleId)
			local oq,_,oa = GetCurCoupleQuestion(sceneId,coupleId)
			--�������ng����ͬ
			if oq ~= cq or sequence ~= qcur+1 or ocur ~= qcur then		--modi:lby ������ż���
				--x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId) --modi:lby ��Ϊ���ܶ���ύ������to� � ���ݲ���ͬ�����˳�
				return
			end
			
			local act = "failnext"
			--������ng����ͬ
			if oa <= 0 then
				SetCurCoupleQuestion(sceneId,selfId,cq,3,ca)
				return
			elseif oa == ca then
				act = "oknext"
			end
			-- ��t ���cKinh nghi�mֵ
			if act == "oknext" then
				local cexp = floor(x888901_CaculPrivityExp(sceneId,selfId,privity))
				AddExp(sceneId,selfId,cexp)
				local oexp = floor(x888901_CaculPrivityExp(sceneId,coupleId,privity))
				AddExp(sceneId,coupleId,oexp)

				local tip_part1 = "Ch�c m�ng,����to� � ����ͬ,�� ��t ���cKinh nghi�m"
				local tip_part2 = " �i�m."
				
				x888901_NotifySystemMsg(sceneId,selfId,act,tip_part1..tostring(cexp)..tip_part2)
				x888901_NotifySystemMsg(sceneId,coupleId,act,tip_part1..tostring(oexp)..tip_part2)
			else
				x888901_NotifySystemMsg(sceneId,selfId,act)
				x888901_NotifySystemMsg(sceneId,coupleId,act)
			end
			--������������
			local question,qtype = x888901_RandomQuestion(sceneId,selfId)	
			x888901_SendCoupleQuestion(sceneId,selfId,-1,question,qtype,act)
			x888901_SendCoupleQuestion(sceneId,coupleId,-1,question,qtype,act)
		else
			--�Է��Ѿ���������,���Լ�ҲҪ����
			x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId)
		end
	end
end

-- ����Kinh nghi�mֵ����
-- ��������=c*LV*LV
-- ÿ��ʵ �i�m����=��������*(1+N*a)
-- cΪ����ֵ�������,Ĭ��Ϊ0.573
-- LVΪ�����ߵ�c�p
-- NΪ�����ʱto� � Ĭ��ָ��ֵ
-- aΪ����ʱto� � Kinh nghi�m�ӳ�ϵ��,Ĭ��Ϊ0.01

function x888901_CaculPrivityExp(sceneId,userId,privity)
	local c = 0.573
	local a = 0.01
	local LV = GetLevel(sceneId,userId)
	local N = privity
	
	local baseExp=c*LV*LV
	local Exp=baseExp*(1+N*0.01)
	
	--print("x888901_CaculPrivityExp selfId="..tostring(userId).." baseExp="..tostring(baseExp).." Exp="..tostring(Exp))
	return Exp;
end
-- ѯ�ʿͻ�����ng�����
function x888901_AskClientRealStop(sceneId,selfId)
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x888901_g_ScriptId);
		UICommand_AddInt(sceneId,2)
		UICommand_AddString(sceneId,"CoupleQuestion_ClientAction");
		UICommand_AddString(sceneId,"�˳���ôβ��Խ��ʹ˽���,��ȷ��Ҫ�˳���?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
end
-- �ͻ��˽���
function x888901_ClientStopCoupleQuestion(sceneId,selfId)
	local coupleId = GetCoupleID(sceneId,selfId)
	x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId,"clientstop")
end

-- ���ⳬʱ
function x888901_AnswerQuestionTimeOut(sceneId,selfId,coupleId)
	local question,qtype = x888901_RandomQuestion(sceneId,selfId)
	
	x888901_NotifySystemMsg(sceneId,selfId,"timeout")
	x888901_SendCoupleQuestion(sceneId,selfId,-1,question,qtype,"timeout")
	
	x888901_NotifySystemMsg(sceneId,coupleId,"timeout")
	x888901_SendCoupleQuestion(sceneId,coupleId,-1,question,qtype,"timeout")
	--print("x888901_AnswerQuestionTimeOut "..tostring(selfId))
end

-- ֹͣ����˫������
function x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId,act)
	local bStart,qmax,_,_,maxprivity,samenum = GetCoupleQuestionState(sceneId,selfId)
	local tipm = ""
	
	if bStart > 0 then
		tipm = format("�ôβ��Թ�%d��,���Ƿ��޹����%d��,���Ĭ��ָ���ﵽ%d.", qmax,samenum,maxprivity)
	end
	
	--ͳ�����н���to� � ��Ϣ
	if coupleId >= 0 then
		if act == "finish" then
			x888901_LogCoupleAction(sceneId,selfId,coupleId,COUPLE_LOG_FINISHQUESTION)
		else
			x888901_LogCoupleAction(sceneId,selfId,coupleId,COUPLE_LOG_STOPQUESTION)
		end
	end
	
	StopCoupleQuestion(sceneId,selfId)
	x888901_SendStopCoupleQuestion(sceneId,selfId,act,tipm)
	
	if coupleId>=0 then 
		StopCoupleQuestion(sceneId,coupleId)
		x888901_SendStopCoupleQuestion(sceneId,coupleId,act,tipm)
	end
end

-- Hu� b��ͻ���to� � ��ʾ
function x888901_SendStopCoupleQuestion(sceneId,userId,act,tip)
	if act then
		x888901_NotifySystemMsg(sceneId,userId,act,tip)
	else
		x888901_NotifySystemMsg(sceneId,userId,"cancel",tip)
	end
	
	BeginUICommand(sceneId)
		UICommand_AddString(sceneId,"cancel")
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,userId, x888901_g_ScriptId)
end

-- H� th�ng��ʾ
function x888901_NotifySystemMsg(sceneId,selfId,txtId,tip)
	BeginEvent(sceneId)
	if txtId == "err_noteam" then
		AddText(sceneId,"�������Ӳ��ܲμ�")
	elseif txtId == "err_musttwo" then
		AddText(sceneId,"��������������")
	elseif txtId == "err_mustnear" then
		AddText(sceneId,"�������˱��붼T�i ����")
	elseif txtId == "err_nomarry" then
		AddText(sceneId,"��������������")
	elseif txtId == "err_mustcouple" then
		AddText(sceneId,"��������������")
	elseif txtId == "err_mustleader" then
		AddText(sceneId,"������ng�ӳ����ܱ����μ�")
	elseif txtId == "err_already" then
		AddText(sceneId,"���ǽ����Ѿ��μӹ�����LinhϬ��")
	elseif txtId == "timeout" then
		AddText(sceneId,"�ش�ʱ.")
	elseif txtId == "directmarry" then
		AddText(sceneId,"ֱ�ӽ��ɹ��.�")
	elseif txtId == "cancel" then
		AddText(sceneId,"���в������,�������������."..tip)
	elseif txtId == "finish" then
		AddText(sceneId,"��������ɲ���."..tip)
	elseif txtId == "clientstop" then
		AddText(sceneId,"������ֹ�˲���."..tip)
	elseif txtId == "oknext" then
		AddText(sceneId,tip)
	elseif txtId == "failnext" then
		AddText(sceneId,"���ź�,���Ƿ���to� � �𰸲�ͬ.")
	elseif txtId == "err_notday" then
		AddText(sceneId,"����û������LinhϬ")
	elseif txtId == "err_samemac" then
		AddText(sceneId,"���Ƿ�����ͬm�t ̨������û�����в���")
	end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--ͳ����Ϣ
function x888901_LogCoupleAction(sceneId,tid1,tid2,logid)
	local bStart,qmax,_,_,maxprivity = GetCoupleQuestionState(sceneId,tid1)
	--print(tostring(bStart).." "..tostring(logid).." "..tostring(COUPLE_LOG_DETAIL[logid]))
	if bStart > 0 and logid and COUPLE_LOG_DETAIL[logid] then		
		local maleId = tid1
		local femaleId = tid2
		if GetSex(sceneId,tid1) == 0 then
			maleId = tid2
			femaleId = tid1
		end
		
		--CPL:���,� �i�m�,GUID1,GUID2,������,���Ĭ����,ʱ��
		local logstr = format("CPL:%d,%s,0x%X,0x%X,%d,%d",
									 				logid,
									 				COUPLE_LOG_DETAIL[logid],
									 				LuaFnGetGUID(sceneId,maleId),
									 				LuaFnGetGUID(sceneId,femaleId),
									 				qmax,
									 				maxprivity)
		LogCouple(logstr)
	end
end
