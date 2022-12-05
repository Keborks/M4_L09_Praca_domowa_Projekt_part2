CREATE TABLE expense_tracker.bank_account_owner(
id_ba_own INTEGER PRIMARY KEY,
owner_name VARCHAR(50) NOT NULL,
owner_desc VARCHAR(250),
user_login INTEGER NOT NULL,
active VARCHAR(1) DEFAULT '1' NOT NULL,
insert_date TIMESTAMP DEFAULT current_timestamp,
update_date TIMESTAMP DEFAULT current_timestamp);

CREATE TABLE expense_tracker.bank_account_types(
id_ba_typ INTEGER PRIMARY KEY,
ba_type VARCHAR(50) NOT NULL,
ba_desc VARCHAR(250),
active VARCHAR(1) DEFAULT '1' NOT NULL,
is_common_account VARCHAR(1) DEFAULT '0' NOT NULL,
id_ba_own INTEGER,
insert_date TIMESTAMP DEFAULT current_timestamp,
update_date TIMESTAMP DEFAULT current_timestamp,
FOREIGN KEY (id_ba_own) REFERENCES expense_tracker.bank_account_owner(id_ba_own)
);

CREATE TABLE expense_tracker.transaction_bank_accounts(
id_trans_ba INTEGER PRIMARY KEY,
id_ba_own INTEGER,
id_ba_typ INTEGER,
bank_account_name VARCHAR (50) NOT NULL,
bank_account_desc VARCHAR(250),
active VARCHAR(1) DEFAULT '1' NOT NULL,
insert_date TIMESTAMP DEFAULT current_timestamp,
update_date TIMESTAMP DEFAULT current_timestamp,
FOREIGN KEY (id_ba_own) REFERENCES expense_tracker.bank_account_owner (id_ba_own),
FOREIGN KEY (id_ba_typ) REFERENCES expense_tracker.bank_account_types (id_ba_typ)
);

CREATE TABLE expense_tracker.transaction_category (
id_trans_cat INTEGER PRIMARY KEY,
category_name VARCHAR(50) NOT NULL,
category_description VARCHAR(250),
active VARCHAR(1) DEFAULT '1' NOT NULL,
insert_date TIMESTAMP DEFAULT current_timestamp,
update_date TIMESTAMP DEFAULT current_timestamp);

CREATE TABLE expense_tracker.transaction_subcategory (
id_trans_subcat INTEGER PRIMARY KEY,
id_trans_cat INTEGER,
subcategory_name VARCHAR(50) NOT NULL,
subcategory_description VARCHAR(250),
active VARCHAR(1) DEFAULT '1' NOT NULL,
insert_date TIMESTAMP DEFAULT current_timestamp,
update_date TIMESTAMP DEFAULT current_timestamp,
FOREIGN KEY (id_trans_cat) REFERENCES expense_tracker.transaction_category
);

CREATE TABLE expense_tracker.transaction_type (
id_trans_type INTEGER PRIMARY KEY,
transaction_type_name VARCHAR(50) NOT NULL,
transaction_type_desc VARCHAR(250),
active VARCHAR(1) DEFAULT '1' NOT NULL,
insert_date TIMESTAMP DEFAULT current_timestamp,
update_date TIMESTAMP DEFAULT current_timestamp);

CREATE TABLE expense_tracker.users (
id_user INTEGER PRIMARY KEY,
user_login VARCHAR(25) NOT NULL,
user_name VARCHAR(50) NOT NULL,
user_password VARCHAR(100) NOT NULL,
password_salt VARCHAR(100) NOT NULL,
active VARCHAR(1) DEFAULT '1' NOT NULL,
insert_date TIMESTAMP DEFAULT current_timestamp,
update_date TIMESTAMP DEFAULT current_timestamp);

CREATE TABLE expense_tracker.transactions(
id_transaction INTEGER PRIMARY KEY,
id_trans_ba INTEGER,
id_trans_cat INTEGER,
id_trans_subcat INTEGER,
id_trans_type INTEGER,
id_user INTEGER,
transaction_date DATE DEFAULT current_date,
transaction_value NUMERIC(9,2),
transaction_description TEXT,
insert_date TIMESTAMP DEFAULT current_timestamp,
update_date TIMESTAMP DEFAULT current_timestamp,
FOREIGN KEY (id_trans_ba) REFERENCES expense_tracker.transaction_bank_accounts (id_trans_ba),
FOREIGN KEY (id_trans_cat) REFERENCES expense_tracker.transaction_category (id_trans_cat),
FOREIGN KEY (id_trans_subcat) REFERENCES expense_tracker.transaction_subcategory (id_trans_subcat),
FOREIGN KEY (id_trans_type) REFERENCES expense_tracker.transaction_type (id_trans_type),
FOREIGN KEY (id_user) REFERENCES expense_tracker.users (id_user)
);
