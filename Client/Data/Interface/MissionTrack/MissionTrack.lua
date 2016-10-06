-- 任务跟踪   author：houzhifang

local g_strWndName = "MissionTrack";

local g_dlgctrls = {};              --控件集合, noused
local MissionPucker = {};           --任务类型折叠标记, 1为不折叠, 0为折叠
local g_nNowCheck = 0;              --0:初始化，1:已接任务，2：可接任务
local g_LockState = 0;              --0:未锁定，1：已锁定
local LEVEL_TO_MY_LEVEL = 10000;    --如果任务等级为该值, 则玩家当前等级就是任务等级
local g_Temp_Mylevel = 1;           --一个玩家等级的临时变量, 主要用于擂台场景, 玩家等级是0的情况

local g_DiFu_Scene_Id = 77;         --地府场景ID
local g_nMissionNum = 20;           --最大任务个数

--TT53675对所有不符合规范，没有将missionparam第0位做为任务完成标志的任务脚本做特殊处理,需要特殊处理的任务脚本号列表：
local SpecialMissionList = {200006,200031}

--用于保留界面原始尺寸和位置信息
local g_MissionTrack_Frame_UnifiedSize;
local g_MissionTrack_Frame_UnifiedXPosition;
local g_MissionTrack_Frame_UnifiedYPosition;
local g_MissionTrack__Frame_AbsolutePosition;
local g_MissionTrack__Frame_AbsoluteSize;
local g_MissionTrack_Function_Frame_AbsolutePosition;
local g_MissionTrack_DragTitle_AbsolutePosition;
local g_MissionTrack_Close_AbsolutePosition;
local g_MissionTrack__CheckBox_Frame_AbsolutePosition;
local g_MissionTrack_Lock_AbsolutePosition;
local g_MissionTrack_UnLock_AbsolutePosition;

--
function MissionTrack_PreLoad()
    this:RegisterEvent("OPEN_WINDOW");
    this:RegisterEvent("CLOSE_WINDOW");
    this:RegisterEvent("PACKAGE_ITEM_CHANGED");
    this:RegisterEvent("OPEN_MISSION_TRACK");
    this:RegisterEvent("UPDATE_MISSION_TRACK");
    this:RegisterEvent("UPDATE_WILLGET_MISSION_TRACK");

    this:RegisterEvent("TRACK_ALPHA_ACTION");
    this:RegisterEvent("UNIT_LEVEL"); --玩家升级的时候更新可接列表
    this:RegisterEvent("ADJEST_UI_POS")
    this:RegisterEvent("ADJEST_UI_RELATION_POS")
end

--  界面初次加载时初始化所有类型任务都是非折叠的, 并保存界面尺寸和位置信息
function MissionTrack_OnLoad()
    local i=1;
    for i=1,200 do
        MissionPucker[i] = 1;
    end;
    MissionTrack_Lock:Show();
    MissionTrack_UnLock:Hide();
    MissionTrack_ShowORHideFunc(0);

    g_MissionTrack_Frame_UnifiedSize = MissionTrack_Frame:GetProperty("UnifiedSize");
    g_MissionTrack_Frame_UnifiedXPosition = MissionTrack_Frame:GetProperty("UnifiedXPosition");
    g_MissionTrack_Frame_UnifiedYPosition = MissionTrack_Frame:GetProperty("UnifiedYPosition");
    g_MissionTrack__Frame_AbsolutePosition = MissionTrack__Frame:GetProperty("AbsolutePosition");
    g_MissionTrack__Frame_AbsoluteSize = MissionTrack__Frame:GetProperty("AbsoluteSize");
    g_MissionTrack_Function_Frame_AbsolutePosition = MissionTrack_Function_Frame:GetProperty("AbsolutePosition");
    g_MissionTrack_DragTitle_AbsolutePosition = MissionTrack_DragTitle:GetProperty("AbsolutePosition");
    g_MissionTrack_Close_AbsolutePosition = MissionTrack_Close:GetProperty("AbsolutePosition");
    g_MissionTrack__CheckBox_Frame_AbsolutePosition = MissionTrack_CheckBox_Frame:GetProperty("AbsolutePosition");
    g_MissionTrack_Lock_AbsolutePosition = MissionTrack_Lock:GetProperty("AbsolutePosition");
    g_MissionTrack_UnLock_AbsolutePosition = MissionTrack_UnLock:GetProperty("AbsolutePosition");

end

--  事件处理, 基本没有可剔除的冗余部分, 就结构来看, 比较清晰
function MissionTrack_OnEvent(event)
    if(event == "OPEN_WINDOW") then
        if( arg0 == "MissionTrack") then
            this:Show();
            MissionTrack_ShowORHideFunc(0);
            MissionTrack_UpdateHaveGetMission(-1);
            DataPool:UpdateTrackStateButton(0);
        end
    elseif(event == "CLOSE_WINDOW") then
        if( arg0 == "MissionTrack") then
            this:Hide();
        end
    elseif (event == "PACKAGE_ITEM_CHANGED") then
        if not this:IsVisible() then
            return;
        end
        if (g_nNowCheck == 1) then
            MissionTrack_UpdateHaveGetMission(-1);
        end
    elseif (event == "OPEN_MISSION_TRACK") then
        --local nMissionTrackShow = DataPool:IsTrackFuncShow(1);
        --if (nMissionTrackShow > 0) then
        --    AxTrace(0, 0, "11111111111111111");
            local nType = tonumber(arg0);
            if (nType == 1) then
                this:Show();
                MissionTrack_ShowORHideFunc(0);
                MissionTrack_UpdateHaveGetMission(-1);
                DataPool:UpdateTrackStateButton(0);
            end
        --end
    elseif (event == "UPDATE_MISSION_TRACK") then
        if not this:IsVisible() then
            return;
        end
        if (g_nNowCheck == 1) then
            local nSelect = tonumber(arg0)
            MissionTrack_UpdateHaveGetMission(nSelect);
        end
    elseif (event == "UPDATE_WILLGET_MISSION_TRACK" or event == "UNIT_LEVEL") then
        if not this:IsVisible() then
            return;
        end
        if (g_nNowCheck == 2) then
            MissionTrack_UpdateWillGet();
        end
    elseif (event == "TRACK_ALPHA_ACTION") then
        MissionTrack_SetAlpha(arg0)
    elseif (event == "ADJEST_UI_POS") then
        local nCurX = MissionTrack_Frame:GetProperty("AbsoluteXPosition")
        local nCurY = MissionTrack_Frame:GetProperty("AbsoluteYPosition")
        local nCurWidht    = MissionTrack_Frame:GetProperty("AbsoluteWidth")
        local nCurHeigh    = MissionTrack_Frame:GetProperty("AbsoluteHeight")
        local nScreenMaxWidht = tonumber(arg0)
        local nScreenMaxHeigh = tonumber(arg1)
        if (nCurX+nCurWidht > nScreenMaxWidht or nCurY+nCurHeigh > nScreenMaxHeigh) then
            MissionTrack_On_Reset()
            --同时调整CampaignTrack界面
            AdjustUIPos("CampaignTrack")
        end
    elseif (event == "ADJEST_UI_RELATION_POS") then
        if (arg0 == "MissionTrack" ) then
            MissionTrack_On_Reset()
        end
    end
end

--  更新玩家已接的任务
--  如果 nSelectMissionID 不为 -1 则会在更新结束后将列表定位到指定的任务位置处
function MissionTrack_UpdateHaveGetMission(nSelectMissionID)
    local i = 1;
    --unused
    --local nMyLevel = Player:GetData( "LEVEL" );

    --  记录当前列表所指向的位置
    local nNowFirstItem;
    nNowFirstItem = MissionTrack_ListBoxTransparent:GetCurrentFirstItem();

    --  将界面状态切换为 已接任务 跟踪
    MissionTrack_HaveGet:SetCheck(1);
    MissionTrack_WillGet:SetCheck(0);
    g_nNowCheck = 1;

    --  清除列表内容
    MissionTrack_ListBoxTransparent:ClearListBoxEx();

    --  用 g_nMissionNum 替代
    --local nMissionNum = 20
    local color;

    --  填充任务信息
    for i=1,g_nMissionNum do
        if (DataPool:GetPlayerMission_InUse(i-1) == 1) then
            DataPool:GetPlayerMission_Description(i-1);
        end
    end;

    --unused
    --local k = 0;
    --声明转到for循环之内
    --local Sequence_OnefoldGenre = {}
    --  已接任务跟踪总表
    local Sequence_Assemble = {}
    --成为MissionTrack_GroupHaveGetMission的临时变量了
    --local Constitutes = {};
    --unused
    --local MissionTitles = {};

    for j=1, 200 do
        --  将获取相同分组的任务抽成函数, 便于阅读和维护
        local Sequence_OnefoldGenre = MissionTrack_GroupHaveGetMission( j, {} );
        
        ----
        table.sort(Sequence_OnefoldGenre,MissionTrack_CompareTable)
        
        --  将该类型的一组数据, 插入到总表中
        for i,n in ipairs(Sequence_OnefoldGenre) do
            table.insert(Sequence_Assemble,n)
        end
        --notused
        --Sequence_OnefoldGenre = {};
        ----
    end

    --  遍历已接任务跟踪总表, 将数据插入到显示列表中
    local Per_Segment,xxxx,i,j;
    for i,Per_Segment in ipairs(Sequence_Assemble) do
        local nMissionTrackType = DataPool:GetPlayerMissionTrackType(Per_Segment[2]);
        if (Per_Segment[3] ~= "" and nMissionTrackType > 0) then
            local nIsMissionTrackOpen = DataPool:IsMissionTrackOpen(Per_Segment[2]);
            if (nIsMissionTrackOpen > 0) then
                --  这一部分只添加了任务的名称
                MissionTrack_ListBoxTransparent:AddItemExWithoutLayout(Per_Segment[1],Per_Segment[2], 3, Per_Segment[3],4)
                --  这一部分实际添加了任务的达成方式和相关目标完成情况的数据统计
                MissionTrack_AddMissionTrackInfo(Per_Segment[2], nMissionTrackType, Per_Segment[5]);
            end
        elseif (tonumber(Per_Segment[4]) == 0) then
            MissionTrack_ListBoxTransparent:AddItemExWithoutLayout(Per_Segment[1],Per_Segment[2], 0);
        end
    end
    MissionTrack_ListBoxTransparent:RequestLayout();

    --  更新任务追踪列表的显示位置
    if (nSelectMissionID ~= -1) then
        local itemNum = MissionTrack_ListBoxTransparent:GetItemNumByMissionId(nSelectMissionID);
        if( itemNum ~= -1) then
            MissionTrack_ListBoxTransparent:SetCurrentFirstItem(itemNum);
        else
            MissionTrack_ListBoxTransparent:SetCurrentFirstItem(nNowFirstItem);
        end
        MissionTrack_ListBoxTransparent:SetItemSelectByItemID(nSelectMissionID);
    else
        MissionTrack_ListBoxTransparent:SetCurrentFirstItem(nNowFirstItem);
    end

    --QuestLog_Amount : SetText( k .. "/" .. nMissionNum);
---
    --QuestLog_ListBox_SelectChanged();

    --if Current_Clicked ~= -1 then
    --    --QuestLog_Listbox : EnsureItemIsVisable(Current_Clicked);
    --    QuestLog_Listbox : SetCurrentFirstItem(Current_Clicked);
    --    Current_Clicked = -1
    --end
end

--  增加已接任务的详细追踪信息
function MissionTrack_AddMissionTrackInfo(nMissionIndex, nMissionTrackType, nFinished)
    --unused
    --local nNewIndex = nMissionIndex+200;
    local color = "FFCCCCCC";
    
    --任务变量索引
    local MissionParam_Index = 0;
    local strTarget = "";

    local strFinishNPC, strFinishSceneName, nFinishSceneID, nFinishX, nFinishY = DataPool:GetMissionFinishInfo(nMissionIndex);
    --PushDebugMessage(strFinishNPC);
    --PushDebugMessage(nFinished);
    if (nFinished == 1 and strFinishNPC ~= "") then       --已完成的任务
        --if (strFinishNPC ~= "") then
            --local strTemp = string.format("   #W去#G%s#W找#R%s#{_INFOAIM%d,%d,%d,%s}#W", strFinishSceneName, strFinishNPC, nFinishX, nFinishY, nFinishSceneID, strFinishNPC);
            local strTemp = "";
            local nIndex = DataPool:GetPlayerMission_Display(nMissionIndex,7)--czf modify,2009.08.26
            if nIndex == 1018870 then
                strTemp = string.format("   #W去#G%s#W找#R%s#W", strFinishSceneName, strFinishNPC);
            elseif nIndex == 210273 then
                strTemp = "#{XSRW_100313_01}"
            elseif nIndex == 210257 then
                strTemp = "#{XSRW_100313_02}"
            elseif nIndex == 210264 then
                strTemp = "#{XSRW_100313_03}"
            elseif nIndex == 210265 then
                strTemp = "#{XSRW_100313_04}"
            elseif nIndex == 210269 then
                strTemp = "#{XSRW_100313_05}"
            elseif nIndex == 600047 or nIndex == 600048 or nIndex == 600049 then        --帮派任务 for:TT 64489
                strTemp = string.format("   #W去找#R%s",    strFinishNPC);
            else
                strTemp = string.format("   #W去#G%s#W找#R%s#{_INFOAIM%d,%d,%d,%s}", strFinishSceneName, strFinishNPC, nFinishX, nFinishY, nFinishSceneID, strFinishNPC);
            end
            strTarget = strTemp;
        --end
    else    --未完成的任务
        --local nRound = DataPool:GetPlayerMission_Display(nMissionIndex,3);
        --if( nRound >= 0 ) then
        --    Mission_Variable = DataPool:GetPlayerMission_DataRound(nRound);
        --    if(Mission_Variable >= 0) then
        --        strTarget = "任务当前环数：#W"..tostring(Mission_Variable);
        --    end
        --end
            --显示任务银票数量
        --if( DataPool:GetPlayerMission_Display(nMissionIndex,4) > 0 ) then
        --    Mission_Variable = DataPool:GetPlayerMission_Variable(nMissionIndex,MissionParam_Index);
        --    MissionParam_Index = MissionParam_Index + 1;

        --    if(Mission_Variable >0) then
        --        silverdesc = DataPool:GetPlayerMission_BillName(nMissionIndex);
        --        strTarget = "需要得到金钱：#W"..tostring(Mission_Variable);
        --    end
        --end

        ---------------------------------------------------------------------------------------------------------------------------------------------------------
        --  这下面会根据任务的目标构造任务目标和完成情况数据, 每个目标一条
        --  没有特别需要更改的必要, 比较容易理解, 因此只是增加注释和必要的分割

        local strAppend = "";
        local Mission_Variable = 0;
        
        --非特殊任务, 需要忽略第一个任务参数  
        if MissionTrack_IsSpecialMission(nMissionIndex)==0 then
            MissionParam_Index = MissionParam_Index + 1;
        end

        ---------------------------------------------------------------------------------------------------------------------------------------------------------
        --  下面这四大块是在构造任务目标的完成情况

        --任务需要杀的npc
        local nDemandKillNum,Kill_Random_Type = DataPool:GetPlayerMissionDemandKill_Num(nMissionIndex);
        if( nDemandKillNum > 0 ) then
            strAppend = "   #W已杀死：";
            for i=1, nDemandKillNum do
                --  需要的NPC, 需要的数量
                local nNPCName, nNum = DataPool:GetPlayerMissionDemand_NPC(i-1,Kill_Random_Type,nMissionIndex);
                --  实际获得的数量
                Mission_Variable = DataPool:GetPlayerMission_Variable(nMissionIndex,MissionParam_Index,Kill_Random_Type,i-1);
                --
                MissionParam_Index = MissionParam_Index + 1;

                --  根据不同条件决定如何显示目标完成情况
                if (i == 1 and nDemandKillNum > 1) then
                    strAppend = strAppend.."#W"..nNPCName.."："..tostring(Mission_Variable).."/"..tostring(nNum).."#r";
                elseif (i == 1 and nDemandKillNum == 1) then
                    strAppend = strAppend.."#W"..nNPCName.."："..tostring(Mission_Variable).."/"..tostring(nNum);
                elseif( i == nDemandKillNum) then
                    strAppend = strAppend.."#W            "..nNPCName.."："..tostring(Mission_Variable).."/"..tostring(nNum);
                else
                    strAppend = strAppend.."#W            "..nNPCName.."："..tostring(Mission_Variable).."/"..tostring(nNum).."#r";
                end
                --unused
                --nNewIndex = nNewIndex + 1;
            end
        end

        --任务需要的物品
        local nDemandNum,Item_Random_Type= DataPool:GetPlayerMissionDemand_Num(nMissionIndex);
        if( nDemandNum > 0 ) then
            if(Item_Random_Type == -100) then
                strAppend = "   #W已提交：";
                --unused
                --nNewIndex = nNewIndex + 1;
                Item_Random_Type = 0
            else
                strAppend = "   #W已得到：";
                --unused
                --nNewIndex = nNewIndex + 1;
            end
        end

        for i=1, nDemandNum do
            --    需要的类型，需要物品ID，需要多少个
            local szName,nItemID, nNum = DataPool:GetPlayerMissionDemand_Item(i-1,Item_Random_Type,nMissionIndex);
            --  背包中已经有的数量
            Mission_Variable = DataPool : GetPlayerMission_ItemCountNow(nItemID)

            if Mission_Variable > nNum then
                Mission_Variable = nNum
            end

            --  JOY: 这里的想法是要检查任务是否已经完成了... 但这个逻辑应该是有误的
            local Mission_Variable2 = DataPool:GetPlayerMission_Variable(nMissionIndex,0);
            if Mission_Variable2 > 0 then
                Mission_Variable = nNum
            end

            --
            if (i == 1 and nDemandNum > 1) then
                strAppend = strAppend.."#W"..szName..":"..tostring(Mission_Variable).."/"..tostring(nNum).."#r";
            elseif(i == 1 and nDemandNum == 1) then
                strAppend = strAppend.."#W"..szName..":"..tostring(Mission_Variable).."/"..tostring(nNum);
            elseif(i == nDemandNum) then
                strAppend = strAppend.."#W            "..szName..":"..tostring(Mission_Variable).."/"..tostring(nNum);
            else
                strAppend = strAppend.."#W            "..szName..":"..tostring(Mission_Variable).."/"..tostring(nNum).."#r";
            end
        end

        --任务自定义的物品
        local nCustomNum = DataPool:GetPlayerMissionCustom_Num(nMissionIndex);
        for i=1, nCustomNum do
            --    需要的物品, 需要的数量
            local strCustom, nNum = DataPool:GetPlayerMissionCustom(i-1);
            --  已经获得的数量
            Mission_Variable = DataPool:GetPlayerMission_Variable(nMissionIndex,MissionParam_Index);
            AxTrace(0, 0, strCustom..tostring(Mission_Variable));
            MissionParam_Index = MissionParam_Index + 1;

            local strDot = "";
            if (i < nCustomNum) then
                strDot = "#r";
            end

            if nNum == 0 then
                strAppend = strAppend.."   " .. strCustom..strDot;
            else
                strAppend = strAppend.."   " .. strCustom .. " ： ".. Mission_Variable .. "/" .. nNum..strDot;
            end
        end

        --任务自定义的随机物品 zz添加
        local nRandomCustomNum = DataPool:GetPlayerMissionRandomCustom_Num(nMissionIndex);
        for i=1,nRandomCustomNum do
            --  需要的类型, 需要的数量, 获得的数量
            local strCustom, nNeedNum, nCompleteNum = DataPool:GetPlayerMissionRandomCustom(i-1,nMissionIndex);

            local strDot = "";
            if (i < nCustomNum) then
                strDot = "#r";
            end

            if nNeedNum == 0 then
                strAppend = strAppend..strCustom..strDot;
            else
                strAppend = strAppend..strCustom .. " ： ".. nCompleteNum .. "/" .. nNeedNum..strDot;
            end
        end

        ---------------------------------------------------------------------------------------------------------------------------------------------------------
        --  下面这一部分, 主要构造如何达成任务目标的说明, 并在该说明之后加上当前任务的完成情况统计

        local strTemp = "";
        strTarget = "";

        --脚本任务，直接读取任务跟踪信息
        if (nMissionTrackType == 1) then   
            strTarget = DataPool:GetLuaMissionTrackInfo(nMissionIndex);
            if (strAppend ~= "") then
                strTarget = "   #W" .. strTarget.."#r#W"..strAppend;
            else
                strTarget = "   #W" .. strTarget;
            end

        --表格送物任务，根据不同类型进行文字匹配
        elseif(nMissionTrackType == 2) then   
            local strNPCName, strSceneName, nTargetScene, nPosX, nPosY = DataPool:GetDeliveryMissionTrackInfo(nMissionIndex);
            if (strNPCName ~= "") then
                -- 英雄任务对应 场景为-1
                local strTemp = "";
                if(nTargetScene ~= -1) then
                    --strTemp = string.format("   #W去#G%s#W找#R%s#{_INFOAIM%d,%d,%d,%s}#W", strSceneName, strNPCName, nPosX, nPosY, nTargetScene, strNPCName);
                    local nIndex = DataPool:GetPlayerMission_Display(nMissionIndex,7)--czf modify,2009.08.26
                    if nIndex == 1018870 then
                        strTemp = string.format("   #W去#G%s#W找#R%s#W", strSceneName, strNPCName);
                    else
                        strTemp = string.format("   #W去#G%s#W找#R%s#{_INFOAIM%d,%d,%d,%s}", strSceneName, strNPCName, nPosX, nPosY, nTargetScene, strNPCName);
                    end
                else
                    strTemp = string.format("   #W去#G%s#W找#R%s#W", strSceneName, strNPCName);
                end
                strTarget = strTarget .. strTemp .. "#r";
            end
            if (strAppend ~= "") then
                strTarget = strTarget .. strAppend;
            end

         --表格配置杀怪任务
        elseif(nMissionTrackType == 3) then  
            local nMonsterNum = DataPool:GetKillMonsterMissionTrackInfo_num(nMissionIndex);
            if (nMonsterNum > 0) then
                for nn = 1, nMonsterNum do
                    local strMonsterName, strSceneName, nSceneId, nCount, nXpos, nYpos = DataPool:GetKillMonsterMissionTrackInfo_MonsterInfo(nMissionIndex, nn-1);
                    if(strMonsterName ~= "") then
                        local strTemp = "";
                        if(nSceneId ~= -1) then
                             strTemp = string.format("   #W去#G%s#W杀#R%s#{_INFOAIM%d,%d,%d,%s}#W", tostring(strSceneName),tostring(strMonsterName), tonumber(nXpos), tonumber(nYpos), tonumber(nSceneId), tostring(strMonsterName));
                        else
                             strTemp = string.format("   #W去#G%s#W杀#R%s#W", tostring(strSceneName),tostring(strMonsterName));
                        end
                        strTarget = strTarget .. strTemp;
                        strTarget = strTarget .. "#r";
                    end
                end
            end
            if (strAppend ~= "") then
                strTarget = strTarget .. strAppend;
            end

        --表格配置掉落任务
        elseif(nMissionTrackType == 4) then
            local nLootItemNum = DataPool:GetLootItemMissionTrackInfo_num(nMissionIndex);
            if(nLootItemNum > 0) then
                for nn = 1, nLootItemNum do
                    local strMonsterName, strSceneName, strItemName, nSceneID, nItemNum, xPos, yPos = DataPool:GetLootItemMissionTrackInfo_ItemInfo(nMissionIndex, nn-1);
                    if (strMonsterName ~= "") then
                        local strTemp = "";
                        if(nSceneID ~= -1) then
                             strTemp = string.format("   #W去#G%s#W杀#R%s#{_INFOAIM%d,%d,%d,%s}#W", strSceneName, strMonsterName, xPos, yPos, nSceneID, strMonsterName);
                        else
                             strTemp = string.format("   #W去#G%s#W杀#R%s#W", strSceneName, strMonsterName);
                        end
                        strTarget = strTarget .. strTemp;
                        strTarget = strTarget .. "#r";
                    end
                end
            end
            if (strAppend ~= "") then
                strTarget = strTarget .. strAppend;
            end

        --表格配置护送任务
        elseif (nMissionTrackType == 6) then
            local strObjName, strTargetNPC, strTargetScene, nTargetScene, xPos, yPos = DataPool:GetHusongMissionTrackInfo(nMissionIndex);
            if (strObjName ~= "") then
                local strTemp = "";
                if(nTargetScene ~= -1) then
                    strTemp = string.format("   #W到%s找#R%s#{_INFOAIM%d,%d,%d,%s}#W#r",strTargetScene, strTargetNPC, xPos, yPos, nTargetScene, strTargetNPC);
                else
                    strTemp = string.format("   #W到%s找#R%s#W",strTargetScene, strTargetNPC);
                end
                strTarget = strTarget .. strTemp;
            end
            if (strAppend ~= "") then
                strTarget = strTarget .. strAppend;
            end
        end
    end

    MissionTrack_ListBoxTransparent:AddItemExWithoutLayout(strTarget, nMissionIndex, 0, color, 4);
end

--  更新可接任务列表
function MissionTrack_UpdateWillGet()
    
    --  切换界面状态为 可接任务 追踪
    MissionTrack_HaveGet:SetCheck(0);
    MissionTrack_WillGet:SetCheck(1);
    g_nNowCheck = 2;

    --  这里需要用到玩家等级
    --  如果在擂台中到这里了不是会出事么?
    local nMyLevel = Player:GetData( "LEVEL" )
    MissionTrack_ListBoxTransparent:ClearListBoxEx();

    --  获得玩家所有可以接的任务
    CollectMissionOutline();

    --  依然是根据每个任务类型进行分类
    for iMissionType=1,200 do             --现任务类型一共200种
        local strOutlineName = "#cff9900" .. DataPool:GetMissionInfo_Kind( iMissionType );  --#gFE7E82
        
        --  原先应该是个 与 逻辑, 现在才是 或 逻辑
        --  不合法的任务类型数据, 继续检查下个任务
        if( strOutlineName == "" or strOutlineName == 0) then
            continue;
        end

        local iStart = iMissionType*10000;
        local DeployNum = GetMissionOutlineNum( iMissionType )
        --  可接任务数的判断可以提到外边去, 减少循环次数
           if( DeployNum <= 0 or iMissionType == 50) then       --帮会城市任务，这里不要了
            continue;
        end

        --  当前类型的一组可接任务
        local OutLineMission_Seq = {};
        local i = 1;
        for i=1, DeployNum do
            local color= "";
            local MissionLevel, MinLevel, MaxLevel, strNpcName, strNpcPos, strScene, strMissionName, PosX, PosY, SceneID = GetMissionOutlineInfo( iMissionType, i );
            --  如果任务与玩家的等级差在[-3, 5]之间, 则构造一条该任务的追踪信息, 插入到该类型的任务表中
            if( MissionLevel - nMyLevel <= 5 and MissionLevel >= nMyLevel -3) then
                local strInfo = "";
                strInfo = " #Y("..MissionLevel..")"..strMissionName;   --任务名
                table.insert(OutLineMission_Seq,strInfo)
                --MissionTrack_ListBoxTransparent:AddItemExWithoutLayout( strInfo, (iStart+i), 0);
                strInfo = "";
                strNpcPos = "#{_INFOAIM"..(PosX)..","..(PosY)..","..(SceneID)..","..(strNpcName).."}";
                if strScene and strScene ~= "" then
                    strInfo = strInfo.."   #G"..strScene.."  #R"..strNpcName..strNpcPos;
                else
                    strInfo = strInfo.."   #R"..strNpcName..strNpcPos
                end
                table.insert(OutLineMission_Seq,strInfo)        --任务追踪信息
            end
        end

        --  这处理真简单
        if (table.getn(OutLineMission_Seq) > 0) then
            --  插入任务类型的一条数据
            MissionTrack_ListBoxTransparent:AddItemExWithoutLayout( strOutlineName, iStart, 0 )

            --  插入剩余可接的任务类型数据
            local nn = 1;
            color = "FFD9F80A";    --黄色
            for nn,Per_Seq in ipairs(OutLineMission_Seq) do
                MissionTrack_ListBoxTransparent:AddItemExWithoutLayout( Per_Seq, (iStart+nn), 0, color, 4);
            end
        end
    end

    MissionTrack_ListBoxTransparent:RequestLayout();
end

--  关闭任务追踪界面
function MissionTrack_CloseFunc()
    this:Hide();
    DataPool:SetTrackFuncShow(1, 0);
    DataPool:UpdateTrackStateButton(0);
end

--  点击任务追踪的已经任务按钮, 更新列表为已接任务
--  这里关于按钮的状态处理可以省去
function MissionTrack_HaveGetFunc()
    MissionTrack_HaveGet:SetCheck(1);
    MissionTrack_WillGet:SetCheck(0);
    if(g_nNowCheck ~= 1) then
        MissionTrack_UpdateHaveGetMission(-1);
    end
end

--  点击任务追踪的可接任务按钮, 更新列表为可接任务
--  这里关于按钮的状态处理可以省去
function MissionTrack_WillGetFunc()
    MissionTrack_HaveGet:SetCheck(0);
    MissionTrack_WillGet:SetCheck(1);
    if(g_nNowCheck ~= 2) then
        MissionTrack_UpdateWillGet();
    end
end

--  点击任务追踪的详细信息按钮, 打开任务列表, 显示该任务的详细信息
function MissionTrack_ItemContextClickedForEye()
    local curSceneID = GetSceneID();
    if (curSceneID == g_DiFu_Scene_Id) then
            return
    end

    local nClickedItemInx = MissionTrack_ListBoxTransparent:GetClickedButtonItem();
    DataPool:MissionTrackGotoQuestLog(nClickedItemInx);
end

--  点击任务追踪的关闭按钮, 关闭对该任务的追踪
function MissionTrack_ItemContextClickedForClose()
    local nClickedItemInx = MissionTrack_ListBoxTransparent:GetClickedButtonItem();
    DataPool:SetMissionTrackOpen(nClickedItemInx, 0);
    MissionTrack_UpdateHaveGetMission(-1);
    DataPool:UpdateQuestLogByTrack();
end

--  增大界面高度
function MissionTrack_On_Height_Add()
    local nHeightOld = MissionTrack_Frame:GetProperty("AbsoluteHeight");
    local nListTopOld = MissionTrack__Frame:GetProperty("AbsoluteYPosition");
    local nHeightOld2 = MissionTrack__Frame:GetProperty("AbsoluteHeight");
    local nFunctionTopOld = MissionTrack_Function_Frame:GetProperty("AbsoluteYPosition");
    if (tonumber(nHeightOld) < 379) then
        MissionTrack_Frame:SetProperty("AbsoluteHeight", nHeightOld+17);
        MissionTrack__Frame:SetProperty("AbsoluteHeight", nHeightOld2+17);
        MissionTrack__Frame:SetProperty("AbsoluteYPosition", nListTopOld);
        MissionTrack_Function_Frame:SetProperty("AbsoluteYPosition", nFunctionTopOld);
    end
end

--  减小界面高度
function MissionTrack_On_Height_Reduce()
    local nHeightOld = MissionTrack_Frame:GetProperty("AbsoluteHeight");
    local nListTopOld = MissionTrack__Frame:GetProperty("AbsoluteYPosition");
    local nHeightOld2 = MissionTrack__Frame:GetProperty("AbsoluteHeight");
    local nFunctionTopOld = MissionTrack_Function_Frame:GetProperty("AbsoluteYPosition");
    if (tonumber(nHeightOld) > 158) then
        MissionTrack_Frame:SetProperty("AbsoluteHeight", nHeightOld-17);
        MissionTrack__Frame:SetProperty("AbsoluteYPosition", nListTopOld);
        MissionTrack__Frame:SetProperty("AbsoluteHeight", nHeightOld2-17);
        MissionTrack_Function_Frame:SetProperty("AbsoluteYPosition", nFunctionTopOld);
    end
end

--  增大界面宽度
function MissionTrack_On_Width_Add()
    --MissionTrack_Frame_Context:SetProperty("Alpha", "10");

    local nWidthOld = MissionTrack_Frame:GetProperty("AbsoluteWidth");
    local nFrameLeftOld = MissionTrack_Frame:GetProperty("AbsoluteXPosition");
    local nCheckBoxX = MissionTrack_CheckBox_Frame:GetProperty("AbsoluteXPosition");
    local nDragX = MissionTrack_DragTitle:GetProperty("AbsoluteXPosition");
    local nCloseX = MissionTrack_Close:GetProperty("AbsoluteXPosition");
    local nWidthOld2 = MissionTrack__Frame:GetProperty("AbsoluteWidth");
    local nFuncLeft = MissionTrack_Function_Frame:GetProperty("AbsoluteXPosition");
    local nLockX = MissionTrack_Lock:GetProperty("AbsoluteXPosition");
    if (tonumber(nWidthOld) < 310) then
        MissionTrack_Frame:SetProperty("AbsoluteWidth", nWidthOld + 10);
        MissionTrack_Frame:SetProperty("AbsoluteXPosition", nFrameLeftOld-10);
        MissionTrack_CheckBox_Frame:SetProperty("AbsoluteXPosition", nCheckBoxX + 10);
        MissionTrack_DragTitle:SetProperty("AbsoluteXPosition", nDragX + 10);
        MissionTrack_Close:SetProperty("AbsoluteXPosition", nCloseX + 10);
        MissionTrack__Frame:SetProperty("AbsoluteWidth", nWidthOld2 + 10);
        MissionTrack_Function_Frame:SetProperty("AbsoluteXPosition", nFuncLeft + 10);
        MissionTrack_Lock:SetProperty("AbsoluteXPosition", nLockX + 10);
        MissionTrack_UnLock:SetProperty("AbsoluteXPosition", nLockX + 10);
    end
end

--  减小界面宽度
function MissionTrack_On_Width_Reduce()
    local nWidthOld = MissionTrack_Frame:GetProperty("AbsoluteWidth");
    local nFrameLeftOld = MissionTrack_Frame:GetProperty("AbsoluteXPosition");
    local nCheckBoxX = MissionTrack_CheckBox_Frame:GetProperty("AbsoluteXPosition");
    local nDragX = MissionTrack_DragTitle:GetProperty("AbsoluteXPosition");
    local nCloseX = MissionTrack_Close:GetProperty("AbsoluteXPosition");
    local nWidthOld2 = MissionTrack__Frame:GetProperty("AbsoluteWidth");
    local nFuncLeft = MissionTrack_Function_Frame:GetProperty("AbsoluteXPosition");
    local nLockX = MissionTrack_Lock:GetProperty("AbsoluteXPosition");
    if (tonumber(nWidthOld) > 230) then
        MissionTrack_Frame:SetProperty("AbsoluteWidth", nWidthOld - 10);
        MissionTrack_Frame:SetProperty("AbsoluteXPosition", nFrameLeftOld+10);
        MissionTrack_CheckBox_Frame:SetProperty("AbsoluteXPosition", nCheckBoxX - 10);
        MissionTrack_DragTitle:SetProperty("AbsoluteXPosition", nDragX - 10);
        MissionTrack_Close:SetProperty("AbsoluteXPosition", nCloseX - 10);
        MissionTrack__Frame:SetProperty("AbsoluteWidth", nWidthOld2 - 10);
        MissionTrack_Function_Frame:SetProperty("AbsoluteXPosition", nFuncLeft - 10);
        MissionTrack_Lock:SetProperty("AbsoluteXPosition", nLockX - 10);
        MissionTrack_UnLock:SetProperty("AbsoluteXPosition", nLockX - 10);
    end
end

--  界面锁定或者解除锁定
function MissionTrack_On_Lock()

    if (g_LockState == 0) then   --准备锁定
        g_LockState = 1;
        MissionTrack_UnLock:Show();
        MissionTrack_Lock:Hide();
        MissionTrack_HaveGet:SetProperty("MouseHollow", "True");
        MissionTrack_WillGet:SetProperty("MouseHollow", "True");
        MissionTrack_Close:SetProperty("MouseHollow", "True");
        MissionTrack_Frame:SetProperty("MouseHollow", "True");
        MissionTrack_DragTitle:SetProperty("MouseHollow", "True");
        MissionTrack_Function_Frame:SetProperty("MouseHollow", "True");
        MissionTrack_Height_Add:SetProperty("MouseHollow", "True");
        MissionTrack_Height_Reduce:SetProperty("MouseHollow", "True");
        MissionTrack_Width_Add:SetProperty("MouseHollow", "True");
        MissionTrack_Width_Reduce:SetProperty("MouseHollow", "True");
        MissionTrack_Reset:SetProperty("MouseHollow", "True");
    else               --解锁
        g_LockState = 0;
        MissionTrack_Lock:Show();
        MissionTrack_UnLock:Hide();
        MissionTrack_HaveGet:SetProperty("MouseHollow", "False");
        MissionTrack_WillGet:SetProperty("MouseHollow", "False");
        MissionTrack_Close:SetProperty("MouseHollow", "False");
        MissionTrack_Frame:SetProperty("MouseHollow", "False");
        MissionTrack_DragTitle:SetProperty("MouseHollow", "False");
        MissionTrack_Function_Frame:SetProperty("MouseHollow", "False");
        MissionTrack_Height_Add:SetProperty("MouseHollow", "False");
        MissionTrack_Height_Reduce:SetProperty("MouseHollow", "False");
        MissionTrack_Width_Add:SetProperty("MouseHollow", "False");
        MissionTrack_Width_Reduce:SetProperty("MouseHollow", "False");
        MissionTrack_Reset:SetProperty("MouseHollow", "False");
    end
    MissionTrack_ShowORHideFunc(0);

end

--  重置界面尺寸和位置
function MissionTrack_On_Reset()
    MissionTrack_Frame:SetProperty("UnifiedSize", g_MissionTrack_Frame_UnifiedSize);
    MissionTrack_Frame:SetProperty("UnifiedXPosition", g_MissionTrack_Frame_UnifiedXPosition);
    MissionTrack_Frame:SetProperty("UnifiedYPosition", g_MissionTrack_Frame_UnifiedYPosition);

    MissionTrack__Frame:SetProperty("AbsolutePosition", g_MissionTrack__Frame_AbsolutePosition);
    MissionTrack__Frame:SetProperty("AbsoluteSize", g_MissionTrack__Frame_AbsoluteSize);

    MissionTrack_Function_Frame:SetProperty("AbsolutePosition", g_MissionTrack_Function_Frame_AbsolutePosition);

    MissionTrack_DragTitle:SetProperty("AbsolutePosition", g_MissionTrack_DragTitle_AbsolutePosition);
    MissionTrack_Close:SetProperty("AbsolutePosition", g_MissionTrack_Close_AbsolutePosition);
    MissionTrack_CheckBox_Frame:SetProperty("AbsolutePosition", g_MissionTrack__CheckBox_Frame_AbsolutePosition);
    MissionTrack_Lock:SetProperty("AbsolutePosition", g_MissionTrack_Lock_AbsolutePosition);
    MissionTrack_UnLock:SetProperty("AbsolutePosition", g_MissionTrack_UnLock_AbsolutePosition);
end

--  鼠标进入, 显示界面尺寸控制条
function MissionTrack_Func_MouseEnter()
    MissionTrack_ShowORHideFunc(1);
end

--  鼠标离开, 隐藏界面尺寸控制条
function MissionTrack_Func_MouseLeave()
    MissionTrack_ShowORHideFunc(0);
end

--  隐藏或显示界面尺寸控制条
function MissionTrack_ShowORHideFunc( nShow )

    if (nShow >= 1 and g_LockState == 0) then
        MissionTrack_Height_Add:Show();
        MissionTrack_Height_Reduce:Show();
        MissionTrack_Width_Add:Show();
        MissionTrack_Width_Reduce:Show();
        MissionTrack_Reset:Show();
    else
        MissionTrack_Height_Add:Hide();
        MissionTrack_Height_Reduce:Hide();
        MissionTrack_Width_Add:Hide();
        MissionTrack_Width_Reduce:Hide();
        MissionTrack_Reset:Hide();
    end
end

--  设置界面Alpha值
function MissionTrack_SetAlpha(val)
    local bNum = val
    if tonumber(bNum) < 0.3 then
        MissionTrack_Frame:SetProperty( "Alpha", "0.5" );
        MissionTrack_Function_Frame:SetProperty( "Alpha", "0.5" );
        MissionTrack_ListBoxTransparent:SetVScrollbarAlpha("0.3");
    elseif tonumber(bNum) < 0.5 then
        MissionTrack_Frame:SetProperty( "Alpha", "0.5" );
        MissionTrack_Function_Frame:SetProperty( "Alpha", "0.5" );
        MissionTrack_ListBoxTransparent:SetVScrollbarAlpha(val);
    else
        MissionTrack_Frame:SetProperty( "Alpha", val );
        MissionTrack_Function_Frame:SetProperty( "Alpha", val );
        MissionTrack_ListBoxTransparent:SetVScrollbarAlpha(val);
    end
    MissionTrack_Frame_Context:SetProperty( "Alpha", val );
end

--TT53675对所有不符合规范，没有将missionparam第0位做为任务完成标志的任务脚本做特殊处理，判断任务是否完成
--  目前的写法已经算比较清楚了, 增加适当注释, 不做修改
function IsMissionSuccess(nSelIndex)
    --  任务变量索引
    --  通常第0位记录的是任务结果, 然后按照顺序逐一向后排
    local MissionParam_Index = 0
    local Mission_Variable = 0

    --任务需要杀的npc
    local nDemandKillNum,Kill_Random_Type = DataPool:GetPlayerMissionDemandKill_Num(nSelIndex);
    if( nDemandKillNum > 0 ) then
        for i=1, nDemandKillNum do
            --    需要的NPC, 需要的数量
            local nNPCName, nNum = DataPool:GetPlayerMissionDemand_NPC(i-1,Kill_Random_Type,nSelIndex);
            --  获得当前已经完成的数量
            Mission_Variable = DataPool:GetPlayerMission_Variable(nSelIndex,MissionParam_Index,Kill_Random_Type,i-1);
            --  
            MissionParam_Index = MissionParam_Index + 1;

            if Mission_Variable < nNum then
                return 0
            end
        end
    end
    
    --任务需要的物品
    local nDemandNum,Item_Random_Type= DataPool:GetPlayerMissionDemand_Num(nSelIndex);
    if( nDemandNum > 0 ) then
        for i=1, nDemandNum do
            --    需要的类型，需要物品ID，需要多少个
            local szName, nItemID, nNum = DataPool:GetPlayerMissionDemand_Item(i-1,Item_Random_Type,nSelIndex);
            --  获得当前已经完成的数量, 这部分数据是从背包中取得的, 不记录到任务变量中
            Mission_Variable = DataPool : GetPlayerMission_ItemCountNow(nItemID)

            if Mission_Variable < nNum then
                return 0
            end
        end
    end
    
    -----------------------------------------------------------------------------------
    --任务自定义的物品
    local nCustomNum = DataPool:GetPlayerMissionCustom_Num(nSelIndex);
    if( nCustomNum > 0 ) then
        for i=1, nCustomNum do
            --    需要的类型, 需要的数量
            local strCustom, nNum = DataPool:GetPlayerMissionCustom(i-1);
            --  获得当前已经完成的数量
            Mission_Variable = DataPool:GetPlayerMission_Variable(nSelIndex,MissionParam_Index);
            --
            MissionParam_Index = MissionParam_Index + 1;

            if Mission_Variable < nNum then
                return 0
            end
        end
    end
    
    -----------------------------------------------------------------------------------
    --任务自定义的随机物品 zz添加
    local nRandomCustomNum = DataPool:GetPlayerMissionRandomCustom_Num(nSelIndex);
    if( nRandomCustomNum > 0 ) then
        for i=1,nRandomCustomNum do
            --  需要的类型, 需要的数量, 已经完成的黑素瘤
            local strCustom, nNeedNum,nCompleteNum = DataPool:GetPlayerMissionRandomCustom(i-1,nSelIndex);

            if nCompleteNum < nNeedNum then
                return 0
            end
        end
    end
    
    return 1
end

--  获取当前玩家已接的一组相同类型的任务描述
--  kind    要获取的任务类型
--  kindTbl 要填充的记录表
--
--  该函数采取短路原则, 对于不满足条件的任务将离开返回, 这样可以减少缩进
function MissionTrack_GroupHaveGetMission( kind, kindTbl )
    --  一条任务记录
    local Constitutes = {};
    --  是否有该类型任务的标志
    local bHave = 0;
    --  变量玩家所有的已接任务
    for i=1, g_nMissionNum do
        --  如果当前位置没有任务, 检查下个任务
        if (DataPool:GetPlayerMission_InUse(i-1) ~= 1) then
            continue;
        end

        --  如果当前任务与指定的任务类型不一致, 检查下个任务
        local MissionKind = DataPool:GetPlayerMission_Kind(i-1);
        if(MissionKind ~= kind) then
            continue;
        end

        --  如果该任务类型不是可追踪的类型, 检查下个任务
        --  这个检查可以提到循环外执行, 这样可以减少检查次数
        local nThisKindHaveMission = DataPool:HaveMisstionTrackThisType(MissionKind);
        if (nThisKindHaveMission ~= 1 ) then
            continue;
        end

        --  虽然任务追踪不支持折叠功能, 但这部分代码还是保留吧, 省心
        if ( MissionPucker[kind] > 0 ) then
            --  获得 g_MissionTarget 字段
            local strInfo = DataPool:GetPlayerMission_Memo(i-1);
            --  获得 g_MissionLevel 字段
            local nMissionLevel = DataPool:GetPlayerMission_Level(i-1);

            --  任务等级是玩家等级的特殊处理
            if nMissionLevel == LEVEL_TO_MY_LEVEL then
                nMissionLevel =  Player:GetData( "LEVEL" );
                if (nMissionLevel > 0) then   --进入擂台后得到是0，只是显示问题，不想改服务器逻辑，所以用这么一种很弱智的方法
                    --  非擂台场景获取的玩家等级是正常的, 此时会记录一个临时等级
                    g_Temp_Mylevel = nMissionLevel;
                else
                    --  擂台场景的玩家等级不正确, 将上一次记录的临时等级指定为任务等级, 避免出现0的情况
                    nMissionLevel = g_Temp_Mylevel;
                end
            end

            --  有该类型的任务, 增加一条任务类型的记录, 仅增加一次
            if(bHave == 0) then
                local str= "#cff9900" .. DataPool:GetMissionInfo_Kind(kind);   --title
                Constitutes = {str,100+kind,"",0}
                --unused
                --table.insert(MissionTitles, str);
                table.insert(kindTbl,Constitutes)
                bHave = 1;
            end

            --------------------------------------------------
            --  下面开始构造任务描述文字

            local strOKFail = "";
            local nFinished = 0;
            --  显示任务是否已完成或已失败
            local Mission_Variable = DataPool:GetPlayerMission_Variable(i-1,0);
            
            --  特殊任务, 特殊处理
               if MissionTrack_IsSpecialMission(i-1) == 1 then
                Mission_Variable = IsMissionSuccess(i-1)
               end

            --  生成任务结果文字
            if(Mission_Variable >0) then
                if(Mission_Variable == 1) then
                    strOKFail = "完成";
                    nFinished = 1
                elseif(Mission_Variable == 2) then
                    strOKFail = "失败";
                end
            end

            --  获得简短的任务描述文字
            color = "FFF8A10A";    --橙色
            local nChange, strMissionName = DataPool:GetMissionShortName(strInfo);--string.sub(strInfo, -6);
            
            --  任务描述是否过长
            if (nChange > 0) then
                strMissionName = strMissionName .. "...";
            end

            --  生成一条任务记录
            if (nFinished == 1) then   --已完成
                Constitutes = {"  #Y(" .. nMissionLevel ..") " .. strMissionName .. " #G" .. strOKFail,i-1,color,nMissionLevel,nFinished};
            else
                Constitutes = {"  #Y(" .. nMissionLevel ..") " .. strMissionName .. " " .. strOKFail,i-1,color,nMissionLevel,nFinished};
            end

            --  增加一条任务记录
            table.insert(kindTbl,Constitutes)
        else    --  仅折叠状态下会进行下面的处理, 但 任务追踪 界面没有折叠选项, 因此下述代码不会被执行
            --  有该类型的任务, 增加一条任务类型的记录, 仅增加一次
            if(bHave == 0) then
                local str= "#gFE7E82" .. DataPool:GetMissionInfo_Kind(kind);
                Constitutes = {str,100+kind,"",0}
                table.insert(kindTbl,Constitutes)
                --unused
                --table.insert(MissionTitles, str);
                bHave = 1;
            end
        end
    end

    --  返回kind类型的已接任务列表
    return kindTbl;
end

--  是否是特殊任务, 任务状态不是记录在0号位置的.
function MissionTrack_IsSpecialMission( index )
    --TT53675对于所有没有用missionparam第0位表示任务是否完成的任务，使用IsMissionSuccess判断任务是否完成
    local IsSpecial = 0
    local nScriptId = DataPool:GetPlayerMission_Display(index,7);

    for i, findId in SpecialMissionList do
          if nScriptId == findId then
             IsSpecial = 1
            break
        end
    end

    if nScriptId >= 1020000 and nScriptId <= 1029999 then --所有的探索配表任务都需要特殊处理
          IsSpecial = 1
    end

    return IsSpecial;
end

--  比较器, MissionTrack原本直接引用的是QuestLog的函数...
--  现在复制为两份, 并且拥有各自的名称
function MissionTrack_CompareTable(table_a,table_b)
    if table_a[4] < table_b[4] then
        return true
    else
        return false
    end
end
