--�����BOSSˢ�¹���

--�ű����
x892006_g_ScriptId	= 892006

function x892006_OnRespawn( sceneId, selfId, targetId )
	local nam_mob = GetName( sceneId, selfId )
	local str ="";	
	if nam_mob=="��������" then
		str = format("#Y[��������]#PЯ���˴��������챦������#G��������<117,116>#P,����������������֮�֣��¸ҵ������ǣ��Ͻ��������ǵ�����������")
	elseif nam_mob=="��ԭ�ػ���" then
		str = format("#Y[��ԭ�ػ���]#PЯ���˴��������챦������#GĮ����ԭ<161,96>#P,��ԭ���������ػ���֮�֣��¸ҵ������ǣ��Ͻ��������ǵ�Į����ԭ��")
	elseif nam_mob=="�ϻ�����" then
		str = format("#Y[�ϻ�����]#PЯ���˴��������챦������#G����ϻ�<138,111>#P,����ϻ����������ػ���֮�֣��¸ҵ������ǣ��Ͻ��������ǵ�����ϻ���")
	end
	AddGlobalCountNews( sceneId, str )
end
--**********************************
--Monster Timer
--**********************************
function x892006_OnCharacterTimer( sceneId, objId, dataId, uTime )
	--ȫ�򹫸�
	--local	nam_mob	= GetName( sceneId, objId )
	--if nam_mob ~= nil then
	--	str	= format( "#G����ѩԭ#P���������ˣ�ΰ���123#P���Ѿ�������Ȩ�ȳ����������������ˣ�", nam_mob )
	--	AddGlobalCountNews( sceneId, str )
	--end
	--AddGlobalCountNews( sceneId, "objId:"..objId )
	--ȡ��ʱ��
	--SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--�����¼�
--**********************************
function x892006_OnDie( sceneId, objId, killerId )
	--ȫ�򹫸�
	local	nam_mob	= GetName( sceneId, objId )
	local	nam_ply	= GetName( sceneId, killerId )
	if nam_mob ~= nil and nam_ply ~= nil then
		str	= format( "#P����#W#{_INFOUSR%s}#P��������һ����ս��#G%s#P���ڱ�����ˡ�", nam_ply, nam_mob )
		AddGlobalCountNews( sceneId, str )
	end
end
