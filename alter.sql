-- $Header: /home/sol/usr/cvs/reodb/alter.sql,v 1.2 2007/08/31 11:16:18 sol Exp $

-- PRIMARY KEYS
ALTER TABLE ONLY obj		ADD CONSTRAINT obj_obj_id_pkey			PRIMARY KEY (obj_id);
ALTER TABLE ONLY ref		ADD CONSTRAINT ref_obj_id_pkey			PRIMARY KEY (obj_id);
ALTER TABLE ONLY prop		ADD CONSTRAINT prop_obj_id_pkey			PRIMARY KEY (obj_id);
ALTER TABLE ONLY value		ADD CONSTRAINT value_id_pkey			PRIMARY KEY (id);
ALTER TABLE ONLY tag		ADD CONSTRAINT tag_id_pkey			PRIMARY KEY (id);
ALTER TABLE ONLY link		ADD CONSTRAINT link_obj_id_pkey			PRIMARY KEY (obj_id);

-- OBJ
ALTER TABLE ONLY obj		ADD CONSTRAINT obj_class_id_fkey		FOREIGN KEY (class_id)		REFERENCES ref		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
CREATE INDEX			obj_class_id_idx				ON obj (class_id);
CREATE INDEX			obj_create_time_idx				ON obj (create_time);

-- REF
ALTER TABLE ONLY ref		ADD CONSTRAINT ref_name__id_uniq		UNIQUE (name,_id);
ALTER TABLE ONLY ref		ADD CONSTRAINT ref_obj_id_fkey			FOREIGN KEY (obj_id)		REFERENCES obj		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY ref		ADD CONSTRAINT ref__id_fkey			FOREIGN KEY (_id)		REFERENCES ref		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
CREATE INDEX			ref__id_idx					ON ref (_id);

-- PROP
ALTER TABLE ONLY prop		ADD CONSTRAINT prop_name_class_id_uniq		UNIQUE (name,class_id);
ALTER TABLE ONLY prop		ADD CONSTRAINT prop_obj_id_fkey			FOREIGN KEY (obj_id)		REFERENCES obj		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY prop		ADD CONSTRAINT prop_class_id_fkey		FOREIGN KEY (class_id)		REFERENCES ref		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY prop		ADD CONSTRAINT prop_type_id_fkey		FOREIGN KEY (type_id)		REFERENCES ref		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
CREATE INDEX			prop_class_id_idx				ON prop (class_id);

-- VALUE
ALTER TABLE ONLY value		ADD CONSTRAINT value_no_obj_id_prop_id_uniq	UNIQUE (no,obj_id,prop_id);
ALTER TABLE ONLY value		ADD CONSTRAINT value_obj_id_fkey		FOREIGN KEY (obj_id)		REFERENCES obj		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY value		ADD CONSTRAINT value_prop_id_fkey		FOREIGN KEY (prop_id)		REFERENCES prop		(obj_id)
										ON UPDATE CASCADE ON DELETE CASCADE;
CREATE INDEX			value_value_idx					ON value (value);
CREATE INDEX			value_obj_id_idx				ON value (obj_id);
CREATE INDEX			value_prop_id_idx				ON value (prop_id);

-- TAG
ALTER TABLE ONLY tag		ADD CONSTRAINT tag_tag_id_obj_id_uniq		UNIQUE (tag_id,obj_id);
ALTER TABLE ONLY tag		ADD CONSTRAINT tag_obj_id_fkey			FOREIGN KEY (obj_id)		REFERENCES obj		(obj_id)
										ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY tag		ADD CONSTRAINT tag_tag_id_fkey			FOREIGN KEY (tag_id)		REFERENCES obj		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
CREATE INDEX			tag_obj_id_idx					ON tag (obj_id);

-- LINK
ALTER TABLE ONLY link		ADD CONSTRAINT link_tag_id_dst_id_src_id_uniq UNIQUE (tag_id,dst_id,src_id);
ALTER TABLE ONLY link		ADD CONSTRAINT link_obj_id_fkey			FOREIGN KEY (obj_id)		REFERENCES obj		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY link		ADD CONSTRAINT link_src_id_fkey			FOREIGN KEY (src_id)		REFERENCES obj		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY link		ADD CONSTRAINT link_dst_id_fkey			FOREIGN KEY (dst_id)		REFERENCES obj		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY link		ADD CONSTRAINT link_tag_id_fkey			FOREIGN KEY (tag_id)		REFERENCES obj		(obj_id)
										ON UPDATE CASCADE ON DELETE RESTRICT;
CREATE INDEX			link_src_id_idx					ON link (src_id);
CREATE INDEX			link_dst_id_idx					ON link (dst_id);

