<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String cp = request.getContextPath(); %>

<%--ContextPath 선언 --%>
<html>
<head>



<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<title>TEST</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link title="timeline-styles" rel="stylesheet" href="//cdn.knightlab.com/libs/timeline3/latest/css/timeline.css">
   <script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
    
    var titleList = new Array();
    var dateList = new Array();
    var mediaList = new Array();
   	var contentList = new Array();
    <c:forEach items="${timelineJson }" var="timeline">
    	titleList.push("${timeline.title}");
    	dateList.push("${timeline.date}");
    	mediaList.push("${timeline.media_url}");
    	contentList.push("${timeline.content}");
	</c:forEach>
	
	
	var dateMapList = new Array();
	for(var i = 0 ; i<dateList.length;i++){
		//yyyy-mm-dd hh:mm:ss
		//document.write(dateList[i]);	
		//var dateParse = dateList[i].split(/[-:. ]/);
		//var dateParseList = new Map();
		//dateParseList.push("year",dateParse[0]);
		
	}
	
	
	
	
	
    var additionalOptions = {
            start_at_end: true,
            default_bg_color: {r:70, g:0, b:0},
            timenav_height: 250
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
					titleList.push("${timeline.title}");
					dateList.push("${timeline.date}");
					mediaList.push("${timeline.media_url}");
					contentList.push("${timeline.content}");
				</c:forEach>
		        {
		            "start_date": {
		                "year":			"2015",
		                "month":		"12",
		                "day": 			"28",
		                "hour": 		"8",
		                "minute": 		"5",
		                "second": 		"33",
		                "millisecond": 	"",
		                "format": 		""
		            },
		            "media": {
		                "url": "http://d2campusfest.kr/2015/img/headerLogoD2Fest.png"
		            },
		            "text": {
		            	
		                "headline":titleList[0], 
		                "text": contentList[0]
		            }
		        },
		        {
		            "start_date": {
		                "year":			"2016",
		                "month":		"1",
		                "day": 			"1",
		                "hour": 		"5",
		                "minute": 		"34",
		                "second": 		"33",
		                "millisecond": 	"",
		                "format": 		""
		            },
		            "end_date":{
		            	"year":			"2016",
		                "month":		"1",
		                "day": 			"6",
		                "hour": 		"8",
		                "minute": 		"59",
		                "second": 		"44",
		                "millisecond": 	"",
		                "format": 		"",
		            },
		            "text": {
		                "headline": "Matter domination",
		                "text": "At this time, the densities of non-relativistic matter (atomic nuclei) and relativistic radiation (photons) are equal. The Jeans length, which determines the smallest structures that can form (due to competition between gravitational attraction and pressure effects), begins to fall and perturbations, instead of being wiped out by free-streaming radiation, can begin to grow in amplitude.</p> <p>According to ΛCDM, at this stage, cold dark matter dominates, paving the way for gravitational collapse to amplify the tiny inhomogeneities left by cosmic inflation, making dense regions denser and rarefied regions more rarefied. However, because present theories as to the nature of dark matter are inconclusive, there is as yet no consensus as to its origin at earlier times, as currently exist for baryonic matter."
		            },
		            "unique_id": ""
		        }
		       
		    ]
		
    };
  
      window.timeline = new TL.Timeline('timeline', timelineJson,additionalOptions);
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