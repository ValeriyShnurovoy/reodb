
-- BASIC CLASSES
SELECT set_ref('scalar',		'{lang:Scalar}');
SELECT set_ref('type',			'{lang:Type}');
SELECT set_ref('tag',			'{lang:Tag}');
SELECT set_ref('state',			'{lang:State}');
SELECT set_ref('class',			'{lang:Class}');
SELECT set_ref('class,prop',		'{lang:Property}');

-- SCALARS
SELECT set_ref('scalar,integer',	'{lang:integer}');
SELECT set_ref('scalar,no',		'{lang:no}');
SELECT set_ref('scalar,money',		'{lang:money}');
SELECT set_ref('scalar,real',		'{lang:real}');
SELECT set_ref('scalar,date',		'{lang:date}');
SELECT set_ref('scalar,time',		'{lang:time}');
SELECT set_ref('scalar,datetime',	'{lang:datetime}');
SELECT set_ref('scalar,boolean',	'{lang:boolean}');
SELECT set_ref('scalar,text',		'{lang:text}');
SELECT set_ref('scalar,name',		'{lang:name}');
SELECT set_ref('scalar,login',		'{lang:login}');
SELECT set_ref('scalar,password',	'{lang:password}');
SELECT set_ref('scalar,textarea',	'{lang:textarea}');
SELECT set_ref('scalar,ip',		'{lang:ip}');
SELECT set_ref('scalar,ips',		'{lang:ips}');
SELECT set_ref('scalar,nets',		'{lang:nets}');
SELECT set_ref('scalar,mac',		'{lang:mac}');
SELECT set_ref('scalar,email',		'{lang:email}');
SELECT set_ref('scalar,emails',		'{lang:emails}');
SELECT set_ref('scalar,domain',		'{lang:domain}');
SELECT set_ref('scalar,filtertext',	'{lang:filter text}');
SELECT set_ref('scalar,label',		'{lang:label}');

-- PROPS
SELECT set_prop( 1,'class:label',	scalar_id('text'),	'{lang:Label}',		'',	TRUE,NULL,NULL,NULL);
SELECT set_prop( 2,'class:descr',	scalar_id('textarea'),	'{lang:Description}',	'',	TRUE,NULL,NULL,NULL);
SELECT set_prop( 0,'class:object_name',	scalar_id('text'),	'{lang:Object name}',	'');

SELECT set_prop( 1,'ref:_id',		class_id('ref'),	'{lang:Parent}',	NULL,	TRUE,NULL,NULL,NULL);
SELECT set_prop( 2,'ref:name',		scalar_id('name'),	'{lang:Name}',		'',	TRUE,NULL,NULL,NULL);
SELECT set_prop( 3,'ref:no',		scalar_id('no'),	'{lang:No.}',		'0',	TRUE,NULL,NULL,NULL);

SELECT set_prop( 1,'prop:class_id',	class_id('ref'),	'{lang:Class}',		NULL,	TRUE,NULL,NULL,NULL);
SELECT set_prop( 2,'prop:name',		scalar_id('name'),	'{lang:Name}',		'',	TRUE,NULL,NULL,NULL);
SELECT set_prop( 3,'prop:type_id',	class_id('ref'),	'{lang:Type}',		NULL,	TRUE,NULL,NULL,NULL);
SELECT set_prop( 4,'prop:no',		scalar_id('no'),	'{lang:No.}',		'0',	TRUE,NULL,NULL,NULL);
SELECT set_prop( 0,'prop:trigger',	scalar_id('name'),	'{lang:Trigger}');
SELECT set_prop( 0,'prop:asterisk',	scalar_id('boolean'),	'{lang:Asterisk}',	'f');
SELECT set_prop( 0,'prop:input_additional_html',scalar_id('text'),'Additional html',	'');

-- OBJECT_NAMEs
SELECT set_value(class_id('ref'),	'class:object_name',	'ref_full_name(obj_id)');
SELECT set_value(class_id('prop'),	'class:object_name',	'class_full_name(class_id)||'':''||name');

-- PRIORITIES
SELECT set_ref( 0,'type,priority',			'{lang:Priority}');
SELECT set_ref( 1,'type,priority,low',			'{lang:Low}');
SELECT set_ref( 2,'type,priority,medium',		'{lang:Medium}');
SELECT set_ref( 3,'type,priority,high',			'{lang:High}');
SELECT set_ref( 4,'type,priority,ultrahigh',		'{lang:Ultrahigh}');

-- GRADES
SELECT set_ref( 0,'type,grade',				'{lang:Grade}');
SELECT set_ref( 1,'type,grade,terrible',		'{lang:Terrible}');
SELECT set_ref( 2,'type,grade,bad',			'{lang:Bad}');
SELECT set_ref( 3,'type,grade,ok',			'{lang:O.k.}');
SELECT set_ref( 4,'type,grade,good',			'{lang:Good}');
SELECT set_ref( 5,'type,grade,excellent',		'{lang:Excellent}');

