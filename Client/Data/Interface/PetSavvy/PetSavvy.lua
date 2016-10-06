-- PetSavvy.lua
-- 珍兽合成界面

local mainPet = { idx = -1, guid = { high = -1, low = -1 } }
local assisPet = { idx = -1, guid = { high = -1, low =-1 } }

local theNPC = -1													-- 功能 NPC
local MAX_OBJ_DISTANCE = 3.0

local currentChoose = -1

local moneyCosts = {													-- 索引是珍兽的当前悟性值
	[0] = 10000,
	[1] = 11000,
	[2] = 12100,
	[3] = 13310,
	[4] = 14641,
	[5] = 16105,
	[6] = 17716,
	[7] = 19487,
	[8] = 21436,
	[9] = 23579,
}

function PetSavvy_PreLoad()
	this : RegisterEvent( "UI_COMMAND" )
	this : RegisterEvent( "REPLY_MISSION_PET" )						-- 玩家从列表选定一只珍兽
	this : RegisterEvent( "UPDATE_PET_PAGE" )						-- 玩家身上的珍兽数据发生变化，包括增加一只珍兽
	this : RegisterEvent( "DELETE_PET" )							-- 玩家身上减少一只珍兽
	this : RegisterEvent( "OBJECT_CARED_EVENT" )					-- 关心 NPC 的存在和范围
	this:RegisterEvent("UNIT_MONEY");
	this:RegisterEvent("MONEYJZ_CHANGE")		--交子普及 Vega
end

function PetSavvy_OnLoad()
	PetSavvy_Clear()
end

function PetSavvy_OnEvent(event)
	if event == "UI_COMMAND" and tonumber( arg0 ) == 19820424 then	-- 打开界面
		if this : IsVisible() then									-- 如果界面开着，则不处理
			return
		end
		Pet : ShowPetList( 0 )
		PetSavvy_Clear()
		this : Show()

		local npcObjId = Get_XParam_INT( 0 )
		BeginCareObject( npcObjId )
		PetSavvy_SelfMoney:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")));
		PetSavvy_SelfJiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")));
		return
	end

	if event == "REPLY_MISSION_PET" and this : IsVisible() then		-- 玩家选了一只珍兽
		PetSavvy_SelectPet( tonumber( arg0 ) )
		PetSavvy_SelfMoney:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")));
		PetSavvy_SelfJiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")));
		return
	end

	if event == "UPDATE_PET_PAGE" and this : IsVisible() then		-- 玩家身上的珍兽数据发生变化，包括增加一只珍兽
		PetSavvy_UpdateSelected()
		PetSavvy_SelfMoney:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")));
		PetSavvy_SelfJiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")));
		return
	end

	if event == "DELETE_PET" and this : IsVisible() then			-- 玩家身上减少一只珍兽
		PetSavvy_UpdateSelected()
		PetSavvy_SelfMoney:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")));
		PetSavvy_SelfJiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")));
		return
	end

	if event == "OBJECT_CARED_EVENT" and this : IsVisible() then	-- 关心 NPC 的存在和范围
		if tonumber( arg0 ) ~= theNPC then
			return
		end

		--如果和NPC的距离大于一定距离或者被删除，自动关闭
		if arg1 == "distance" and tonumber( arg2 ) > MAX_OBJ_DISTANCE or arg1 == "destroy" then
			PetSavvy_Cancel_Clicked()
		end
		return
	end
	if (event == "UNIT_MONEY" and this:IsVisible()) then
		PetSavvy_SelfMoney:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY")));
	end
	if (event == "MONEYJZ_CHANGE" and this:IsVisible()) then
		PetSavvy_SelfJiaozi:SetProperty("MoneyNumber", tostring(Player:GetData("MONEY_JZ")));
	end
end

function PetSavvy_Choose_Clicked( type )
	if type == "main" then
		currentChoose = 1
		PetSavvy_Other_PetList1_Select : Disable()
		PetSavvy_Other_PetList2_Select : Enable()
	elseif type == "assis" then
		currentChoose = 2
		PetSavvy_Other_PetList1_Select : Enable()
		PetSavvy_Other_PetList2_Select : Disable()
	else
		return
	end

	-- 关一下再开，清空数据
	Pet : ShowPetList( 0 )
	Pet : ShowPetList( 1 )
end

function PetSavvy_OK_Clicked()
	-- 首先判定玩家是否放入需要提升的珍兽，如果没有放入NPC将会弹出对话并返回：
	if mainPet.idx == -1 then
	-- 请放入您要提升悟性等级的珍兽。
		ShowSystemTipInfo( "M秈 c醕 h� nh y陁 c c n鈔g cao nh th裞 th� qu� c黙 b課." )
		return
	end

	-- 判定玩家是否放入参与合成的珍兽，如果没有放入NPC将会弹出对话并返回：
	if assisPet.idx == -1 then
		-- 请放入您要参与合成的珍兽。
		ShowSystemTipInfo( "M秈 cho v鄌 th� qu� k猼 h䅟 m� c醕 h� mu痭 tham gia." )
		return
	end

	-- 判断辅助宠是否符合条件
	if PetSavvy_Check() == 0 then
		-- 如果不符合则返回
		return
	end

	-- 判定玩家的金钱是否足够，如果不够将会弹出对话。
	local savvy = Pet : GetSavvy( mainPet.idx )
	local cost = moneyCosts[savvy]
	if not cost then
		cost = 0
	end

	-- 您的金钱不足，请确认
	local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ");	--交子普及 Vega
	if selfMoney < cost then
		ShowSystemTipInfo( "Ng鈔 l唼ng c黙 c醕 h� kh鬾g 瘘, m秈 x醕 nh." )
		return
	end

	-- 发送 UI_Command 进行合成
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "PetSavvy" )
		Set_XSCRIPT_ScriptID( 800104 )
		Set_XSCRIPT_Parameter( 0, mainPet.guid.high )
		Set_XSCRIPT_Parameter( 1, mainPet.guid.low )
		Set_XSCRIPT_Parameter( 2, assisPet.guid.high )
		Set_XSCRIPT_Parameter( 3, assisPet.guid.low )
		Set_XSCRIPT_ParamCount( 4 )
	Send_XSCRIPT()
end

function PetSavvy_Cancel_Clicked()
	
	this:Hide()
end

function PetSavvy_Close()
	StopCareObject()
	Pet : ShowPetList( 0 )
	PetSavvy_Clear()
end

function PetSavvy_RemoveMainPet()
	if mainPet.idx ~= -1 then
		Pet : SetPetLocation( mainPet.idx, -1 )
	end

	mainPet.idx = -1
	mainPet.guid.high = -1
	mainPet.guid.low = -1
	PetSavvy_Pet1_Text : SetText( "" )
end

function PetSavvy_RemoveAssisPet()
	if assisPet.idx ~= -1 then
		Pet : SetPetLocation( assisPet.idx, -1 )
	end

	assisPet.idx = -1
	assisPet.guid.high = -1
	assisPet.guid.low = -1
	PetSavvy_Pet2_Text : SetText( "" )
end

function PetSavvy_Clear()
	PetSavvy_RemoveMainPet()
	PetSavvy_RemoveAssisPet()

	PetSavvy_Text2 : SetText( "#cFF0000T� l� th鄋h c鬾g" )
	PetSavvy_NeedMoney : SetProperty( "MoneyNumber", tostring( 0 ) )

	PetSavvy_OK : Disable()

	currentChoose = -1
	PetSavvy_Other_PetList1_Select : Enable()
	PetSavvy_Other_PetList2_Select : Enable()
end

function PetSavvy_Check()
	if mainPet.idx == -1 or assisPet.idx == -1 then
		return 0
	end

	if mainPet.idx == assisPet.idx then
		ShowSystemTipInfo( "M秈 cho v鄌 2 con tr鈔 th� kh醕 nhau." )
		return 0
	end

	-- 判定参与珍兽的携带等级是否大于等于需要提升的珍兽的携带等级，如果不是，则弹出对话并返回：
	local mainCarryLevel = Pet : GetTakeLevel( mainPet.idx )
	local assisCarryLevel = Pet : GetTakeLevel( assisPet.idx )
	if assisCarryLevel < mainCarryLevel then
		-- 您的参与合成的珍兽携带等级为a，必须要找携带等级大于等于b的才能参与合成。（a为参与合成珍兽的携带等级、b为需要提升的珍兽的携带等级）
		ShowSystemTipInfo( "C mang theo c黙 th� qu� c黙 c醕 h� khi tham gia li阯 k猼 l�" .. assisCarryLevel .. ", c t靘 鹌ng c mang theo l緉 h絥 ho bg" .. mainCarryLevel .. "m緄 c� th� tham gia h䅟 th鄋h" )
		return 0
	end

	-- 判定参与合成的珍兽的根骨是否大于等于需要提升的珍兽的悟性等级，如果判定不成立则弹出对话并返回：
	local savvy = Pet : GetSavvy( mainPet.idx )
	local con = Pet : GetBasic( assisPet.idx )
	if con < savvy then
		-- 参与合成的珍兽的根骨必须大于等于a（a为需要提升的珍兽的悟性等级）
		ShowSystemTipInfo( "C錸 c痶 c黙 th� qu� k猼 h䅟 tham gia b bu礳 ph鋓 bg ho nhi玼 h絥 " .. savvy .. "." )
		return 0
	end

	return 1
end

-- 计算成功率
function PetSavvy_CalcSuccOdds()
	if mainPet.idx == -1 then
		PetSavvy_Text2 : SetText( "#cFF0000T� l� th鄋h c鬾g" )
		PetSavvy_OK : Disable()
		return
	end

	succOdds = {													-- 索引是珍兽的当前悟性值
		[0] = 1000,
		[1] = 850,
		[2] = 750,
		[3] = 600,
		[4] = 200,
		[5] = 310,
		[6] = 310,
		[7] = 30,
		[8] = 70,
		[9] = 60,
	}

	local savvy = Pet : GetSavvy( mainPet.idx )
	local str = "#cFF0000 t� l� th鄋h c鬾g: "
	local odds = succOdds[savvy]
	if not odds then
		str = "Kh鬾g c� c醕h n鄌 th錸g c"
		PetSavvy_OK : Disable()
	else
		str = str .. math.floor( odds / 10 ) .. "%"
		PetSavvy_OK : Enable()
	end

	PetSavvy_Text2 : SetText( str )
end

-- 计算金钱消耗
function PetSavvy_CalcCost()
	if mainPet.idx == -1 then
		PetSavvy_NeedMoney : SetProperty( "MoneyNumber", tostring( 0 ) )
		return
	end

	local savvy = Pet : GetSavvy( mainPet.idx )
	local cost = moneyCosts[savvy]
	if not cost then
		cost = 0
	end

	PetSavvy_NeedMoney : SetProperty( "MoneyNumber", tostring( cost ) )
end

function PetSavvy_SelectPet( petIdx )
	if -1 == petIdx then
		return
	end

	local petName = Pet : GetPetList_Appoint( petIdx )
	local guidH, guidL = Pet : GetGUID( petIdx )

	-- 判断 petIdex 代表的是被提升的宠还是辅助宠
	-- 如果是被提升的宠
	if currentChoose == 1 then
		-- 如果原来已经选择了一个被提升的宠
		-- 则清空原来的数据
		PetSavvy_RemoveMainPet()

		-- XX 如果原来就有辅助宠并且辅助宠不符合新的条件
		-- XX 则清空辅助宠的数据
		-- 记录该宠的位置号、GUID
		mainPet.idx = petIdx
		mainPet.guid.high = guidH
		mainPet.guid.low = guidL

		-- 将珍兽名字填到文本框中
		PetSavvy_Pet1_Text : SetText( petName )

		-- 给珍兽上锁
		Pet : SetPetLocation( petIdx, 3 )
	-- 如果是辅助宠
	elseif currentChoose == 2 then
		if PlayerPackage:IsPetLock(petIdx) == 1 then
			PushDebugMessage("秀 th阭 kh骯 v緄 Tr鈔 Th�")
			return
		end
		-- XX 如果没有被提升的宠存在
		-- XX 则提示需要先放入被提升的宠并返回
		-- XX 判断辅助宠是否符合条件
		-- XX 如果不符合则返回
		-- 如果原来就有辅助宠
		-- 则清空原来的数据
		PetSavvy_RemoveAssisPet()

		-- 记录该宠的位置号、GUID
		assisPet.idx = petIdx
		assisPet.guid.high = guidH
		assisPet.guid.low = guidL

		-- 将珍兽名字填到文本框中
		PetSavvy_Pet2_Text : SetText( petName )

		-- 给珍兽上锁
		Pet : SetPetLocation( petIdx, 3 )
	end

	-- 更新金钱和几率显示
	PetSavvy_CalcSuccOdds()
	PetSavvy_CalcCost()
end

function PetSavvy_UpdateSelected()
	-- AxTrace( 0, 1, "mainPet.guid.high=".. mainPet.guid.high .. "mainPet.guid.low=" .. mainPet.guid.low )
	-- AxTrace( 0, 1, "assisPet.guid.high=".. assisPet.guid.high .. "assisPet.guid.low=" .. assisPet.guid.low )
	-- AxTrace( 0, 1, "mainPet.idx=" .. mainPet.idx .. "assisPet.idx=" .. assisPet.idx )
	-- 判断被选中的珍兽是否还在背包里
	if mainPet.idx ~= -1 then
		local newIdx = Pet : GetPetIndexByGUID( mainPet.guid.high, mainPet.guid.low )
		-- AxTrace( 0, 1, "newIdx=".. newIdx )

		-- 如果不在则删掉
		if newIdx == -1 then
			mainPet.idx = -1
			mainPet.guid.high = -1
			mainPet.guid.low = -1
			PetSavvy_Pet1_Text : SetText( "" )
		-- 否则判断珍兽的位置是否发生变化
		elseif newIdx ~= mainPet.idx then
			-- 如果发生变化则对位置进行更新
			mainPet.idx = newIdx
		end
	end

	-- 判断被选中的珍兽是否还在背包里
	if assisPet.idx ~= -1 then
		local newIdx = Pet : GetPetIndexByGUID( assisPet.guid.high, assisPet.guid.low )
		-- AxTrace( 0, 1, "newIdx=".. newIdx )

		-- 如果不在则删掉
		if newIdx == -1 then
			assisPet.idx = -1
			assisPet.guid.high = -1
			assisPet.guid.low = -1
			PetSavvy_Pet2_Text : SetText( "" )
		-- 否则判断珍兽的位置是否发生变化
		elseif newIdx ~= assisPet.idx then
			-- 如果发生变化则对位置进行更新
			assisPet.idx = newIdx
		end
	end
end

--=========================================================
--开始关心NPC，
--在开始关心之前需要先确定这个界面是不是已经有“关心”的NPC，
--如果有的话，先取消已经有的“关心”
--=========================================================
function BeginCareObject( objCaredId )
	theNPC = DataPool : GetNPCIDByServerID( objCaredId )
	if theNPC == -1 then
		PushDebugMessage("Ch遖 ph醫 hi畁 NPC")
		this : Hide()
		return
	end

	this : CareObject( theNPC, 1, "PetSavvy" )
end

--=========================================================
--停止对某NPC的关心
--=========================================================
function StopCareObject()
	this : CareObject( theNPC, 0, "PetSavvy" )
	theNPC = -1
end
