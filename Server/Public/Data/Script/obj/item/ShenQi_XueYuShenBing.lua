-- ������[ QUFEI 2007-09-30 21:53 UPDATE BugID 25497 ]
-- �޸�[����΢ 2008.5.22 �����to� � 27c�i����]

-- �����ϳ��䷽
-- ItemID = 10300000~10305005(�����䷽)				10300100~10305202(102c�p����)
-- ResourceID = 30505900~30505905(�������)		30505906(�������7c�p)
-- 335134
-- ͨ����������������䷽�ϳ�����
-- ���Ͽ���ʹ��1��
-- ʹ�����ɾ������

-- �ýű������¶�c�i�ر����ܺ���: 
-- x335134_AbilityCheck		- ����ʹ�ü�麯��
-- x335134_AbilityProduce	-  �ϳɳɹ�,���������Լ�������Ʒ

-- �ű���
x335134_g_ScriptId	= 335134

-- ���ϱ� �������
x335134_g_Stuff			= { 30505900, 30505901, 30505902, 30505903, 30505904, 30505905, 30505906 }		-- ����΢ 2008.5.22 ����������7c�p 30505906

-- �䷽��
-- ����Ϊ�䷽ ID
-- abilityId: ����ܺ�
-- recipeLevel: �䷽��c�p
-- matTbl: ���䷽ʹ��to� � �������
--		matList:ĳc�i����to� � �����嵥
--		count:ʹ�øõ���to� � ����C�n to� � ����
-- Product: ��Ʒ
x335134_g_CompoundInfo			= {}
-- �����䷽�� �۽�����
x335134_g_CompoundInfo[419]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[1], count = 1, Product = 10300000, },
		{ matList = x335134_g_Stuff[2], count = 1, Product = 10300001, },
		{ matList = x335134_g_Stuff[3], count = 1, Product = 10300002, },
		{ matList = x335134_g_Stuff[4], count = 1, Product = 10300003, },
		{ matList = x335134_g_Stuff[5], count = 1, Product = 10300004, },
		{ matList = x335134_g_Stuff[6], count = 1, Product = 10300005, },
	},
}

-- �����䷽�� ��ˮ�޺�
x335134_g_CompoundInfo[420]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[1], count = 1, Product = 10302000, },
		{ matList = x335134_g_Stuff[2], count = 1, Product = 10302001, },
		{ matList = x335134_g_Stuff[3], count = 1, Product = 10302002, },
		{ matList = x335134_g_Stuff[4], count = 1, Product = 10302003, },
		{ matList = x335134_g_Stuff[5], count = 1, Product = 10302004, },
		{ matList = x335134_g_Stuff[6], count = 1, Product = 10302005, },
	},	
}

-- �����䷽�� �̺�����
x335134_g_CompoundInfo[421]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[1], count = 1, Product = 10305000, },
		{ matList = x335134_g_Stuff[2], count = 1, Product = 10305001, },
		{ matList = x335134_g_Stuff[3], count = 1, Product = 10305002, },
		{ matList = x335134_g_Stuff[4], count = 1, Product = 10305003, },
		{ matList = x335134_g_Stuff[5], count = 1, Product = 10305004, },
		{ matList = x335134_g_Stuff[6], count = 1, Product = 10305005, },
	},	
}

-- �����䷽�� �����ɷ�
x335134_g_CompoundInfo[422]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[1], count = 1, Product = 10304000, },
		{ matList = x335134_g_Stuff[2], count = 1, Product = 10304001, },
		{ matList = x335134_g_Stuff[3], count = 1, Product = 10304002, },
		{ matList = x335134_g_Stuff[4], count = 1, Product = 10304003, },
		{ matList = x335134_g_Stuff[5], count = 1, Product = 10304004, },
		{ matList = x335134_g_Stuff[6], count = 1, Product = 10304005, },
	},
}

----------------------------------------------------------------------------------------
-- ����΢ 2008.5.22 ���7��102c�p����
----------------------------------------------------------------------------------------
-- �����䷽�� ������ȸ
x335134_g_CompoundInfo[980]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10300100, },
	},
}
-- �����䷽�� ������ȸ1
x335134_g_CompoundInfo[981]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10300101, },
	},
}
-- �����䷽�� ������ȸ2
x335134_g_CompoundInfo[982]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10300102, },
	},
}


-- �����䷽�� ���̳�Ӱ
x335134_g_CompoundInfo[983]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10302100, },
	},
}
-- �����䷽�� ���̳�Ӱ1
x335134_g_CompoundInfo[984]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10302101, },
	},
}
-- �����䷽�� ���̳�Ӱ2
x335134_g_CompoundInfo[985]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10302102, },
	},
}

-- �����䷽�� �����ҹ
x335134_g_CompoundInfo[986]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303100, },
	},
}
-- �����䷽�� �����ҹ1
x335134_g_CompoundInfo[987]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303101, },
	},
}
-- �����䷽�� �����ҹ2
x335134_g_CompoundInfo[988]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303102, },
	},
}

-- �����䷽�� ���ط���
x335134_g_CompoundInfo[989]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301100, },
	},
}
-- �����䷽�� ���ط���1
x335134_g_CompoundInfo[990]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301101, },
	},
}
-- �����䷽�� ���ط���2
x335134_g_CompoundInfo[991]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301102, },
	},
}

-- �����䷽�� �󺺺��
x335134_g_CompoundInfo[992]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305100, },
	},
}
-- �����䷽�� �󺺺��1
x335134_g_CompoundInfo[993]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305101, },
	},
}
-- �����䷽�� �󺺺��2
x335134_g_CompoundInfo[994]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305102, },
	},
}

-- �����䷽�� ����Ǻ�
x335134_g_CompoundInfo[995]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303200, },
	},
}
-- �����䷽�� ����Ǻ�1
x335134_g_CompoundInfo[996]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303201, },
	},
}
-- �����䷽�� ����Ǻ�2
x335134_g_CompoundInfo[997]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303202, },
	},
}

-- �����䷽�� ������˪
x335134_g_CompoundInfo[998]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305201, },
	},
}

-- Bug ID����
-- �����䷽�� ������˪1
x335134_g_CompoundInfo[999]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305200, },
	},
}
-- �����䷽�� ������˪2
x335134_g_CompoundInfo[1000]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305202, },
	},
}

-- �����䷽�� ��������
x335134_g_CompoundInfo[1001]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301200, },
	},
}
-- �����䷽�� ��������1
x335134_g_CompoundInfo[1002]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301201, },
	},
}
-- �����䷽�� ��������2
x335134_g_CompoundInfo[1003]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301202, },
	},
}

-- �����䷽�� ���ξ��
x335134_g_CompoundInfo[1004]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10304100, },
	},
}
-- �����䷽�� ���ξ��
x335134_g_CompoundInfo[1005]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10304101, },
	},
}
-- �����䷽�� ���ξ��
x335134_g_CompoundInfo[1006]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10304102, },
	},
}
----------------------------------------------------------------------------------------
-- ����΢ 2008.5.22 ���7��102c�p����
----------------------------------------------------------------------------------------

-- ����C�n to� � �ռ�
x335134_g_BagSpace	= 1

-- ʹ���䷽��������ʱto� � ��ЧID
x335134_g_ImpactID = 152

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x335134_AbilityCheck( sceneId, selfId, recipeId )
	-- PrintStr("AbilityCheck...")
	
	local CompoundInfo = x335134_g_CompoundInfo[recipeId]
	
	--PushDebugMessage("CompoundInfo ="..CompoundInfo)
	 
	if not CompoundInfo then
		return OR_ERROR
	end

	-- ��ⱳ����ng����ng�пո�,û�пո�Ͳ��ܽ���
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < x335134_g_BagSpace then
		return OR_BAG_OUT_OF_SPACE
	end

	local abilityLevel = QueryHumanAbilityLevel( sceneId, selfId, CompoundInfo.abilityId )
	if abilityLevel < CompoundInfo.recipeLevel then
		return OR_NO_LEVEL
	end

	-- �ж�����to� � ������ng���㹻
	local i, matInfo, tblCount, bMatEnoughFlag, idx, MatSN, Count

	tblCount = getn( CompoundInfo.matTbl )
	bMatEnoughFlag = 0

	-- PrintStr("tblCount ="..tblCount)

	for i = 1, tblCount do
		
		Count = 0
		matInfo = CompoundInfo.matTbl[i]
		-- PrintStr("matInfo ="..matInfo.matList)
		if not matInfo then			
			print( "Exception: An unexpected value of the variable [i] in function [x335134_AbilityCheck], the value is ", i )
			-- PrintStr("not matInfo")
			return OR_STUFF_LACK
		end

		if not matInfo.matList then			
			print( "Exception: An unexpected value of the variable [matInfo] in function [x335134_AbilityCheck], the value is ", matInfo )
			--PrintStr("matInfo.matList")
			return OR_STUFF_LACK
		end		

		-- PrintStr("matList ="..matInfo.matList)
		
		MatSN = matInfo.matList
		-- PrintStr("MatSN ="..MatSN)
		Count = Count + LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )
		-- PrintStr("Count ="..Count)

		-- T�i ��������ж�,�Լ���ѭ������(�ر���ng�����ϳ�ԣʱ)
		if Count >= matInfo.count then
			bMatEnoughFlag = 1			
		end

		-- PrintStr("bMatEnoughFlag ="..bMatEnoughFlag)

		if bMatEnoughFlag == 1 then
			break
		end
	end

	if bMatEnoughFlag == 1 then
		return OR_OK
	end

	return OR_STUFF_LACK
end

----------------------------------------------------------------------------------------
--	������Ʒ
----------------------------------------------------------------------------------------
function x335134_AbilityProduce( sceneId, selfId, recipeId )
	-- PrintStr("AbilityProduce...")
	local CompoundInfo = x335134_g_CompoundInfo[recipeId]
	if not CompoundInfo then
		return OR_ERROR
	end

	-- ���Ĳ���
	local i, matInfo, tblCount, bMatEnoughFlag, idx, MatSN, Count, DelCount

	tblCount = getn( CompoundInfo.matTbl )
	bMatEnoughFlag = 0
	DelCount = 0

	for i = 1, tblCount do
		Count = 0
		matInfo = CompoundInfo.matTbl[i]
		if not matInfo then
			print( "Exception: An unexpected value of the variable [i] in function [x335134_AbilityCheck], the value is ", i )
			return OR_STUFF_LACK
		end

		if not matInfo.matList then
			print( "Exception: An unexpected value of the variable [matInfo] in function [x335134_AbilityCheck], the value is ", matInfo )
			return OR_STUFF_LACK
		end

		MatSN = matInfo.matList
		-- PrintStr("MatSN ="..MatSN)
		Count = Count + LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )

		-- T�i ��������ж�,�Լ���ѭ������(�ر���ng�����ϳ�ԣʱ)
		if Count >= matInfo.count then
			bMatEnoughFlag = 1			
		end

		-- PrintStr("bMatEnoughFlag ="..bMatEnoughFlag)

		if bMatEnoughFlag == 1 then
			Count = matInfo.count

			MatSN = matInfo.matList
			-- PrintStr("MatSN ="..MatSN)
			DelCount = LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )
			-- PrintStr("DelCount ="..DelCount)
			if DelCount > 0 then
				if DelCount > Count then
					DelCount = Count
				end

				LuaFnDelAvailableItem( sceneId, selfId, MatSN, DelCount )
				Count = Count - DelCount
				-- PrintStr("Count ="..Count)

				-- T�i ��������ж�,�Լ���ѭ������(�ر���ng�����ϳ�ԣʱ)
				if Count < 1 then
					bMatEnoughFlag = 2					
				end
			end
		end

		-- PrintStr("bMatEnoughFlag ="..bMatEnoughFlag)

		if bMatEnoughFlag == 1 then
			return OR_ERROR
		elseif bMatEnoughFlag == 2 then
			break
		end
	end
	
	if bMatEnoughFlag ~= 2 then
		return OR_STUFF_LACK
	end

	local bagidx = LuaFnTryRecieveItem( sceneId, selfId, matInfo.Product, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����							

	if bagidx < 0 then
		LuaFnAuditAbility(sceneId, selfId, CompoundInfo.abilityId, recipeId, 0)
		return OR_ERROR
	end

	-- PrintStr("Product ="..matInfo.Product)
	-- PrintStr("abilityId ="..CompoundInfo.abilityId)

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335134_g_ImpactID, 0 )

	-- ��¼ͳ����Ϣ				-- ����΢,102����. ���д�����ng��¼������־.
	LuaFnAuditShenQi(sceneId, selfId, matInfo.Product)
	local itemInfo = GetBagItemTransfer( sceneId, selfId, bagidx )

	local playername = GetName(sceneId, selfId)
	
	-- ����H� th�ng����				-- ����΢,102����.�����ng102c�p����,���淢��

	local shenJie = matInfo.matList
	local strText
	if shenJie == 30505906 then
		strText = format("#{DQSJ_20080512_09}#{_INFOMSG%s}#{DQSJ_20080512_10}#{_INFOUSR%s}#{DQSJ_20080512_11}", itemInfo, playername )	
	else
		strText = format("#{XYSB_92812}#{_INFOUSR%s}#P#{XYSB_92813}#{_INFOMSG%s}.", playername, itemInfo)	
	end	

	BroadMsgByChatPipe(sceneId,selfId, strText, 4)				 											

	-- ����H� th�ng����				-- ����΢,102����.�����ng102c�p����,���淢�� end

	LuaFnSendAbilitySuccessMsg( sceneId, selfId, CompoundInfo.abilityId, recipeId, matInfo.Product )
	LuaFnAuditAbility(sceneId, selfId, CompoundInfo.abilityId, recipeId, 1)
	return OR_OK
end

function x335134_ShowMsg( sceneId, selfId, strMsg)
	BeginEvent( sceneId )
		AddText( sceneId, strMsg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
