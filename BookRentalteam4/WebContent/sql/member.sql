select * from member;
select * from book;
select * from review_board;
select * from member_board;
select * from tab;
select * from rent;

truncate table review_board; 
alter table member add rent_count int default 0;

create sequence review_board_seq
start with 1
increment by 1
nocache;