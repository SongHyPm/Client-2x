--生长 餴琺
--萤火虫
--脚本号712527
--水晶矿石1	0.6		2	0.3		3	0.1		皓石1%
--以20%概率 餴琺到副产品20103019,20103031,20103043,20103055 中to� 鸬 m祎 种,数量1	0.6		2	0.3		3	0.1
--等c1

--每次打开必定 鹫t 疬㧟to� 鸬 产品
x712527_g_MainItemId = 30501104
--可能 餴琺到to� 鸬 产品
x712527_g_SubItemId = 30501105
--副产品
x712527_g_Byproduct = {20103019,20103031,20103043,20103055}
--C 技能Id
x712527_g_AbilityId = 7
--C 技能等c
x712527_g_AbilityLevel = 0


--生成函数开始************************************************************************
--每c醝ItemBox中最多10c醝物品
function 		x712527_OnCreate(sceneId,growPointType,x,y)
	--放入ItemBox同时放入m祎 c醝物品
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x712527_g_MainItemId)	--每c醝生长 餴琺最少能 餴琺到m祎 c醝物品,这里直接放入itembox中m祎 c醝
	-- 鹫t 疬㧟1~100to� 鸬 随机数,用来放入主产品和副产品以及次要产品(宝石)
	--主产品1~60不放,61~90放1c醝,91~100放2c醝
	--副产品1~12放1c醝,13~18放2c醝,19~20放3c醝
	--次要产品(宝石)1放1c醝
	local ItemCount = random(1,4);
	for n = 1, ItemCount do
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x712527_g_MainItemId)
	end
	
	--放入次要产品
	if random(1,9) == 1 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x712527_g_SubItemId)
	end
end
--生成函数结束**********************************************************************


--打开前函数开始&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x712527_OnOpen(sceneId,selfId,targetId)
--Tr� v嘈�
-- 0 表示打开成功
	ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	res = x712527_OpenCheck(sceneId,selfId,ABilityID,AbilityLevel)
	return res
	end
--打开前函数结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--回收函数开始########################################################################
function	 x712527_OnRecycle(sceneId,selfId,targetId)
	-- 增加熟练度
		ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x712527_g_AbilityLevel)
		--Tr� v�1,生长 餴琺回收
		return 1
end
--回收函数结束########################################################################



--打开后函数开始@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x712527_OnProcOver( sceneId, selfId, targetId )
	--local ABilityID = GetItemBoxRequireAbilityID( sceneId, targetId )
	--CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, ABilityID, x712527_g_AbilityLevel )
	return 0
end
--打开后函数结束@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x712527_OpenCheck(sceneId,selfId,AbilityId,AbilityLevel)
	--检查生活技能等c
	if AbilityLevel<x712527_g_AbilityLevel then
		return OR_NO_LEVEL
	end
	--检查Tinh力
	--if GetHumanEnergy(sceneId,selfId)< (floor(x712527_g_AbilityLevel * 1.5 +2) * 2) then
	--	return OR_NOT_ENOUGH_ENERGY
	--end
	return OR_OK
end

--m祎 次创建多c醝宝箱to� 鸬 完成函数开始****************************************************
function x712527_OnTickCreateFinish( sceneId, growPointType, tickCount )
	--if(strlen(x712508_g_TickCreate_Msg) > 0) then
	--	--2006-8-22 14:37 等待晓健to� 鸬 server对话平台
	--	print( sceneId .. " Tr叨ng c鋘h s� "..x712508_g_TickCreate_Msg)
	--end
end
--m祎 次创建多c醝宝箱to� 鸬 完成函数结束****************************************************
