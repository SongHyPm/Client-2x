-- ���� �i�m �ɼ�[�ɿ��ҩ]

-- �ű���
x710531_g_ScriptId = 710531

-- ���� �i�m��Ϣ
x710531_g_GPInfo = {}

-- �������
x710531_g_RandNum = 10000

-- abilityId: ���� �i�m��Ӧ���� name: ���� �i�mto� � T�n
-- mainId: ��Ҫ������ mExtraCountOdds: ��Ҫ����������������to� � ����
-- associatedId: ����Ʒ�б�,aOdds ���ʳ���ʱ�����m�t c�i,�б����Ϊ�� aOdds: ����Ʒ������ aExtraCountOdds: ���ָ���Ʒ�������������
-- rareId: ϡ����Ʒ,ϡ����Ʒ����û��,�� -1, rOdds: ϡ����Ʒ������
-- needLevel: �ɼ������� �i�mC�n to� � c�p��

-- ���²���Ϊ��ҩ

x710531_g_GPInfo[776] = { abilityId = ABILITY_CAIYAO, name = "K�nh H� Thi�n Ni�n Th�o", mainId = 40004414 }

-- ���ϲ���Ϊ��ҩ

-- ������ �i�m
function x710531_OnCreate( sceneId, growPointType, x, y )
	
	
	-------------------------------------------------------------------	
	--���ng��ʼ
	local actId = 36;	
	local bActStatus = GetActivityParam( sceneId, actId, 0 );
	
	if bActStatus <= 0 then
		return -1;
	end
	
	--��ҩ��ng���Ѿ�����
	local bQianNianCaoGen = GetActivityParam( sceneId, actId, 1 );

	if bQianNianCaoGen > 0 then
		return -1;
	end
	-------------------------------------------------------------------

	
	PrintStr("growPointType".."x:"..x.."y:"..y);

	-- ÿc�i���� �i�m������ �i�m��m�t c�i��Ʒ,����ֱ�ӷ��� itembox ��m�t c�i
	local ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, 40004414 )	
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,30*60*1000)	--�趨����ʱ��
	
	SetActivityParam( sceneId, actId, 1, 1 );
	
--	local message = format("@*;SrvMsg;SCA:#{JingHu_LingYao_00}" );	
--	AddGlobalCountNews( sceneId, message )

end

--  �i�m������ �i�mʱ
function x710531_OnOpen( sceneId, selfId, targetId )



	return OR_OK
end

-- ������������
function x710531_OnProcOver( sceneId, selfId, targetId )
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	

	-- ����Tinh��
--	CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, GPInfo.abilityId, GPInfo.needLevel )
	return OR_OK
end

-- ���Ӽ�����,����
function x710531_OnRecycle( sceneId, selfId, targetId)
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	

	--ͳ������
	LuaFnAuditHDXianCaoZhengDuo(sceneId, selfId, "H�i thu th�p Ti�n th�o");

--	LuaFnAuditAbility(sceneId, selfId, GPInfo.abilityId, -1, -1)
	-- ����������
--	CallScriptFunction( ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, GPInfo.abilityId, GPInfo.needLevel )
	--Tr� v�1,���� �i�m����
	return 1
end

function x710531_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x710531_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
