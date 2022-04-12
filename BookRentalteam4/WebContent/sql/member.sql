select * from member;
select * from book;
select * from review_board;
select * from member_board;
select * from tab;
select * from rent;

truncate table review_board; 
truncate table rent; 
alter table member add rent_count int default 0;

insert into rent values(rent_seq.nextval, 13, 'test', sysdate, sysdate+14);


alter sequence rent_seq increment by 1;

create sequence rent_seq
start with 1
increment by 1
nocache;

create sequence review_board_seq
start with 1
increment by 1
nocache;

select rt.book_num, bk.book_name, bk.writer, bk.publisher,rt.rent_num, rt.id, rt.rent_date, rt.return_date from rent rt, book bk where rt.book_num = bk.book_num and rt.id = 'pikachu';

select book_name from book where book_num = 7;
select count(*) from rent where id = 'pikachu';
select count(*) from review_board where id like 'test';
select * from review_board where rb_num >= 1 and rb_num <=51 and id like 'pikachu'; 