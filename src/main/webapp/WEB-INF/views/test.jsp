<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://wstatic-cdn.plaync.com/common/js/lib/jquery-3.1.0.min.js"></script>
</head>
<body>
	 <script>
        $(function() {
                $.ajax({
                    url: 'http://mystory.duckdns.org:8080/board/list-json',
                    type: 'get',
                    dataType: 'json',
                    success:function(data){
//                     	var obj = JSON.parse(data);
                        console.log(data[1].B_NO);
                    }
                })
        });
    </script>
</body>
</html>