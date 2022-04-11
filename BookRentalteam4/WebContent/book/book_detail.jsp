<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세</title>
</head>



<body>

      <table border = 1 width=600 height=300 align=center cellpadding=15px>
         <caption align=center>
            <h2>도서 상세 페이지</h2>
         </caption>
         <tr valign="top">
            <td width=150><img src = "./admin/bookfileupload.jsp?file_name=${book.book_Cover} " style="width:300px; height:300px;"/></td>
            <td left=5px>저자  ;${book.writer}<br> <br> 출판사 ;${book.publisher}<br> <br> 장르  ;${book.genre}<br>
               <br> 도서번호  ;${book.book_Num}<br>
            </td>
         </tr>
         <tr>
            <td colspan = 2 align = center>
            <input align=center type="submit" value="대출 신청">
            <input type="button" value="예약 신청">
            </td>
         </tr>
      </table>
      
      
      <table table border="1" width="600" align=center cellpadding = 10px>
         <caption align=center>
            <h2>리뷰</h2>
         </caption>   
<!--       <tr>
            <td colspan = 3 align = left><h2></h2></td>
         </tr>
 -->      <tr align = center>
            <td border = 1 width = 350>제목</td>
            <td>작성자</td>
            <td>작성일</td>
         </tr>
         <tr height = 10></tr>
         <tr align = center>
            <td>감상</td>         
            <td>글쓴이</td>         
            <td>작성일</td>         
         </tr>
         <tr align = center>
            <td>감상</td>         
            <td>글쓴이</td>         
            <td>작성일</td>         
         </tr>
         <tr align = center>
            <td>감상</td>         
            <td>글쓴이</td>         
            <td>작성일</td>         
         </tr>
         <tr height = 10></tr>
         <tr valign="top">
            <td colspan = 3 align = right>
            <input type="submit" align="right" value="리뷰게시판 가기">
            </td>
         </tr>
      </table>



</body>
</html>