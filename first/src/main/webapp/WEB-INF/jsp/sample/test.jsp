<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<% String cp = request.getContextPath(); %>

<%--ContextPath 선언 --%>
<html>
<head>

<%@ include file="/WEB-INF/include/include-header.jspf" %>



	<!-- timelineJS -->
	<link title="timeline-styles" rel="stylesheet" href="//cdn.knightlab.com/libs/timeline3/latest/css/timeline.css">
    <script src="//cdn.knightlab.com/libs/timeline3/latest/js/timeline.js"></script>
    <script type="text/javascript" src="https://cdn.knightlab.com/libs/timeline/latest/js/timeline-min.js"></script>
   
	 <!-- CSS-->
    <link rel="stylesheet" href="../css/timeline.css?v1">
    <!--FONT-->
    <link rel="stylesheet" href="../css/fonts/font.default.css?v1">
    <!-- Style-->
    <style>
      html, body {
      	height:80%;
      	width:80%;
      	padding: 0px;
      	margin: 0px;
      	text-align: right;
      }
      .tl-timeline {
      
      }
      
    </style> 
  </head>
  <body>
    
    <div id="timeline"></div>
    
	
		
 
    <!-- JavaScript-->
    
    <script>

    var additionalOptions = {
            start_at_end: true,
            default_bg_color: {r:70, g:0, b:0},
            timenav_height_percentage : 40,
            timenav_height_min : 100,
            //timenav_mobile_height_percentage : 40
            //track_events: 'zoom_in'
            //hash_bookmark:true
          }
    
    var timelineJson  = {
 			"eras":{ 
				"start_date": {
	                "year":			"2010",
	                "month":		"1",
	                "day": 			"1",
	                "hour": 		"0",
	                "minute": 		"0",
	                "second": 		"0",
	                "millisecond": 	"",
	                "format": 		""
	            },
	            "end_date" :{
	            	 "year":			"2020",
		             "month":			"12",
		             "day": 			"31",
		             "hour": 			"11",
		             "minute": 			"59",
		             "second": 			"59",
		             "millisecond": 	"",
		             "format": 			""
	            },
	            "text": {
	                "headline": "The Code Folio??"
	            }
				
			},
		    "scale": "human",
		    "events": [ 		
				<c:forEach items="${timelineJson }" var="timeline">
				
				{
		            "start_date": {
		                "year":			dateParse("${timeline.date}")[0],
		                "month":		dateParse("${timeline.date}")[1],
		                "day": 			dateParse("${timeline.date}")[2],
		                "hour": 		dateParse("${timeline.date}")[3],
		                "minute": 		dateParse("${timeline.date}")[4],
		                "second": 		dateParse("${timeline.date}")[5],
		                "millisecond": 	"",
		                "format": 		""
		            },
		            "media": {
		                "url": urlDefault("${timeline.media_url}")
		                
		            },
		            "text": {
		            	
		                "headline":"${timeline.title}", 
		                "text": contentSlice("${timeline.content}")
		            }
		        },
				</c:forEach>
		       
		    ]
		
    };
    window.timeline = new TL.Timeline('timeline', timelineJson,additionalOptions);
    
   
      
      function dateParse(str){ //date parse
  		var dateList = new Array();
      	var date = str.split(/[-:. ]/);
      	dateList.push(date[0]);	//year
      	dateList.push(date[1]);	//month
      	dateList.push(date[2]);	//day
      	dateList.push(date[3]);	//hour
      	dateList.push(date[4]);	//minute
      	dateList.push(date[5]);	//second
      	
      	return dateList;
  	}
      function urlDefault(url){
      	if(url == ""){
      		return "http://d2campusfest.kr/2015/img/headerLogoD2Fest.png";
      	}
      		
      	return url;
      }
      
      function contentSlice(content){ 	//content를 200글자 이하로 축소 
      	if(content.length>200){
      		return content.slice(0,200);
      	}
      	return content;
      
      }
      
      $(document).ready(function(){
			
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});
      function fn_openBoardDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}
      </script>
 
    
      
    <div class="container">
      <h2>Asterisk Glyph</h2>
      <p>Asterisk icon: <span class="glyphicon glyphicon-asterisk"></span></p>    
      <p>Asterisk icon as a link:
        <a href="#">
          <span class="glyphicon glyphicon-asterisk"></span>
        </a>
      </p>
      <p>Asterisk icon on a button:
        <button type="button" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-asterisk"></span> Asterisk
        </button>
      </p>
      <p>Asterisk icon on a styled link button:
        <a href="#" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-asterisk"></span> Asterisk
        </a>
      </p> 
    </div>
  </body>
</html>

</body>
</html>