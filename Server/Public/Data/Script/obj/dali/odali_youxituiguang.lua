-- �콱NPC

x002084_g_scriptId = 002084

x002084_g_PrimaryAward = 1
x002084_g_Award2 = 2
x002084_g_Award3 = 3

x002084_g_Intro = 4

x002084_g_NewCard1 = 5
x002084_g_NewCard2 = 6
x002084_g_NewCard3 = 7
x002084_g_NewCard4 = 10
x002084_g_NewCard5 = 11
x002084_g_NewCard6 = 12
x002084_g_NewCard7 = 13
x002084_g_NewCard8 = 14

x002084_g_NewCardIntro = 9
x002084_g_VirtualNew = 30505080

--CD-KEY
x002084_g_AwardList = {}
x002084_g_AwardList[x002084_g_PrimaryAward] = {
	needLevel = -1,
	itemAward = { hashTable = {}, itemList = { 10402001, 10422012, 10423020 } },
	moneyReward = 0,
	PropBagSpaceNeed = 3,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetAward0Flag,
	redundantMsg = "    Ng߽i �� l�nh ph�n th߷ng s� c�p r�i, �n c�p 30 l�i �n t�m ta",
	recvMsg = "    M�y m�n � trang s�c � ��y, l�u l�c tr�n giang h� �t nhi�u �u c�n �n ngo�i ra ch� ti�n n�y �u t�ng cho c�c h�, ch�c c�c h� vui v� trong tr� ch�i Thi�n Long B�t B�",
}
x002084_g_AwardList[x002084_g_Award2] = {
	needLevel = 30,
	itemAward = { hashTable = { 40 }, itemList = {} },
	moneyReward = 0,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 1,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetAward1Flag,
	redundantMsg = "    Ng߽i �� l�nh ph�n th߷ng c�p 30 r�i, �n c�p 60 l�i �n t�m ta",
	recvMsg = "    Vi�n B�o Th�ch n�y l� m�t ch�t g�i l�, nh� l� B�o Th�ch qu� th� ph�i ���c tr�m kh�m tr�n trang b� t�t, ch�c ng߽i may m�n",
}
x002084_g_AwardList[x002084_g_Award3] = {
	needLevel = 60,
	itemAward = { hashTable = { 41 }, itemList = {} },
	moneyReward = 0,
	PropBagSpaceNeed = 1,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetAward2Flag,
	redundantMsg = "    Ng߽i �� l�nh ph�n th߷ng c�p 60 r�i",
	recvMsg = "    B� quy�t quan tr�ng n�y l� m�t ch�t g�i l�, nh� l� b� quy�t quan tr�ng th� ph�i ���c d�y cho tr�n th�, ch�c ng߽i may m�n",
}
--�Ƹ���
x002084_g_NewCardList = {}
x002084_g_NewCardList[x002084_g_NewCard1] = {
	needLevel = -1,
	itemAward = { hashTable = {}, itemList = {10402001,10422012,10423020} },
	moneyReward = 0,
	PropBagSpaceNeed = 3,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard0,
	redundantMsg = "    Ng߽i �� l�nh ph�n th߷ng c�p 1 r�i, �n c�p 15 l�i �n t�m ta",
	recvMsg = "    Hai m�n � trang s�c v� m�t lo�i v� kh� � ��y, l�u l�c tr�n giang h� �t nhi�u �u c�n �n ngo�i ra ch� ti�n n�y �u t�ng cho c�c h�, ch�c c�c h� vui v� trong tr� ch�i Thi�n Long B�t B�",
}
x002084_g_NewCardList[x002084_g_NewCard2] = {
	needLevel = 15,
	itemAward = { hashTable = {}, itemList = {10141050,10141051,10413013,10411013,10412013,10421013} },
	moneyReward = 0,
	PropBagSpaceNeed = 6,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard1,
	redundantMsg = "    Ng߽i �� l�nh ph�n th߷ng c�p 15 r�i, �n c�p 30 l�i �n t�m ta",
	recvMsg = "#{Mis_NewUserCard_15}",
}
x002084_g_NewCardList[x002084_g_NewCard3] = {
	needLevel = 30,
	itemAward = { hashTable = {}, itemList = {30900015,20109004} },
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 1,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard2,
	redundantMsg = "    Ng߽i �� l�nh ph�n th߷ng c�p 30 r�i",
	recvMsg = "    � ��y cho c�c h� m�t con tr�n th�, m�t b� qu�n �o, m�t th� h�p th�nh B�o Th�ch c�p th�p, m�t ph�n t�i li�u �� ��ng l�. #r#rTr�n th� c� th� t�ng th�m n�ng l�c c�a c�c h� trong chi�n �u, th� h�p th�nh B�o Th�ch c� th� n�ng cao t� l� th�nh c�ng c�a h�p th�nh b�o th�c, sau khi t�i li�u �� ��ng l� c� th� ��ng ���c l� tr�n trang b�, d�ng � tr�m kh�m B�o Th�ch",
}
x002084_g_NewCardList[x002084_g_NewCard4] = {
	needLevel = 40,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 2000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard3,
	redundantMsg = "    C�c h� �� nh�n th߷ng c�p � 40.",
	recvMsg = "    � ��y t�ng cho c�c h� 2000 �i�m",
}
x002084_g_NewCardList[x002084_g_NewCard5] = {
	needLevel = 50,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 4000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard4,
	redundantMsg = "    C�c h� �� nh�n th߷ng c�p � 50.",
	recvMsg = "    � ��y t�ng cho c�c h� 4000 �i�m.",
}
x002084_g_NewCardList[x002084_g_NewCard6] = {
	needLevel = 60,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 4000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard5,
	redundantMsg = "    Ng߽i �� l�nh ph�n th߷ng c�p 60 r�i",
	recvMsg = "    � ��y t�ng cho c�c h� 4000 �i�m.",
}
x002084_g_NewCardList[x002084_g_NewCard7] = {
	needLevel = 70,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 6000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard6,
	redundantMsg = "    C�c h� �� nh�n th߷ng c�p � 70.",
	recvMsg = "    � ��y t�ng cho c�c h� 6000 �i�m.",
}
x002084_g_NewCardList[x002084_g_NewCard8] = {
	needLevel = 80,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 7520,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard7,
	redundantMsg = "    C�c h� �� nh�n th߷ng c�p � 80.",
	recvMsg = "     Cho c�c h� 7520 �i�m t�ng t�i ��y. ",
}

--**********************************
--�¼��������
--**********************************
function x002084_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "    Hoan ngh�nh �n v�i th� gi�i tr� ch�i Thi�n Long B�t B�, ta c� th� gi�p ng߽i ���c g� ch�ng? N�u ng߽i �� t�ng s� d�ng CD-KEY tr�n m�ng, tr߾c ti�n ng߽i c�n ph�i k�ch ho�t �i�u ki�n l�nh ph�n th߷ng m�i c� th� l�nh ���c ph�n th߷ng"
		AddText( sceneId, strText )

		AddNumText( sceneId, x002084_g_scriptId, "T�i h� s� d�ng th� t�i ph�", 2, 101 )
		AddNumText( sceneId, x002084_g_scriptId, "T�i h� �i 5 v�ng l�y 315 KNB", 2, 990 )
		AddNumText( sceneId, x002084_g_scriptId, "T�i h� �i 10 v�ng l�y 630 KNB", 2, 992 )
		AddNumText( sceneId, x002084_g_scriptId, "T�i h� �i 50 v�ng l�y 3150 KNB", 2, 994 )
		AddNumText( sceneId, x002084_g_scriptId, "T�i h� �i 100 v�ng l�y 6300 KNB", 2, 996 )
		--AddNumText( sceneId, x002084_g_scriptId, "�����ƹ�Աcdkey�û�", 2, 201 )

		AddNumText( sceneId, x002084_g_scriptId, "Gi�i thi�u h� th�ng khuy�n m�i", 11, x002084_g_Intro )
		AddNumText( sceneId, x002084_g_scriptId, "Gi�i thi�u v� h� th�ng th� t�i ph�", 11, x002084_g_NewCardIntro )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--CD-KEY
function x002084_AddCDKeyNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "K�ch ho�t CD-KEY", 2, 0 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_AwardList[x002084_g_PrimaryAward].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "L�nh ph�n th߷ng CD-KEY", 2, x002084_g_PrimaryAward )
			 eventNum = eventNum + 1
		end

		--if GetMissionFlag( sceneId, selfId, x002084_g_AwardList[x002084_g_Award2].flagBit ) == 0 then
			-- AddNumText( sceneId, x002084_g_scriptId, "��ȡ" .. x002084_g_AwardList[x002084_g_Award2].needLevel .. "���Ľ���", 2, x002084_g_Award2 )
			-- eventNum = eventNum + 1
		--end

		--if GetMissionFlag( sceneId, selfId, x002084_g_AwardList[x002084_g_Award3].flagBit ) == 0 then
			-- AddNumText( sceneId, x002084_g_scriptId, "��ȡ" .. x002084_g_AwardList[x002084_g_Award3].needLevel .. "���Ľ���", 2, x002084_g_Award3 )
			-- eventNum = eventNum + 1
		--end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    C�c h� �� nh�n t�t c� ph�n th߷ng CDKEY." )
	end
end

--�Ƹ���
function x002084_AddNewUserCardNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "K�ch ho�t th� t�i ph�", 2, 8 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard1].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "L�nh ph�n th߷ng c�p 1", 2, x002084_g_NewCard1 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard2].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "C�p " .. x002084_g_NewCardList[x002084_g_NewCard2].needLevel .. " l�nh ph�n th߷ng", 2, x002084_g_NewCard2 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard3].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "C�p " .. x002084_g_NewCardList[x002084_g_NewCard3].needLevel .. " l�nh ph�n th߷ng", 2, x002084_g_NewCard3 )
			 eventNum = eventNum + 1
		end
		
		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard4].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "C�p " .. x002084_g_NewCardList[x002084_g_NewCard4].needLevel .. " l�nh ph�n th߷ng", 2, x002084_g_NewCard4 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard5].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "C�p " .. x002084_g_NewCardList[x002084_g_NewCard5].needLevel .. " l�nh ph�n th߷ng", 2, x002084_g_NewCard5 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard6].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "C�p " .. x002084_g_NewCardList[x002084_g_NewCard6].needLevel .. " l�nh ph�n th߷ng", 2, x002084_g_NewCard6 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard7].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "C�p " .. x002084_g_NewCardList[x002084_g_NewCard7].needLevel .. " l�nh ph�n th߷ng", 2, x002084_g_NewCard7 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard8].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "C�p " .. x002084_g_NewCardList[x002084_g_NewCard8].needLevel .. " l�nh ph�n th߷ng", 2, x002084_g_NewCard8 )
			 eventNum = eventNum + 1
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    C�c h� �� nh�n t�t c� ph�n th߷ng c�a th� t�i ph�." )
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002084_OnEventRequest( sceneId, selfId, targetId, eventId )


	if x002084_g_NewCardIntro == GetNumText() then
		
		BeginEvent( sceneId )
			AddText( sceneId, "#{XinShouKa_Help_001}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	end
	if GetNumText() == 990 then
		BeginEvent( sceneId )
			AddText( sceneId, "Ь nh�n 315 KNB c�n ph�i t�n #G5v#W. Ng߽i x�c nh�n chuy�n d�i ch�ng?" )
			AddNumText( sceneId, x002084_g_scriptId, "аng �", -1, 991)
			AddNumText( sceneId, x002084_g_scriptId, "Ta hi�n gi� ch�a c�n KNB", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
    elseif GetNumText() == 991 then
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		if (nMoneyJZ + nMoney <50000) then
			x002084_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� #G5v#W m� ��i KNB �? Kh�n th�?" )
			return
		end
		local reply = LuaFnCostMoneyWithPriority(sceneId,selfId,50000)
		if reply == -1 then
			x002084_NotifyFailTips( sceneId, selfId, "#G5v#W  m� c�ng ko c� sao? ngh�o qu�, �i ki�m �i r�i quay v� ��y v�i ta." )
			x002084_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� #G5v#W m� ��i KNB �? Kh�n th�?" )
			return
		else
			local result =	YuanBao(sceneId,selfId,targetId,1,315)
			local str = "#PXin ch�c m�ng, c�c h� �� nh�n ���c #G315 KNB #Pv� m�t #G5v#W."
			x002084_NotifyFailTips( sceneId, selfId, str )
			x002084_NotifyFailBox( sceneId, selfId, targetId, str )
		end
	end
	if GetNumText() == 992 then
		BeginEvent( sceneId )
			AddText( sceneId, "Ь nh�n 630 KNB c�n ph�i t�n #G10v#W. Ng߽i x�c nh�n chuy�n d�i ch�ng?" )
			AddNumText( sceneId, x002084_g_scriptId, "аng �", -1, 993)
			AddNumText( sceneId, x002084_g_scriptId, "Ta hi�n gi� ch�a c�n KNB", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
    elseif GetNumText() == 993 then
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		if (nMoneyJZ + nMoney <100000) then
			x002084_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� #G10v#W m� ��i KNB �? Kh�n th�?" )
			return
		end
		local reply = LuaFnCostMoneyWithPriority(sceneId,selfId,100000)
		if reply == -1 then
			x002084_NotifyFailTips( sceneId, selfId, "#G10v#W  m� c�ng ko c� sao? ngh�o qu�, �i ki�m �i r�i quay v� ��y v�i ta." )
			x002084_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� #G10v#W m� ��i KNB �? Kh�n th�?" )
			return
		else
			local result =	YuanBao(sceneId,selfId,targetId,1,630)
			local str = "#PXin ch�c m�ng, c�c h� �� nh�n ���c #G630 KNB #Pv� m�t #G10v#W."
			x002084_NotifyFailTips( sceneId, selfId, str )
			x002084_NotifyFailBox( sceneId, selfId, targetId, str )
		end
	end
	if GetNumText() == 994 then
		BeginEvent( sceneId )
			AddText( sceneId, "Ь nh�n 3150 KNB c�n ph�i t�n #G50v#W. Ng߽i x�c nh�n chuy�n d�i ch�ng?" )
			AddNumText( sceneId, x002084_g_scriptId, "аng �", -1, 995)
			AddNumText( sceneId, x002084_g_scriptId, "Ta hi�n gi� ch�a c�n KNB", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
    elseif GetNumText() == 995 then
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		if (nMoneyJZ + nMoney <500000) then
			x002084_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� #G50v#W m� ��i KNB �? Kh�n th�?" )
			return
		end
		local reply = LuaFnCostMoneyWithPriority(sceneId,selfId,500000)
		if reply == -1 then
			x002084_NotifyFailTips( sceneId, selfId, "#G50v#W  m� c�ng ko c� sao? ngh�o qu�, �i ki�m �i r�i quay v� ��y v�i ta." )
			x002084_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� #G50v#W m� ��i KNB �? Kh�n th�?" )
			return
		else
			local result =	YuanBao(sceneId,selfId,targetId,1,3150)
			local str = "#PXin ch�c m�ng, c�c h� �� nh�n ���c #G3150 KNB #Pv� m�t #G50v#W."
			x002084_NotifyFailTips( sceneId, selfId, str )
			x002084_NotifyFailBox( sceneId, selfId, targetId, str )
		end
	end
	if GetNumText() == 996 then
		BeginEvent( sceneId )
			AddText( sceneId, "Ь nh�n 6300 KNB c�n ph�i t�n #G100v#W. Ng߽i x�c nh�n chuy�n d�i ch�ng?" )
			AddNumText( sceneId, x002084_g_scriptId, "аng �", -1, 997)
			AddNumText( sceneId, x002084_g_scriptId, "Ta hi�n gi� ch�a c�n KNB", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
    elseif GetNumText() == 997 then
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		if (nMoneyJZ + nMoney <1000000) then
			x002084_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� #G100v#W m� ��i KNB �? Kh�n th�?" )
			return
		end
		local reply = LuaFnCostMoneyWithPriority(sceneId,selfId,1000000)
		if reply == -1 then
			x002084_NotifyFailTips( sceneId, selfId, "#G100v#W  m� c�ng ko c� sao? ngh�o qu�, �i ki�m �i r�i quay v� ��y v�i ta." )
			x002084_NotifyFailBox( sceneId, selfId, targetId, "Kh�ng c� �� #G100v#W m� ��i KNB �? Kh�n th�?" )
			return
		else
			local result =	YuanBao(sceneId,selfId,targetId,1,6300)
			local str = "#PXin ch�c m�ng, c�c h� �� nh�n ���c #G6300 KNB #Pv� m�t #G100v#W."
			x002084_NotifyFailTips( sceneId, selfId, str )
			x002084_NotifyFailBox( sceneId, selfId, targetId, str )
		end
	end
	if GetNumText() == 0 then
		x002084_CheckCDKey( sceneId, selfId, targetId )
	elseif GetNumText() == x002084_g_Intro then
		x002084_Introduce( sceneId, selfId, targetId )
	elseif x002084_g_AwardList[GetNumText()] then
		x002084_GetAward( sceneId, selfId, targetId, GetNumText() )
	elseif GetNumText() == 8 then
		x002084_CheckNewUserCard(sceneId, selfId, targetId)
	elseif x002084_g_NewCardList[GetNumText()] then
		x002084_GetNewCardPrize( sceneId, selfId, targetId, GetNumText())
	elseif GetNumText() == 101 then
		x002084_AddNewUserCardNumText(sceneId,selfId,targetId)
	elseif GetNumText() == 201 then
		x002084_AddCDKeyNumText(sceneId, selfId, targetId)
	end
end

--**********************************
-- ��� CDKey
--**********************************
function x002084_CheckCDKey( sceneId, selfId, targetId )
	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 1 then
		return
	end

	--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		--x002084_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ�������Ƹ������޷��ټ���cdkey��" )
		--return
	--end

	--if GetLevel( sceneId, selfId ) >= 10 then
		--x002084_NotifyFailBox( sceneId, selfId, targetId, "    �Բ������Ѿ�����10�����޷������콱������" )
		--return
	--end

	CallScriptFunction( PRIZE_SCRIPT_ID, "AskCDKey", sceneId, selfId )

	-- ����Ϊ����ʹ��
	-- SetMissionFlag( sceneId, selfId, MF_GetAwardFlag, 1 )
end

--**********************************
-- ��� �Ƹ���
--**********************************
function x002084_CheckNewUserCard( sceneId, selfId, targetId )
	--if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 1 then
		--x002084_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ������cdkey���޷��ټ���Ƹ�����" )
		--return
	--end
	
	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    C�c h� �� k�ch ho�t th� t�i ph�, kh�ng c�n k�ch ho�t l�n n�a." )
		return
	end

	--if GetLevel( sceneId, selfId ) >= 10 then
		--x002084_NotifyFailBox( sceneId, selfId, targetId, "    ��ĵȼ��Ѿ�����10�����޷��ټ���Ƹ�����" )
		--return
	--end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, x002084_g_VirtualNew )
	if nItemNum > 0 then
		local ret = LuaFnDelAvailableItem( sceneId, selfId, x002084_g_VirtualNew, 1 )
		if ret < 1 then
			return
		end
		--�Ƹ��������⿨����
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    Xin ch�c m�ng! C�c h� �� k�ch ho�t th�nh c�ng th� t�i ph�, sau khi ��t c�p � nh�t �nh c� th� quay l�i ch� t�i h� l�nh th߷ng." )
	else
		--������Ƹ������Ž���
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2006 )
	end

	-- ����Ϊ����ʹ��
	--SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
end

--**********************************
-- �ƹ�Աϵͳ����
--**********************************
function x002084_Introduce( sceneId, selfId, targetId )
	x002084_NotifyFailBox( sceneId, selfId, targetId, "    Cdkey l� d�y s� ch�ng t�i cung c�p cho kh�ch h�ng, sau khi s� d�ng d�y s� n�y � k�ch ho�t, c� th� v�o tr� ch�i nh�n th߷ng, v� m�t nh�n v�t ch� c� th� k�ch ho�t m�t l�n m� th�i." )
end

--**********************************
-- ��CD-KEY��Ʒ
--**********************************
function x002084_GetAward( sceneId, selfId, targetId, grade )
	local awardInfo = x002084_g_AwardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- �����
	end

	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) ~= 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    Tam th�i ng߽i kh�ng th� l�nh ���c ph�n th߷ng" )
		return
	end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    �, ��ng c�p c�a ng߽i ch�a ��, ��i � ��ng c�p ��t t�i" .. awardInfo.needLevel .. "c�p l�i �n t�m ta" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    Thanh ��o c� ba l� c�a ng߽i �t nh�t c�n ph�i � l�i" .. awardInfo.PropBagSpaceNeed .. "�" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    Thanh t�i li�u ba l� c�a ng߽i �t nh�t c�n ph�i � l�i" .. awardInfo.MatBagSpaceNeed .. "�" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    Thanh nhi�m v� ba l� c�a ng߽i �t nh�t c�n ph�i � l�i" .. awardInfo.TaskBagSpaceNeed .. "�" )
		return
	end

	local itemSN, itemName, itemDesc, bBroadCast
	for i, row in awardInfo.itemAward.hashTable do
		local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( row )
		if itemSN > -1 then
			TryRecieveItem( sceneId, selfId, itemSN, 9 )								-- �Ų��¾�û����
		end
	end

	for i, itemSN in awardInfo.itemAward.itemList do
		TryRecieveItem( sceneId, selfId, itemSN, 9 )
	end

	if awardInfo.moneyReward > 0 then
		AddMoney( sceneId, selfId, awardInfo.moneyReward )
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x002084_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
end

--**********************************
-- ��Ƹ�����Ʒ
--**********************************
function x002084_GetNewCardPrize( sceneId, selfId, targetId, grade )
	local awardInfo = x002084_g_NewCardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- �����
	end

	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) ~= 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    Tam th�i ng߽i kh�ng th� l�nh ���c ph�n th߷ng" )
		return
	end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    �, ��ng c�p c�a ng߽i ch�a ��, ��i � ��ng c�p ��t t�i" .. awardInfo.needLevel .. "c�p l�i �n t�m ta" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    Thanh ��o c� ba l� c�a ng߽i �t nh�t c�n ph�i � l�i" .. awardInfo.PropBagSpaceNeed .. "�" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    Thanh t�i li�u ba l� c�a ng߽i �t nh�t c�n ph�i � l�i" .. awardInfo.MatBagSpaceNeed .. "�" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    Thanh nhi�m v� ba l� c�a ng߽i �t nh�t c�n ph�i � l�i" .. awardInfo.TaskBagSpaceNeed .. "�" )
		return
	end
	
	if grade == x002084_g_NewCard3 then
		if TryCreatePet(sceneId,selfId,1) <= 0 then
			x002084_NotifyFailBox( sceneId, selfId, targetId, "    Tr�n th� ng߽i mang �� �y, ng߽i c� th� th� m�t con tr�n th� � t�o ra v� tr� tr�ng" )
			return
		end
	end

	local itemSN, itemName, itemDesc, bBroadCast
	for i, row in awardInfo.itemAward.hashTable do
		local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( row )
		if itemSN > -1 then
			TryRecieveItem( sceneId, selfId, itemSN, 9 )								-- �Ų��¾�û����
		end
	end

	for i, itemSN in awardInfo.itemAward.itemList do
		TryRecieveItem( sceneId, selfId, itemSN, 9 )
	end

	if awardInfo.moneyReward > 0 then
		if grade == x002084_g_NewCard4 or grade == x002084_g_NewCard5 or grade == x002084_g_NewCard6 or grade == x002084_g_NewCard7 or grade == x002084_g_NewCard8 then
			ZengDian(sceneId,selfId,targetId,1,awardInfo.moneyReward)
		else
			AddMoney( sceneId, selfId, awardInfo.moneyReward )
		end
	end
	
	if grade == x002084_g_NewCard3 then
		local mItem = x002084_GetMenpaiTaoEquip(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
		LuaFnCreatePetToHuman(sceneId, selfId, 3359, 1, 0)
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x002084_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x002084_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x002084_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x002084_GetMenpaiTaoEquip(mid)
	if(mid == MP_SHAOLIN) then
		return 10500002
	elseif(mid == MP_MINGJIAO) then
		return 10500012
	elseif(mid == MP_GAIBANG) then
		return 10501002
	elseif(mid == MP_WUDANG) then
		return 10502002
	elseif(mid == MP_EMEI) then
		return 10503002
	elseif(mid == MP_XINGSU) then
		return 10503012
	elseif(mid == MP_DALI) then
		return 10505002
	elseif(mid == MP_TIANSHAN) then
		return 10504002
	elseif(mid == MP_XIAOYAO) then
		return 10504012
	else
		return 0
	end
	return 0
end
