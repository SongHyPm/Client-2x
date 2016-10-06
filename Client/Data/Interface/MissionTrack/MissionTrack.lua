-- �������   author��houzhifang

local g_strWndName = "MissionTrack";

local g_dlgctrls = {};              --�ؼ�����, noused
local MissionPucker = {};           --���������۵����, 1Ϊ���۵�, 0Ϊ�۵�
local g_nNowCheck = 0;              --0:��ʼ����1:�ѽ�����2���ɽ�����
local g_LockState = 0;              --0:δ������1��������
local LEVEL_TO_MY_LEVEL = 10000;    --�������ȼ�Ϊ��ֵ, ����ҵ�ǰ�ȼ���������ȼ�
local g_Temp_Mylevel = 1;           --һ����ҵȼ�����ʱ����, ��Ҫ������̨����, ��ҵȼ���0�����

local g_DiFu_Scene_Id = 77;         --�ظ�����ID
local g_nMissionNum = 20;           --����������

--TT53675�����в����Ϲ淶��û�н�missionparam��0λ��Ϊ������ɱ�־������ű������⴦��,��Ҫ���⴦�������ű����б�
local SpecialMissionList = {200006,200031}

--���ڱ�������ԭʼ�ߴ��λ����Ϣ
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
    this:RegisterEvent("UNIT_LEVEL"); --���������ʱ����¿ɽ��б�
    this:RegisterEvent("ADJEST_UI_POS")
    this:RegisterEvent("ADJEST_UI_RELATION_POS")
end

--  ������μ���ʱ��ʼ���������������Ƿ��۵���, ���������ߴ��λ����Ϣ
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

--  �¼�����, ����û�п��޳������ಿ��, �ͽṹ����, �Ƚ�����
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
            --ͬʱ����CampaignTrack����
            AdjustUIPos("CampaignTrack")
        end
    elseif (event == "ADJEST_UI_RELATION_POS") then
        if (arg0 == "MissionTrack" ) then
            MissionTrack_On_Reset()
        end
    end
end

--  ��������ѽӵ�����
--  ��� nSelectMissionID ��Ϊ -1 ����ڸ��½������б�λ��ָ��������λ�ô�
function MissionTrack_UpdateHaveGetMission(nSelectMissionID)
    local i = 1;
    --unused
    --local nMyLevel = Player:GetData( "LEVEL" );

    --  ��¼��ǰ�б���ָ���λ��
    local nNowFirstItem;
    nNowFirstItem = MissionTrack_ListBoxTransparent:GetCurrentFirstItem();

    --  ������״̬�л�Ϊ �ѽ����� ����
    MissionTrack_HaveGet:SetCheck(1);
    MissionTrack_WillGet:SetCheck(0);
    g_nNowCheck = 1;

    --  ����б�����
    MissionTrack_ListBoxTransparent:ClearListBoxEx();

    --  �� g_nMissionNum ���
    --local nMissionNum = 20
    local color;

    --  ���������Ϣ
    for i=1,g_nMissionNum do
        if (DataPool:GetPlayerMission_InUse(i-1) == 1) then
            DataPool:GetPlayerMission_Description(i-1);
        end
    end;

    --unused
    --local k = 0;
    --����ת��forѭ��֮��
    --local Sequence_OnefoldGenre = {}
    --  �ѽ���������ܱ�
    local Sequence_Assemble = {}
    --��ΪMissionTrack_GroupHaveGetMission����ʱ������
    --local Constitutes = {};
    --unused
    --local MissionTitles = {};

    for j=1, 200 do
        --  ����ȡ��ͬ����������ɺ���, �����Ķ���ά��
        local Sequence_OnefoldGenre = MissionTrack_GroupHaveGetMission( j, {} );
        
        ----
        table.sort(Sequence_OnefoldGenre,MissionTrack_CompareTable)
        
        --  �������͵�һ������, ���뵽�ܱ���
        for i,n in ipairs(Sequence_OnefoldGenre) do
            table.insert(Sequence_Assemble,n)
        end
        --notused
        --Sequence_OnefoldGenre = {};
        ----
    end

    --  �����ѽ���������ܱ�, �����ݲ��뵽��ʾ�б���
    local Per_Segment,xxxx,i,j;
    for i,Per_Segment in ipairs(Sequence_Assemble) do
        local nMissionTrackType = DataPool:GetPlayerMissionTrackType(Per_Segment[2]);
        if (Per_Segment[3] ~= "" and nMissionTrackType > 0) then
            local nIsMissionTrackOpen = DataPool:IsMissionTrackOpen(Per_Segment[2]);
            if (nIsMissionTrackOpen > 0) then
                --  ��һ����ֻ��������������
                MissionTrack_ListBoxTransparent:AddItemExWithoutLayout(Per_Segment[1],Per_Segment[2], 3, Per_Segment[3],4)
                --  ��һ����ʵ�����������Ĵ�ɷ�ʽ�����Ŀ��������������ͳ��
                MissionTrack_AddMissionTrackInfo(Per_Segment[2], nMissionTrackType, Per_Segment[5]);
            end
        elseif (tonumber(Per_Segment[4]) == 0) then
            MissionTrack_ListBoxTransparent:AddItemExWithoutLayout(Per_Segment[1],Per_Segment[2], 0);
        end
    end
    MissionTrack_ListBoxTransparent:RequestLayout();

    --  ��������׷���б����ʾλ��
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

--  �����ѽ��������ϸ׷����Ϣ
function MissionTrack_AddMissionTrackInfo(nMissionIndex, nMissionTrackType, nFinished)
    --unused
    --local nNewIndex = nMissionIndex+200;
    local color = "FFCCCCCC";
    
    --�����������
    local MissionParam_Index = 0;
    local strTarget = "";

    local strFinishNPC, strFinishSceneName, nFinishSceneID, nFinishX, nFinishY = DataPool:GetMissionFinishInfo(nMissionIndex);
    --PushDebugMessage(strFinishNPC);
    --PushDebugMessage(nFinished);
    if (nFinished == 1 and strFinishNPC ~= "") then       --����ɵ�����
        --if (strFinishNPC ~= "") then
            --local strTemp = string.format("   #Wȥ#G%s#W��#R%s#{_INFOAIM%d,%d,%d,%s}#W", strFinishSceneName, strFinishNPC, nFinishX, nFinishY, nFinishSceneID, strFinishNPC);
            local strTemp = "";
            local nIndex = DataPool:GetPlayerMission_Display(nMissionIndex,7)--czf modify,2009.08.26
            if nIndex == 1018870 then
                strTemp = string.format("   #Wȥ#G%s#W��#R%s#W", strFinishSceneName, strFinishNPC);
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
            elseif nIndex == 600047 or nIndex == 600048 or nIndex == 600049 then        --�������� for:TT 64489
                strTemp = string.format("   #Wȥ��#R%s",    strFinishNPC);
            else
                strTemp = string.format("   #Wȥ#G%s#W��#R%s#{_INFOAIM%d,%d,%d,%s}", strFinishSceneName, strFinishNPC, nFinishX, nFinishY, nFinishSceneID, strFinishNPC);
            end
            strTarget = strTemp;
        --end
    else    --δ��ɵ�����
        --local nRound = DataPool:GetPlayerMission_Display(nMissionIndex,3);
        --if( nRound >= 0 ) then
        --    Mission_Variable = DataPool:GetPlayerMission_DataRound(nRound);
        --    if(Mission_Variable >= 0) then
        --        strTarget = "����ǰ������#W"..tostring(Mission_Variable);
        --    end
        --end
            --��ʾ������Ʊ����
        --if( DataPool:GetPlayerMission_Display(nMissionIndex,4) > 0 ) then
        --    Mission_Variable = DataPool:GetPlayerMission_Variable(nMissionIndex,MissionParam_Index);
        --    MissionParam_Index = MissionParam_Index + 1;

        --    if(Mission_Variable >0) then
        --        silverdesc = DataPool:GetPlayerMission_BillName(nMissionIndex);
        --        strTarget = "��Ҫ�õ���Ǯ��#W"..tostring(Mission_Variable);
        --    end
        --end

        ---------------------------------------------------------------------------------------------------------------------------------------------------------
        --  ���������������Ŀ�깹������Ŀ�������������, ÿ��Ŀ��һ��
        --  û���ر���Ҫ���ĵı�Ҫ, �Ƚ��������, ���ֻ������ע�ͺͱ�Ҫ�ķָ�

        local strAppend = "";
        local Mission_Variable = 0;
        
        --����������, ��Ҫ���Ե�һ���������  
        if MissionTrack_IsSpecialMission(nMissionIndex)==0 then
            MissionParam_Index = MissionParam_Index + 1;
        end

        ---------------------------------------------------------------------------------------------------------------------------------------------------------
        --  �������Ĵ�����ڹ�������Ŀ���������

        --������Ҫɱ��npc
        local nDemandKillNum,Kill_Random_Type = DataPool:GetPlayerMissionDemandKill_Num(nMissionIndex);
        if( nDemandKillNum > 0 ) then
            strAppend = "   #W��ɱ����";
            for i=1, nDemandKillNum do
                --  ��Ҫ��NPC, ��Ҫ������
                local nNPCName, nNum = DataPool:GetPlayerMissionDemand_NPC(i-1,Kill_Random_Type,nMissionIndex);
                --  ʵ�ʻ�õ�����
                Mission_Variable = DataPool:GetPlayerMission_Variable(nMissionIndex,MissionParam_Index,Kill_Random_Type,i-1);
                --
                MissionParam_Index = MissionParam_Index + 1;

                --  ���ݲ�ͬ�������������ʾĿ��������
                if (i == 1 and nDemandKillNum > 1) then
                    strAppend = strAppend.."#W"..nNPCName.."��"..tostring(Mission_Variable).."/"..tostring(nNum).."#r";
                elseif (i == 1 and nDemandKillNum == 1) then
                    strAppend = strAppend.."#W"..nNPCName.."��"..tostring(Mission_Variable).."/"..tostring(nNum);
                elseif( i == nDemandKillNum) then
                    strAppend = strAppend.."#W            "..nNPCName.."��"..tostring(Mission_Variable).."/"..tostring(nNum);
                else
                    strAppend = strAppend.."#W            "..nNPCName.."��"..tostring(Mission_Variable).."/"..tostring(nNum).."#r";
                end
                --unused
                --nNewIndex = nNewIndex + 1;
            end
        end

        --������Ҫ����Ʒ
        local nDemandNum,Item_Random_Type= DataPool:GetPlayerMissionDemand_Num(nMissionIndex);
        if( nDemandNum > 0 ) then
            if(Item_Random_Type == -100) then
                strAppend = "   #W���ύ��";
                --unused
                --nNewIndex = nNewIndex + 1;
                Item_Random_Type = 0
            else
                strAppend = "   #W�ѵõ���";
                --unused
                --nNewIndex = nNewIndex + 1;
            end
        end

        for i=1, nDemandNum do
            --    ��Ҫ�����ͣ���Ҫ��ƷID����Ҫ���ٸ�
            local szName,nItemID, nNum = DataPool:GetPlayerMissionDemand_Item(i-1,Item_Random_Type,nMissionIndex);
            --  �������Ѿ��е�����
            Mission_Variable = DataPool : GetPlayerMission_ItemCountNow(nItemID)

            if Mission_Variable > nNum then
                Mission_Variable = nNum
            end

            --  JOY: ������뷨��Ҫ��������Ƿ��Ѿ������... ������߼�Ӧ���������
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

        --�����Զ������Ʒ
        local nCustomNum = DataPool:GetPlayerMissionCustom_Num(nMissionIndex);
        for i=1, nCustomNum do
            --    ��Ҫ����Ʒ, ��Ҫ������
            local strCustom, nNum = DataPool:GetPlayerMissionCustom(i-1);
            --  �Ѿ���õ�����
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
                strAppend = strAppend.."   " .. strCustom .. " �� ".. Mission_Variable .. "/" .. nNum..strDot;
            end
        end

        --�����Զ���������Ʒ zz���
        local nRandomCustomNum = DataPool:GetPlayerMissionRandomCustom_Num(nMissionIndex);
        for i=1,nRandomCustomNum do
            --  ��Ҫ������, ��Ҫ������, ��õ�����
            local strCustom, nNeedNum, nCompleteNum = DataPool:GetPlayerMissionRandomCustom(i-1,nMissionIndex);

            local strDot = "";
            if (i < nCustomNum) then
                strDot = "#r";
            end

            if nNeedNum == 0 then
                strAppend = strAppend..strCustom..strDot;
            else
                strAppend = strAppend..strCustom .. " �� ".. nCompleteNum .. "/" .. nNeedNum..strDot;
            end
        end

        ---------------------------------------------------------------------------------------------------------------------------------------------------------
        --  ������һ����, ��Ҫ������δ������Ŀ���˵��, ���ڸ�˵��֮����ϵ�ǰ�����������ͳ��

        local strTemp = "";
        strTarget = "";

        --�ű�����ֱ�Ӷ�ȡ���������Ϣ
        if (nMissionTrackType == 1) then   
            strTarget = DataPool:GetLuaMissionTrackInfo(nMissionIndex);
            if (strAppend ~= "") then
                strTarget = "   #W" .. strTarget.."#r#W"..strAppend;
            else
                strTarget = "   #W" .. strTarget;
            end

        --����������񣬸��ݲ�ͬ���ͽ�������ƥ��
        elseif(nMissionTrackType == 2) then   
            local strNPCName, strSceneName, nTargetScene, nPosX, nPosY = DataPool:GetDeliveryMissionTrackInfo(nMissionIndex);
            if (strNPCName ~= "") then
                -- Ӣ�������Ӧ ����Ϊ-1
                local strTemp = "";
                if(nTargetScene ~= -1) then
                    --strTemp = string.format("   #Wȥ#G%s#W��#R%s#{_INFOAIM%d,%d,%d,%s}#W", strSceneName, strNPCName, nPosX, nPosY, nTargetScene, strNPCName);
                    local nIndex = DataPool:GetPlayerMission_Display(nMissionIndex,7)--czf modify,2009.08.26
                    if nIndex == 1018870 then
                        strTemp = string.format("   #Wȥ#G%s#W��#R%s#W", strSceneName, strNPCName);
                    else
                        strTemp = string.format("   #Wȥ#G%s#W��#R%s#{_INFOAIM%d,%d,%d,%s}", strSceneName, strNPCName, nPosX, nPosY, nTargetScene, strNPCName);
                    end
                else
                    strTemp = string.format("   #Wȥ#G%s#W��#R%s#W", strSceneName, strNPCName);
                end
                strTarget = strTarget .. strTemp .. "#r";
            end
            if (strAppend ~= "") then
                strTarget = strTarget .. strAppend;
            end

         --�������ɱ������
        elseif(nMissionTrackType == 3) then  
            local nMonsterNum = DataPool:GetKillMonsterMissionTrackInfo_num(nMissionIndex);
            if (nMonsterNum > 0) then
                for nn = 1, nMonsterNum do
                    local strMonsterName, strSceneName, nSceneId, nCount, nXpos, nYpos = DataPool:GetKillMonsterMissionTrackInfo_MonsterInfo(nMissionIndex, nn-1);
                    if(strMonsterName ~= "") then
                        local strTemp = "";
                        if(nSceneId ~= -1) then
                             strTemp = string.format("   #Wȥ#G%s#Wɱ#R%s#{_INFOAIM%d,%d,%d,%s}#W", tostring(strSceneName),tostring(strMonsterName), tonumber(nXpos), tonumber(nYpos), tonumber(nSceneId), tostring(strMonsterName));
                        else
                             strTemp = string.format("   #Wȥ#G%s#Wɱ#R%s#W", tostring(strSceneName),tostring(strMonsterName));
                        end
                        strTarget = strTarget .. strTemp;
                        strTarget = strTarget .. "#r";
                    end
                end
            end
            if (strAppend ~= "") then
                strTarget = strTarget .. strAppend;
            end

        --������õ�������
        elseif(nMissionTrackType == 4) then
            local nLootItemNum = DataPool:GetLootItemMissionTrackInfo_num(nMissionIndex);
            if(nLootItemNum > 0) then
                for nn = 1, nLootItemNum do
                    local strMonsterName, strSceneName, strItemName, nSceneID, nItemNum, xPos, yPos = DataPool:GetLootItemMissionTrackInfo_ItemInfo(nMissionIndex, nn-1);
                    if (strMonsterName ~= "") then
                        local strTemp = "";
                        if(nSceneID ~= -1) then
                             strTemp = string.format("   #Wȥ#G%s#Wɱ#R%s#{_INFOAIM%d,%d,%d,%s}#W", strSceneName, strMonsterName, xPos, yPos, nSceneID, strMonsterName);
                        else
                             strTemp = string.format("   #Wȥ#G%s#Wɱ#R%s#W", strSceneName, strMonsterName);
                        end
                        strTarget = strTarget .. strTemp;
                        strTarget = strTarget .. "#r";
                    end
                end
            end
            if (strAppend ~= "") then
                strTarget = strTarget .. strAppend;
            end

        --������û�������
        elseif (nMissionTrackType == 6) then
            local strObjName, strTargetNPC, strTargetScene, nTargetScene, xPos, yPos = DataPool:GetHusongMissionTrackInfo(nMissionIndex);
            if (strObjName ~= "") then
                local strTemp = "";
                if(nTargetScene ~= -1) then
                    strTemp = string.format("   #W��%s��#R%s#{_INFOAIM%d,%d,%d,%s}#W#r",strTargetScene, strTargetNPC, xPos, yPos, nTargetScene, strTargetNPC);
                else
                    strTemp = string.format("   #W��%s��#R%s#W",strTargetScene, strTargetNPC);
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

--  ���¿ɽ������б�
function MissionTrack_UpdateWillGet()
    
    --  �л�����״̬Ϊ �ɽ����� ׷��
    MissionTrack_HaveGet:SetCheck(0);
    MissionTrack_WillGet:SetCheck(1);
    g_nNowCheck = 2;

    --  ������Ҫ�õ���ҵȼ�
    --  �������̨�е������˲��ǻ����ô?
    local nMyLevel = Player:GetData( "LEVEL" )
    MissionTrack_ListBoxTransparent:ClearListBoxEx();

    --  ���������п��Խӵ�����
    CollectMissionOutline();

    --  ��Ȼ�Ǹ���ÿ���������ͽ��з���
    for iMissionType=1,200 do             --����������һ��200��
        local strOutlineName = "#cff9900" .. DataPool:GetMissionInfo_Kind( iMissionType );  --#gFE7E82
        
        --  ԭ��Ӧ���Ǹ� �� �߼�, ���ڲ��� �� �߼�
        --  ���Ϸ���������������, ��������¸�����
        if( strOutlineName == "" or strOutlineName == 0) then
            continue;
        end

        local iStart = iMissionType*10000;
        local DeployNum = GetMissionOutlineNum( iMissionType )
        --  �ɽ����������жϿ����ᵽ���ȥ, ����ѭ������
           if( DeployNum <= 0 or iMissionType == 50) then       --�������������ﲻҪ��
            continue;
        end

        --  ��ǰ���͵�һ��ɽ�����
        local OutLineMission_Seq = {};
        local i = 1;
        for i=1, DeployNum do
            local color= "";
            local MissionLevel, MinLevel, MaxLevel, strNpcName, strNpcPos, strScene, strMissionName, PosX, PosY, SceneID = GetMissionOutlineInfo( iMissionType, i );
            --  �����������ҵĵȼ�����[-3, 5]֮��, ����һ���������׷����Ϣ, ���뵽�����͵��������
            if( MissionLevel - nMyLevel <= 5 and MissionLevel >= nMyLevel -3) then
                local strInfo = "";
                strInfo = " #Y("..MissionLevel..")"..strMissionName;   --������
                table.insert(OutLineMission_Seq,strInfo)
                --MissionTrack_ListBoxTransparent:AddItemExWithoutLayout( strInfo, (iStart+i), 0);
                strInfo = "";
                strNpcPos = "#{_INFOAIM"..(PosX)..","..(PosY)..","..(SceneID)..","..(strNpcName).."}";
                if strScene and strScene ~= "" then
                    strInfo = strInfo.."   #G"..strScene.."  #R"..strNpcName..strNpcPos;
                else
                    strInfo = strInfo.."   #R"..strNpcName..strNpcPos
                end
                table.insert(OutLineMission_Seq,strInfo)        --����׷����Ϣ
            end
        end

        --  �⴦�����
        if (table.getn(OutLineMission_Seq) > 0) then
            --  �����������͵�һ������
            MissionTrack_ListBoxTransparent:AddItemExWithoutLayout( strOutlineName, iStart, 0 )

            --  ����ʣ��ɽӵ�������������
            local nn = 1;
            color = "FFD9F80A";    --��ɫ
            for nn,Per_Seq in ipairs(OutLineMission_Seq) do
                MissionTrack_ListBoxTransparent:AddItemExWithoutLayout( Per_Seq, (iStart+nn), 0, color, 4);
            end
        end
    end

    MissionTrack_ListBoxTransparent:RequestLayout();
end

--  �ر�����׷�ٽ���
function MissionTrack_CloseFunc()
    this:Hide();
    DataPool:SetTrackFuncShow(1, 0);
    DataPool:UpdateTrackStateButton(0);
end

--  �������׷�ٵ��Ѿ�����ť, �����б�Ϊ�ѽ�����
--  ������ڰ�ť��״̬�������ʡȥ
function MissionTrack_HaveGetFunc()
    MissionTrack_HaveGet:SetCheck(1);
    MissionTrack_WillGet:SetCheck(0);
    if(g_nNowCheck ~= 1) then
        MissionTrack_UpdateHaveGetMission(-1);
    end
end

--  �������׷�ٵĿɽ�����ť, �����б�Ϊ�ɽ�����
--  ������ڰ�ť��״̬�������ʡȥ
function MissionTrack_WillGetFunc()
    MissionTrack_HaveGet:SetCheck(0);
    MissionTrack_WillGet:SetCheck(1);
    if(g_nNowCheck ~= 2) then
        MissionTrack_UpdateWillGet();
    end
end

--  �������׷�ٵ���ϸ��Ϣ��ť, �������б�, ��ʾ���������ϸ��Ϣ
function MissionTrack_ItemContextClickedForEye()
    local curSceneID = GetSceneID();
    if (curSceneID == g_DiFu_Scene_Id) then
            return
    end

    local nClickedItemInx = MissionTrack_ListBoxTransparent:GetClickedButtonItem();
    DataPool:MissionTrackGotoQuestLog(nClickedItemInx);
end

--  �������׷�ٵĹرհ�ť, �رնԸ������׷��
function MissionTrack_ItemContextClickedForClose()
    local nClickedItemInx = MissionTrack_ListBoxTransparent:GetClickedButtonItem();
    DataPool:SetMissionTrackOpen(nClickedItemInx, 0);
    MissionTrack_UpdateHaveGetMission(-1);
    DataPool:UpdateQuestLogByTrack();
end

--  �������߶�
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

--  ��С����߶�
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

--  ���������
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

--  ��С������
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

--  �����������߽������
function MissionTrack_On_Lock()

    if (g_LockState == 0) then   --׼������
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
    else               --����
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

--  ���ý���ߴ��λ��
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

--  ������, ��ʾ����ߴ������
function MissionTrack_Func_MouseEnter()
    MissionTrack_ShowORHideFunc(1);
end

--  ����뿪, ���ؽ���ߴ������
function MissionTrack_Func_MouseLeave()
    MissionTrack_ShowORHideFunc(0);
end

--  ���ػ���ʾ����ߴ������
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

--  ���ý���Alphaֵ
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

--TT53675�����в����Ϲ淶��û�н�missionparam��0λ��Ϊ������ɱ�־������ű������⴦���ж������Ƿ����
--  Ŀǰ��д���Ѿ���Ƚ������, �����ʵ�ע��, �����޸�
function IsMissionSuccess(nSelIndex)
    --  �����������
    --  ͨ����0λ��¼����������, Ȼ����˳����һ�����
    local MissionParam_Index = 0
    local Mission_Variable = 0

    --������Ҫɱ��npc
    local nDemandKillNum,Kill_Random_Type = DataPool:GetPlayerMissionDemandKill_Num(nSelIndex);
    if( nDemandKillNum > 0 ) then
        for i=1, nDemandKillNum do
            --    ��Ҫ��NPC, ��Ҫ������
            local nNPCName, nNum = DataPool:GetPlayerMissionDemand_NPC(i-1,Kill_Random_Type,nSelIndex);
            --  ��õ�ǰ�Ѿ���ɵ�����
            Mission_Variable = DataPool:GetPlayerMission_Variable(nSelIndex,MissionParam_Index,Kill_Random_Type,i-1);
            --  
            MissionParam_Index = MissionParam_Index + 1;

            if Mission_Variable < nNum then
                return 0
            end
        end
    end
    
    --������Ҫ����Ʒ
    local nDemandNum,Item_Random_Type= DataPool:GetPlayerMissionDemand_Num(nSelIndex);
    if( nDemandNum > 0 ) then
        for i=1, nDemandNum do
            --    ��Ҫ�����ͣ���Ҫ��ƷID����Ҫ���ٸ�
            local szName, nItemID, nNum = DataPool:GetPlayerMissionDemand_Item(i-1,Item_Random_Type,nSelIndex);
            --  ��õ�ǰ�Ѿ���ɵ�����, �ⲿ�������Ǵӱ�����ȡ�õ�, ����¼�����������
            Mission_Variable = DataPool : GetPlayerMission_ItemCountNow(nItemID)

            if Mission_Variable < nNum then
                return 0
            end
        end
    end
    
    -----------------------------------------------------------------------------------
    --�����Զ������Ʒ
    local nCustomNum = DataPool:GetPlayerMissionCustom_Num(nSelIndex);
    if( nCustomNum > 0 ) then
        for i=1, nCustomNum do
            --    ��Ҫ������, ��Ҫ������
            local strCustom, nNum = DataPool:GetPlayerMissionCustom(i-1);
            --  ��õ�ǰ�Ѿ���ɵ�����
            Mission_Variable = DataPool:GetPlayerMission_Variable(nSelIndex,MissionParam_Index);
            --
            MissionParam_Index = MissionParam_Index + 1;

            if Mission_Variable < nNum then
                return 0
            end
        end
    end
    
    -----------------------------------------------------------------------------------
    --�����Զ���������Ʒ zz���
    local nRandomCustomNum = DataPool:GetPlayerMissionRandomCustom_Num(nSelIndex);
    if( nRandomCustomNum > 0 ) then
        for i=1,nRandomCustomNum do
            --  ��Ҫ������, ��Ҫ������, �Ѿ���ɵĺ�����
            local strCustom, nNeedNum,nCompleteNum = DataPool:GetPlayerMissionRandomCustom(i-1,nSelIndex);

            if nCompleteNum < nNeedNum then
                return 0
            end
        end
    end
    
    return 1
end

--  ��ȡ��ǰ����ѽӵ�һ����ͬ���͵���������
--  kind    Ҫ��ȡ����������
--  kindTbl Ҫ���ļ�¼��
--
--  �ú�����ȡ��·ԭ��, ���ڲ����������������뿪����, �������Լ�������
function MissionTrack_GroupHaveGetMission( kind, kindTbl )
    --  һ�������¼
    local Constitutes = {};
    --  �Ƿ��и���������ı�־
    local bHave = 0;
    --  ����������е��ѽ�����
    for i=1, g_nMissionNum do
        --  �����ǰλ��û������, ����¸�����
        if (DataPool:GetPlayerMission_InUse(i-1) ~= 1) then
            continue;
        end

        --  �����ǰ������ָ�����������Ͳ�һ��, ����¸�����
        local MissionKind = DataPool:GetPlayerMission_Kind(i-1);
        if(MissionKind ~= kind) then
            continue;
        end

        --  ������������Ͳ��ǿ�׷�ٵ�����, ����¸�����
        --  ����������ᵽѭ����ִ��, �������Լ��ټ�����
        local nThisKindHaveMission = DataPool:HaveMisstionTrackThisType(MissionKind);
        if (nThisKindHaveMission ~= 1 ) then
            continue;
        end

        --  ��Ȼ����׷�ٲ�֧���۵�����, ���ⲿ�ִ��뻹�Ǳ�����, ʡ��
        if ( MissionPucker[kind] > 0 ) then
            --  ��� g_MissionTarget �ֶ�
            local strInfo = DataPool:GetPlayerMission_Memo(i-1);
            --  ��� g_MissionLevel �ֶ�
            local nMissionLevel = DataPool:GetPlayerMission_Level(i-1);

            --  ����ȼ�����ҵȼ������⴦��
            if nMissionLevel == LEVEL_TO_MY_LEVEL then
                nMissionLevel =  Player:GetData( "LEVEL" );
                if (nMissionLevel > 0) then   --������̨��õ���0��ֻ����ʾ���⣬����ķ������߼�����������ôһ�ֺ����ǵķ���
                    --  ����̨������ȡ����ҵȼ���������, ��ʱ���¼һ����ʱ�ȼ�
                    g_Temp_Mylevel = nMissionLevel;
                else
                    --  ��̨��������ҵȼ�����ȷ, ����һ�μ�¼����ʱ�ȼ�ָ��Ϊ����ȼ�, �������0�����
                    nMissionLevel = g_Temp_Mylevel;
                end
            end

            --  �и����͵�����, ����һ���������͵ļ�¼, ������һ��
            if(bHave == 0) then
                local str= "#cff9900" .. DataPool:GetMissionInfo_Kind(kind);   --title
                Constitutes = {str,100+kind,"",0}
                --unused
                --table.insert(MissionTitles, str);
                table.insert(kindTbl,Constitutes)
                bHave = 1;
            end

            --------------------------------------------------
            --  ���濪ʼ����������������

            local strOKFail = "";
            local nFinished = 0;
            --  ��ʾ�����Ƿ�����ɻ���ʧ��
            local Mission_Variable = DataPool:GetPlayerMission_Variable(i-1,0);
            
            --  ��������, ���⴦��
               if MissionTrack_IsSpecialMission(i-1) == 1 then
                Mission_Variable = IsMissionSuccess(i-1)
               end

            --  ��������������
            if(Mission_Variable >0) then
                if(Mission_Variable == 1) then
                    strOKFail = "���";
                    nFinished = 1
                elseif(Mission_Variable == 2) then
                    strOKFail = "ʧ��";
                end
            end

            --  ��ü�̵�������������
            color = "FFF8A10A";    --��ɫ
            local nChange, strMissionName = DataPool:GetMissionShortName(strInfo);--string.sub(strInfo, -6);
            
            --  ���������Ƿ����
            if (nChange > 0) then
                strMissionName = strMissionName .. "...";
            end

            --  ����һ�������¼
            if (nFinished == 1) then   --�����
                Constitutes = {"  #Y(" .. nMissionLevel ..") " .. strMissionName .. " #G" .. strOKFail,i-1,color,nMissionLevel,nFinished};
            else
                Constitutes = {"  #Y(" .. nMissionLevel ..") " .. strMissionName .. " " .. strOKFail,i-1,color,nMissionLevel,nFinished};
            end

            --  ����һ�������¼
            table.insert(kindTbl,Constitutes)
        else    --  ���۵�״̬�»��������Ĵ���, �� ����׷�� ����û���۵�ѡ��, ����������벻�ᱻִ��
            --  �и����͵�����, ����һ���������͵ļ�¼, ������һ��
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

    --  ����kind���͵��ѽ������б�
    return kindTbl;
end

--  �Ƿ�����������, ����״̬���Ǽ�¼��0��λ�õ�.
function MissionTrack_IsSpecialMission( index )
    --TT53675��������û����missionparam��0λ��ʾ�����Ƿ���ɵ�����ʹ��IsMissionSuccess�ж������Ƿ����
    local IsSpecial = 0
    local nScriptId = DataPool:GetPlayerMission_Display(index,7);

    for i, findId in SpecialMissionList do
          if nScriptId == findId then
             IsSpecial = 1
            break
        end
    end

    if nScriptId >= 1020000 and nScriptId <= 1029999 then --���е�̽�����������Ҫ���⴦��
          IsSpecial = 1
    end

    return IsSpecial;
end

--  �Ƚ���, MissionTrackԭ��ֱ�����õ���QuestLog�ĺ���...
--  ���ڸ���Ϊ����, ����ӵ�и��Ե�����
function MissionTrack_CompareTable(table_a,table_b)
    if table_a[4] < table_b[4] then
        return true
    else
        return false
    end
end
