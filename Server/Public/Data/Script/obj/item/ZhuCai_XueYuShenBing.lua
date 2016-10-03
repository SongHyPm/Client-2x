-- ������[ QUFEI 2007-09-30 21:53 UPDATE BugID 25759 ]
-- �޸���[ ����΢ 2008.5.20 ���102c�p����to� � �ϳ��䷽ ]

-- Ѫԡ�����������to� � �ϳɻ���ʵ�� (�ĳ���ȷT�n)
-- ItemID = 30505800~30505805(��ç���)			30505806 102c�p����
-- 335135
-- ��������ɶȼ��������to� � �ϳ�
-- ��Ʒ����ʹ��1��
-- ʹ�����ɾ����Ʒ


--******************************************************************************
-- ���²���C�n ��ngC�n �޸�to� � ����
--******************************************************************************

--�ű��� (�ĳ���ȷ�ű���)
x335135_g_scriptId = 335135

-- ����ֵ (����Ҫ���д������ֵ)
x335135_g_CompleteValue = 5			-- ���������ɶ�			-- ����΢,102����.������Ե�����50,������ϵ���5����.
--x335135_g_MaxCompleteValue = 100-- ��������ɶ�����
x335135_g_MaxUseCount = 1				-- ���ʹ�ô���1��

--��׼Ч��ID (�ĳ���ĺϳ�to� � ��Ч)
--g_ImpactID = 0

--��ĺϳɶ�Ӧ��
x335135_g_ShenCaiTable = {{sjid=30505700,sfid=30505800,lrid=30505900},
													{sjid=30505701,sfid=30505801,lrid=30505901},
													{sjid=30505702,sfid=30505802,lrid=30505902},
													{sjid=30505703,sfid=30505803,lrid=30505903},
													{sjid=30505704,sfid=30505804,lrid=30505904},
													{sjid=30505705,sfid=30505805,lrid=30505905},
													{sjid=30505706,sfid=30505806,lrid=30505906},}		-- -- ����΢ 2008.5.20. 102c�p��������ͼ��.��ȱto� � ���7c�p,T�n m�ng th�n ph� c�p 7,�������7c�p.
x335135_g_MaxCompleteValue = {25,50,75,100,100,100,100}
-- ��ǰ���Ժϳ�to� � ���������
x335135_g_ShenCaiIndex = 0

-- ʹ����ç�������������ʱto� � ��ЧID
x335135_g_Impact_LevelUP = 47

-- �ϳɳ��������ʱto� � ��ЧID
x335135_g_Impact_Complete = 48

-- ����΢,102����
x335135_g_XinMang7JiInfo = "T�n m�ng th�n ph� c�p 7"

--******************************************************************************
-- ���ϲ���C�n ��ngC�n �޸�to� � ����
--******************************************************************************

--�ű�

--**********************************
--�¼��������
--**********************************
function x335135_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ��C�n C�i n�y �ӿ�,��Ҫ�����պ���
end

--**********************************
--C�i n�y ��Ʒto� � ʹ�ù�����ng�������ڼ���: 
--H� th�ng��T�i ִ�п�ʼʱ���C�i n�y ����to� � Tr� v�ֵ,���Tr� v�th�t b�i����Ժ���to� � ���Ƽ���to� � ִ��.
--Tr� v�1: ��������to� � ��Ʒ,���Լ������Ƽ���to� � ִ�У�Tr� v�0: ���Ժ���to� � ����.
--**********************************
function x335135_IsSkillLikeScript( sceneId, selfId)
	return 1	--C�i n�y �ű�C�n ����֧��
end

--**********************************
--����������: 
--H� th�ng��T�i ���ܼ��to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �������ͨ��,���Լ���ִ�У�Tr� v�0: �������th�t b�i,�жϺ���ִ��.
--**********************************
function x335135_OnConditionCheck( sceneId, selfId )
	-- PrintStr("OnConditionCheck...")
	
	--У��ʹ��to� � ��Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	--  �i�m����ǰ��T�i ʹ��to� � ��Ʒto� � tr� tay n�i
	local nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	
	
	--  �i�m����ǰ��T�i ʹ��to� � ��Ʒto� � ID
	local Item01 = LuaFnGetItemTableIndexByIndex(sceneId, selfId, nIndex)
	
	-- PrintStr("Item01 ="..Item01)
	
	-- ����΢ 2008.5.20. 102c�p��������ͼ��.��c�i��ç���.
	for i=1, 7 do				--for i=1, 6 do
		if Item01 == x335135_g_ShenCaiTable[i].sfid then
			x335135_g_ShenCaiIndex = i
			-- PrintStr("x335135_g_ShenCaiIndex ="..x335135_g_ShenCaiIndex)
			break
		end
		-- PrintStr("sfid ="..x335135_g_ShenCaiTable[i].sfid)
	end
	
	-- PrintStr("x335135_g_ShenCaiIndex ="..x335135_g_ShenCaiIndex)
		
	-- ����΢ 2008.5.20. 102c�p��������ͼ��.�����to� � ��ç���
	if Item01 < 30505800 or Item01 > 30505806 then			-- if Item01 < 30505800 or Item01 > 30505805 then
		local strNotice = "Ch� c� th� d�ng t�n m�ng th�n ph� h�p th�nh" -- ��ç���
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	-- PrintStr("sjid ="..x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid)
	
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid )
	if ItemCount < 1 then
		local strNotice = "Ng߽i c�n ".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- ��ȱto� � ���
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	local bagbegin = GetBasicBagStartPos(sceneId, selfId)
	local bagend   = GetBasicBagEndPos(sceneId, selfId)
	-- PrintStr("bagbegin ="..bagbegin)
	-- PrintStr("bagend ="..bagend)
	local ItemEX
	--  ��t ���c��ǰ���Ժϳ�to� � ��m�t c�i���T�i ������to� � λ��	
	local sjbagpos = -1
	for i=bagbegin, bagend do
		if LuaFnIsItemAvailable( sceneId, selfId, i ) == 1 then
			ItemEX = LuaFnGetItemTableIndexByIndex(sceneId, selfId, i)			
			if ItemEX == x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid then
				-- PrintStr("ItemEX ="..ItemEX)
				sjbagpos = i
				break
			end		
		end
	end
		
	-- PrintStr("sjbagpos ="..sjbagpos)
	
	if sjbagpos == -1 then
		local strNotice = "Ng߽i c�n ".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- ��ȱto� � ���
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	-- PrintStr("sjbagpos ="..sjbagpos)
	
	local CheckParam = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )   
	
	-- PrintStr("CheckParam ="..CheckParam)
	
	if CheckParam < x335135_g_MaxCompleteValue[x335135_g_ShenCaiIndex] and CheckParam + x335135_g_CompleteValue >= x335135_g_MaxCompleteValue[x335135_g_ShenCaiIndex] then		-- �������ȴﵽ100ʱ��ng���пռ�
		local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
		if( FreeSpace < 1 ) then
	     local strNotice = "� ��o c� kh�ng c� kh�ng gian, c�n s�a sang l�i."
		   x335135_ShowMsg( sceneId, selfId, strNotice)
	     return 0
		end
	end
	
	
	-- ����΢,102����.���ʹ��to� � ��ngT�n m�ng th�n ph� c�p 7
	if Item01 == 30505806 then
		x335135_g_XinMang7JiInfo = GetBagItemTransfer( sceneId, selfId, nIndex )
		--PrintStr(x335135_g_XinMang7JiInfo)
	end
	
	
	return 1; --��C�n �κ�����,����ʼ��Tr� v�1.
end

--**********************************
--���ļ�⼰�������: 
--H� th�ng��T�i ��������to� � ʱ�� �i�m����C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: ���Ĵ���ͨ��,���Լ���ִ�У�Tr� v�0: ���ļ��th�t b�i,�жϺ���ִ��.
--ע��: �ⲻ�⸺������to� � ���Ҳ��������to� � ִ��.
--**********************************
function x335135_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--ֻ��ִ��m�t �����: 
--������˲�����ܻ�T�i ������ɺ����C�i n�y �ӿ�(�����������Ҹ���������Th�a m�nto� � ʱ��),������
--����Ҳ��T�i ������ɺ����C�i n�y �ӿ�(����to� � m�t ��ʼ,���ĳɹ�ִ��֮��).
--Tr� v�1: ����ɹ���Tr� v�0: ����th�t b�i.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x335135_OnActivateOnce( sceneId, selfId )

	-- PrintStr("OnActivateOnce...")
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid )
	
	if ItemCount < 1 then
		local strNotice = "Ng߽i c�n ".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- ��ȱto� � ���
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	--  �i�m����ǰ��T�i ʹ��to� � ��Ʒto� � tr� tay n�i
	local nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	
	
	-- PrintStr("nIndex ="..nIndex)
	
	--  �i�m����ǰ��T�i ʹ��to� � ��Ʒto� � ID
	local Item01 = x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sfid
	
	-- PrintStr("Item01 ="..Item01)
	
	--����ѡ��to� � ��ç���
  -- ret = LuaFnDelAvailableItem(sceneId, selfId, Item01, 1)
	local bagbegin = GetBasicBagStartPos(sceneId, selfId)
	local bagend   = GetBasicBagEndPos(sceneId, selfId)
	-- PrintStr("bagbegin ="..bagbegin)
	-- PrintStr("bagend ="..bagend)
	local ItemEX
	--  ��t ���c��ǰ���Ժϳ�to� � ��m�t c�i���T�i ������to� � λ��	
	local sjbagpos = -1
	for i=bagbegin, bagend do
		if LuaFnIsItemAvailable( sceneId, selfId, i ) == 1 then
			ItemEX = LuaFnGetItemTableIndexByIndex(sceneId, selfId, i)			
			if ItemEX == x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid then
				-- PrintStr("ItemEX ="..ItemEX)
				sjbagpos = i
				break
			end		
		end
	end
		
	-- PrintStr("sjbagpos ="..sjbagpos)
	
	if sjbagpos == -1 then
		local strNotice = "Ng߽i c�n ".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- ��ȱto� � ���
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	--  ��t ���c��ǰ�ϳ�to� � ���������	
	local CompleteValue = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )
	-- PrintStr("CompleteValue ="..CompleteValue)

	if nIndex >= 0 then		
		
		-- ��¼ͳ����Ϣ
		LuaFnAuditShenCai(sceneId, selfId, Item01)
		
		CompleteValue = CompleteValue + x335135_g_CompleteValue
		
		-- PrintStr("CompleteValue ="..CompleteValue)
		
		SetBagItemParam( sceneId, selfId, sjbagpos, 8, 2, CompleteValue ) --������ɶ�
		
		-- ����΢,2008.5.22 �������H� th�ng����	#IS� d�ng m�t c�i��ç���#G7c�p#I,�����ɾ��������ֽ���m�t ��.
		if Item01 == 30505806 then
			local playername = GetName(sceneId, selfId)	
			local strText = format("#{_INFOUSR%s}#{DQSJ_20080512_12}#{_INFOMSG%s}#{DQSJ_20080512_13}", playername, x335135_g_XinMang7JiInfo)						
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		end
		
		--------------�������ð�ȫ�Լ��,��Ȼ�����ϲ������ò���th�t b�i
		local CheckParam = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )   
				
		-- PrintStr("CheckParam ="..CheckParam)
				
		if CheckParam ~= CompleteValue then
		    return 0
		end		
		--------------�������ð�ȫ�Լ��,��Ȼ�����ϲ������ò���th�t b�i
		
		local strNotice = "C�a ng߽i ".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}".."Хy �� � gia t�ng 1 r�i" -- ��ȱto� � ���
		x335135_ShowMsg( sceneId, selfId, strNotice)
		
		LuaFnRefreshItemInfo( sceneId, selfId, sjbagpos )	--ˢ�±�����Ϣ
		
		if CompleteValue >= x335135_g_MaxCompleteValue[x335135_g_ShenCaiIndex] then		-- �������ȴﵽ100ʱ
					
			local EraseRet = EraseItem( sceneId, selfId, sjbagpos )
			
			if EraseRet < 0 then      --���ɾ��th�t b�i,����������κ�Ч��			  
					return 0
			end
			
			-- PrintStr("lrid ="..x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid)
			
			BeginAddItem( sceneId )
			AddItem( sceneId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid, 1 )
			ret = EndAddItem( sceneId, selfId )
											
			if ret > 0 then
				TryRecieveItem( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����							
				
			else
					BeginEvent(sceneId)
					strText = "� ��o c� ho�c nguy�n li�u kh�ng �� kh�ng gian, th�nh s�a sang l�i sau l�i �n l�nh."
					AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return 0
			end		
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335135_g_Impact_Complete, 0 )
		else
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335135_g_Impact_LevelUP, 0 )
		end
		
	else
		local strMsg = "H�p th�nh th�t b�i"
		x335135_ShowMsg( sceneId, selfId, strMsg)
		return 0
	end
  
	-- ���ĺϳ����

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--���������������: 
--�������ܻ�T�i ÿ����������ʱ����C�i n�y �ӿ�.
--Tr� v�: 1�����´�������0: �ж�����.
--ע: ������ng������Чm�t ��to� � ���
--**********************************
function x335135_OnActivateEachTick( sceneId, selfId )
	return 1
end

--**********************************
--ֱ��Hu� b�Ч��: 
--H� th�ng��ֱ�ӵ���C�i n�y �ӿ�,������C�i n�y ����to� � Tr� v�ֵX�c nh�n�Ժ�to� � ������ng��ִ��.
--Tr� v�1: �Ѿ�Hu� b���ӦЧ��,����ִ�к���������Tr� v�0: û�м�⵽���Ч��,����ִ��.
function x335135_CancelImpacts( sceneId, selfId )
	return 0		--��C�n C�i n�y �ӿ�,��Ҫ�����պ���,����ʼ��Tr� v�0.
end

function x335135_ShowMsg( sceneId, selfId, strMsg)
	BeginEvent( sceneId )
		AddText( sceneId, strMsg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
