create table product_info(
	product_id varchar(32) not null,
	product_name varchar(64) not null comment '商品名称',
	product_price decimal(8,2) not null comment '商品价格',
	product_stock int not null comment '库存',
	product_description varchar(64) comment '描述',
	product_icon varchar(512) comment '图片',
	category_type int(11) not null comment '类目编号',
	product_status tinyint(3) default '0' comment '商品状态 0正常1下架',
	create_time timestamp not null default current_timestamp comment '创建时间',
	update_time timestamp not null default current_timestamp on update current_timestamp comment '更新时间',
	primary key (product_id)

) comment '商品表';

create table product_category(
	category_id int not null auto_increment,
	category_name varchar(64) not null comment '类目名字',
	category_type int not null comment '类目编号',
	create_time timestamp not null default current_timestamp comment '创建时间',
	update_time timestamp not null default current_timestamp on update current_timestamp comment '更新时间',
	primary key (category_id),
	unique key unique_category_type (category_type)
) comment '类目表';

create table order_master(
	order_id varchar(32) not null,
	buyer_name varchar(32) not null comment '买家名字',
	buyer_address varchar(128) not null comment '地址',
	buyer_phone varchar(32) not null comment '买家电话',
	buyer_openid varchar(64) not null comment '买家微信openid',
	order_amount decimal(8,2) not null comment '订单总金额',
	order_status tinyint(3) not null default '0' comment '订单状态  默认0新下单',
	pay_status tinyint(3) not null default '0' comment '支付状态 默认0未支付',
	create_time timestamp not null default current_timestamp comment '创建时间',
	update_time timestamp not null default current_timestamp on update current_timestamp comment '更新时间',
	primary key (order_id),
	key index_id (buyer_openid)

) comment '订单表';

create table order_detail(
	detail_id varchar(32) not null,
	order_id varchar(32) not null,
	product_id varchar(32) not null,
	product_name varchar(64) not null comment '商品名称',
	product_price decimal(8,2) not null comment '商品价格',
	product_quantity int not null comment '商品数量',
	product_icon varchar(512) comment '图片',
	create_time timestamp not null default current_timestamp comment '创建时间',
	update_time timestamp not null default current_timestamp on update current_timestamp comment '更新时间',
	primary key (detail_id),
	key index_id (order_id)
)comment '订单详情';