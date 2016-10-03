--�µ�Ԫ���̵�

x888902_g_scriptId = 888902
--Ԫ���̵��б� Ҫ��ͻ��˽����Ӧ
x888902_g_shoplist = {}
x888902_g_shoplist[1]	= {217, 218, 219,222}				--������
x888902_g_shoplist[2]	= {149, 150, 198, 193, 209}			--��ʯ�̳�,���"����ʯի--149",czf,2009.07.21
x888902_g_shoplist[3]	= {136, 137, 144, 194, 135, 152, 195, 240}			--�����̳�
x888902_g_shoplist[4]	= {231, 232, 233, 234, 235, 236, 237, 238}				--�ϱ��ӻ�
x888902_g_shoplist[5]	= {120, 181, 145, 182, 134}			--����㳡
x888902_g_shoplist[6]	= {250,239}				--�����˼�
--x888902_g_shoplist[7]	= {225, 226, 227, 228, 229, 230}						--�书�ؼ�
x888902_g_shoplist[7]	= {225,146,244}
x888902_g_shoplist[8]	= {156, 157, 158, 159, 160, 161, 162, 163}	--����ͼ
x888902_g_shoplist[9]	= {149,150, 178, 198, 194, 136}			--��Ҫ��ǿ��
x888902_g_shoplist[10]	= {134, 120, 181, 145, 182}			--��Ҫ��������
x888902_g_shoplist[11]	= {149,150, 178, 193, 137}			--��Ҫ���켫Ʒװ��
x888902_g_shoplist[12]	= {194, 135, 152, 195}				--��Ҫ���켫Ʒ����
x888902_g_shoplist[13]	= {134, 144}					--��Ҫ�ƶ��ĸ���
x888902_g_shoplist[14]	= {191, 192, 133, 120, 134}			--��Ҫ����˱��
x888902_g_shoplist[15]	= {146, 135, 152}				--��Ҫѧϰ�¼���

x888902_g_shoplist[101]	= {245, 247,251,246, 241,242 ,253 }		--������(��Ʒ,����������������ʱװ,�������,�书1���书2,�������220BOSS��)
x888902_g_shoplist[102]	= {178,211,210}				--��ʯ�̳�
x888902_g_shoplist[103]	= {243}				--�����̳�
x888902_g_shoplist[104]	= {284}				--�ϱ����
x888902_g_shoplist[105]	= {252,223,224}				--��Ҫ��ǿ(�����书��������꣬��ܶ�Ź���书�ؼ����书�ؼ�)
x888902_g_shoplist[106]	= {190, 191, 249,192,133}				--�����˼�

--**********************************
-- ��������NPC�Ĺ���
-- op��������𣬱���1����Ԫ����ص������������
--**********************************
function x888902_OpenYuanbaoShop( sceneId, selfId, targetId , shopA ,shopB,param1,param2 )
	if targetId == 1001 and shopA == 1001 then
		x300053_GoldToZD( sceneId, selfId, shopB)
		return
	elseif targetId == 1002 and shopA == 1002 then
		x300053_MRXinFa(sceneId,selfId,shopB,param1,param2)
		return
	end

	local bCheck = x888902_YuanbaoShopCheckOp(sceneId,selfId);
	
	if bCheck > 0 then
		if shopA > 0 and shopA < 200 and x888902_g_shoplist[shopA][shopB] ~= nil then
			--PrintStr(x888902_g_shoplist[shopA][shopB])
			if targetId == -1 then
				DispatchYuanbaoShopItem( sceneId, selfId, x888902_g_shoplist[shopA][shopB])
			else
				DispatchNpcYuanbaoShopItem( sceneId, selfId, targetId , x888902_g_shoplist[shopA][shopB])
			end
		end
	end
end

function x888902_YuanbaoShopCheckOp(sceneId,selfId)
	--�ظ�
	if sceneId == 77 then 
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:�ظ��ﲻ��ʹ��������", 0);
		return 0
	end
	--��Ӹ���
	local selfHasTeamFlag = LuaFnHasTeam(sceneId, selfId);
	if selfHasTeamFlag and selfHasTeamFlag == 1 then
		local teamFollowFlag = IsTeamFollow(sceneId,selfId);
		local teamLeaderFlag = LuaFnIsTeamLeader(sceneId,selfId);
		if not teamLeaderFlag or not teamFollowFlag then
			return 0
		end
		if teamFollowFlag ~= 0 and teamLeaderFlag ~= 1 then
			return 0
		end
	end
	--˫�����
	local selfHasDRideFlag = LuaFnGetDRideFlag(sceneId, selfId);
	if selfHasDRideFlag and selfHasDRideFlag == 1 then
		local selfIsDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, selfId);
		if not selfIsDRideMountOwner or selfIsDRideMountOwner ~= 1 then
			--����˫�����״̬�����Ǳ����ģ�����������������
			return 0
		end
	end
	--15������
	local level = GetLevel(sceneId,selfId);
	if nil == level or level < 15 then
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:�˹���ֻ�е����ĵȼ����ڵ���15����ʱ�򷽿�ʹ��", 0);
		return 0
	else

		return 1
	end
	return 0
end
