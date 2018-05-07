<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
      <title>내가 찜한 목록</title>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
   integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
   crossorigin="anonymous">
      
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
       <link rel="stylesheet" href="/resources/demos/style.css">
       <link href="https://cdn.rawgit.com/singihae/Webfonts/master/style.css" rel="stylesheet" type="text/css" />
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
       <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
         
        <script type="text/javascript">
        $(function() {
        	
             var date = new Date();
             var currentMonth = date.getMonth();
             var currentDate = date.getDate();
             var currentYear = date.getFullYear();

             $('#datepicker').datepicker({
                 dateFormat: 'yy-mm-dd'
             });
             
          var changeday1 = <%= request.getAttribute("changeday1") %>;
          var changeday2 = <%= request.getAttribute("changeday2") %>;
          var changeday3 = <%= request.getAttribute("changeday3") %>;
       	  
          if(changeday1 != null){
        	  console.log(changeday1);
       		  $('#datepicker').val(changeday1+"-"+changeday2+"-"+changeday3);
       	      $('#daybtn').click();
          }
             
          });        
        
        $( function() {

      $(document).on("click","#t9>button",function(){ var time = 't9'; clicktime(time); });
      $(document).on("click","#t10>button",function(){ var time = 't10'; clicktime(time); });
      $(document).on("click","#t11>button",function(){ var time = 't11'; clicktime(time); });
      $(document).on("click","#t12>button",function(){ var time = 't12'; clicktime(time); });
      $(document).on("click","#t13>button",function(){ var time = 't13'; clicktime(time); });
      $(document).on("click","#t14>button",function(){ var time = 't14'; clicktime(time); });
      $(document).on("click","#t15>button",function(){ var time = 't15'; clicktime(time); });
      $(document).on("click","#t16>button",function(){ var time = 't16'; clicktime(time); });
      $(document).on("click","#t17>button",function(){ var time = 't17'; clicktime(time); });
      $(document).on("click","#t18>button",function(){ var time = 't18'; clicktime(time); });
      $(document).on("click","#t19>button",function(){ var time = 't19'; clicktime(time); });
      $(document).on("click","#t20>button",function(){ var time = 't20'; clicktime(time); });
      $(document).on("click","#t21>button",function(){ var time = 't21'; clicktime(time); });
      $(document).on("click","#t22>button",function(){ var time = 't22'; clicktime(time); });
      $(document).on("click","#t23>button",function(){ var time = 't23'; clicktime(time); });
      $(document).on("click","#t24>button",function(){ var time = 't24'; clicktime(time); });

      
      $(document).on("click","#t9>.button7",function(){ var time = 't9'; setcancelbutton(time); });
      $(document).on("click","#t10>.button7",function(){ var time = 't10'; setcancelbutton(time); });
      $(document).on("click","#t11>.button7",function(){ var time = 't11'; setcancelbutton(time); });
      $(document).on("click","#t12>.button7",function(){ var time = 't12'; setcancelbutton(time); });
      $(document).on("click","#t13>.button7",function(){ var time = 't13'; setcancelbutton(time); });
      $(document).on("click","#t14>.button7",function(){ var time = 't14'; setcancelbutton(time); });
      $(document).on("click","#t15>.button7",function(){ var time = 't15'; setcancelbutton(time); });
      $(document).on("click","#t16>.button7",function(){ var time = 't16'; setcancelbutton(time); });
      $(document).on("click","#t17>.button7",function(){ var time = 't17'; setcancelbutton(time); });
      $(document).on("click","#t18>.button7",function(){ var time = 't18'; setcancelbutton(time); });
      $(document).on("click","#t19>.button7",function(){ var time = 't19'; setcancelbutton(time); });
      $(document).on("click","#t20>.button7",function(){ var time = 't20'; setcancelbutton(time); });
      $(document).on("click","#t21>.button7",function(){ var time = 't21'; setcancelbutton(time); });
      $(document).on("click","#t22>.button7",function(){ var time = 't22'; setcancelbutton(time); });
      $(document).on("click","#t23>.button7",function(){ var time = 't23'; setcancelbutton(time); });
      $(document).on("click","#t24>.button7",function(){ var time = 't24'; setcancelbutton(time); });
      

           $( "#draggable" ).draggable({
               connectToSortable: "#sortable",
               helper: "clone",
             });
             $( "ul, li" ).disableSelection();
           } );
         
        </script>
   
   </head>
   
      <style type="text/css">
      
      .ui-datepicker-header {
         background-color: #bafcea;
      }
   
      .ui-state-highlight{
       background-color: #F2F2F2;
       border-width: 1px;
       border-color: #D8D8D8;
      }
      
        .myul { list-style-type: none; margin: 5px; padding: 5px; margin-bottom: 10px;}
       
          .myli { margin: 5px; padding: 5px; width: 250px; }
      
         .button {
             background-color: #bafcea;
             border: none;
             color: #000000;
             padding: 10px;
             text-align: center;
             text-decoration: none;
             display: inline-block;
             font-size: 16px;
             margin: 4px 2px;
             cursor: pointer;
             border:0;
             outline:0;
         }
         .button4 {
         border-radius: 12px;
         font-family:'BM JUA','배달의민족 주아';
         font-size: 15px";
         width: 140px;
         color: #000000;
         
         }

         .button6 {
         border-radius: 12px;
         font-family:'BM JUA','배달의민족 주아';
         font-size: 15px";
         color: #000000;
         width: 140px;
         
         }
       
         .button5 {
         border-radius: 12px;
         font-family:'BM JUA','배달의민족 주아';
         font-size: 20px";
         width: 100px;
         color: #000000;
         }

          .button7 {
          
          background-color: #F2F2F2;
          border: none;
          padding: 0px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 16px;
          margin: 4px 2px;
          cursor: pointer;
          border:0;
          outline:0; 
          border-radius: 12px;
          font-family:'BM JUA','배달의민족 주아';
          color: #000000;
         }

         .thumnailimgdiv{
         width:335px;
         height:225px;
         }

         .thumnailimg{
          width:335px;
          height:225px;
          cursor:pointer;
         }

</style>

<body>

<!-- header -->
<jsp:include page="../include/header.jsp"></jsp:include>


      <!-- content -->
  <div class="container" style="padding-top: 50px">
		<div class="jumbotron" style=" background-repeat: no-repeat; background-size: 100% 100%; height:300px; background-image: url('images/couple3.jpg');">
    </div><!-- end/jumbotron -->

<div class="row">
<div class="col-lg-8 col-sm-6">
<button class="button button4" style="font-family:'BM JUA','배달의민족 주아',sans-serif; font-size: 15px" id="mybtn">나의 찜 목록</button>
<button class="button button4" style="font-family:'BM JUA','배달의민족 주아',sans-serif; font-size: 15px" id="partnerbtn">파트너 찜 목록</button>

</div>
<div class="col-lg-4 col-sm-6">

<input type="text" id="datepicker" size="25px" placeholder="클릭하여 날짜를 입력">

     <button class="button button4" style="font-family:'BM JUA','배달의민족 주아',sans-serif; font-size: 15px" id="daybtn">일정표 불러오기</button>
</div>

</div> <!-- row/end -->

  <div class="row"">
      <div class = "col-sm-8" id = "col_main">
          
         
   <!-- 비동기 처리로 여기에 append 되게 된다 -->
   
   
   
    </div>
    
<div class = "col-sm-4">
  <div class="col-lg-4 col-sm-6" id="col_3">
      <ul class="myul">
        <li id="draggable" class="ui-state-highlight myli" style="height:50px; text-align: center; font-size:15px; color:black">활동을 클릭하세요</li>
         </ul>
 
<ul id="sortable" class="myul">
<div id= "sortli">
  <li class="ui-state-default myli" id="t9" style="color:black"><button class="button button5" onclick='clicktime("t9")'>&nbsp9시&nbsp</button></li>
  <li class="ui-state-default myli" id="t10" style="color:black"><button class="button button5" onclick='clicktime("t10")' id=''>10시</button></li>
  <li class="ui-state-default myli" id="t11" style="color:black"><button class="button button5" onclick='clicktime("t11")' id=''>11시</button></li>
  <li class="ui-state-default myli" id="t12" style="color:black"><button class="button button5" onclick='clicktime("t12")' id=''>12시</button></li>
  <li class="ui-state-default myli" id="t13" style="color:black"><button class="button button5" onclick='clicktime("t13")' id=''>13시</button></li>
  <li class="ui-state-default myli" id="t14" style="color:black"><button class="button button5" onclick='clicktime("t14")' id=''>14시</button></li>
  <li class="ui-state-default myli" id="t15" style="color:black"><button class="button button5" onclick='clicktime("t15")' id=''>15시</button></li>
  <li class="ui-state-default myli" id="t16" style="color:black"><button class="button button5" onclick='clicktime("t16")' id=''>16시</button></li>
  <li class="ui-state-default myli" id="t17" style="color:black"><button class="button button5" onclick='clicktime("t17")' id=''>17시</button></li>
  <li class="ui-state-default myli" id="t18" style="color:black"><button class="button button5" onclick='clicktime("t18")' id=''>18시</button></li>
  <li class="ui-state-default myli" id="t19" style="color:black"><button class="button button5" onclick='clicktime("t19")' id=''>19시</button></li>
  <li class="ui-state-default myli" id="t20" style="color:black"><button class="button button5" onclick='clicktime("t20")' id=''>20시</button></li>
  <li class="ui-state-default myli" id="t21" style="color:black"><button class="button button5" onclick='clicktime("t21")' id=''>21시</button></li>
  <li class="ui-state-default myli" id="t22" style="color:black"><button class="button button5" onclick='clicktime("t22")' id=''>22시</button></li>
  <li class="ui-state-default myli" id="t23" style="color:black"><button class="button button5" onclick='clicktime("t23")' id=''>23시</button></li>
  <li class="ui-state-default myli" id="t24" style="color:black"><button class="button button5" onclick='clicktime("t24")' id=''>24시</button></li>
</div>
  <li><button class="button button4" style="font-family:'BM JUA','배달의민족 주아',sans-serif; width:250px; font-size: 25px" id="timetablesavebtn">일정표 저장하기</button>
  </li>
</ul>
         </div>
      </div> <!-- 일정표 col 4 -->
   </div> <!-- end-row -->

</div> <!-- end - container -->


      <!-- footer -->
      <jsp:include page="../include/footer.jsp"></jsp:include>
   </body>
      
      <script type="text/javascript">
      
      // 세션에서 현재 유저 아이디 가져옴
      var currentid ='';
      
      // 상세보기 클릭시 작동 함수
      function detailgo(contentnum) {
         location.href = "contentDetail.db?contentnum=" + contentnum;
      }

      // 삭제하기 클릭시 작동 함수
      function deletego(contentnum) {
    	 currentid = "<%=session.getAttribute("id")%>";
         $.ajax(
               {
                   type: "POST",
                   url:"deletepoint.db", 
                     data:{userid:currentid, contentnumber:contentnum},
                     dataType:"json",
                     success:function(rdata){
                        $("#mybtn").click();
                     },
                     
                     error:function(xhr){
                       alert('error :' + xhr.status + "/" + xhr.statusText);
                     }
         
               }
         ); // end - ajax
      } // end - deletego
       
       //썸네일 클릭시 #draggable에 덮어 씌우는 함수
       function imgclick(contentnum){
    	  activity = true;
    	   
          $.ajax(
                     {
                         type:"POST",
                         
                         url:"contentfind.db", 
                         
                         data:{
                           "contentnum" : contentnum
                             },
                             
                         dataType:"json", 
                         
                         success:function(rdata){
                             console.log(rdata);
                             
                        $(rdata).each(function() {
                          
                        	// div에 테마번호 부여
						   var startdiv = '<div style="font-size:12px" id="';
						   startdiv+= this.themenum;
						   startdiv+= this.contentnum + '">';
                        	
                           var themeicon = setthemeicon2(this.themenum);

                           // span에 콘텐츠 번호 넘겨주기
                           var completedraggable1 = ' id="' + contentnum + 'con">';
                           var completedraggable2 = this.title + '</span>';
							
                           var enddiv = '</div>'
                           
                           $("#draggable").html("");
                               $("#draggable").append(startdiv+themeicon+'&nbsp&nbsp&nbsp'+completedraggable1+completedraggable2+enddiv);
                           
                        });
                      },
                         
                         error:function(xhr){
                             alert('error :' + xhr.status + "/" + xhr.statusText);
                         }
                     }       
                 ); // end - .ajax

       } // end - imgclick
       
       
       
       var activity = false;
       // n시 버튼 클릭시 발동
          function clicktime(time){
           
    	   if(activity){
    		   
    	    var realtime='';
             
             // 9시 혹은 그 외(두 자리) 판단하여 9시일때만 nbsp양쪽에 하나씩 더한다
             if(time.length == 2){
             var settime = time.substring(1,2);
            realtime = '&nbsp';
            realtime += settime;
            realtime += '&nbsp';
             
             } else {
                var settime = time.substring(1,3);
                realtime = settime;
             }
             
             $("#"+time).addClass("ui-state-highlight");


             var themenumAndcontentnum = $("#draggable>div").attr('id');
             
             var themenum = themenumAndcontentnum.substring(0,1);
             var contentnum = themenumAndcontentnum.substring(1,themenumAndcontentnum.length);
			
             var buttonstr = '<button class="button button5" id="' + contentnum + '">' + realtime + '시</button>'
             var themeicon = setthemeicon(themenum);
             var text = $("#draggable").text();
             var nbsp = '&nbsp&nbsp&nbsp';
             var cancelbutton = '<button class="button7">x</button>';

             $("#"+time).html("");
             $("#"+time).append(buttonstr+cancelbutton+nbsp+themeicon+nbsp+text);
             
    	   }
     }
      
       // 나의 찜 목록 버튼 누르면 나의 찜 목록을 불러온다
        $("#mybtn").click(function(){
        	
        currentid = "<%=session.getAttribute("id")%>";
        
           // 일단 기존의 것들을 비워준다
           $('#col_main').empty();
           
                      $.ajax(
                                {
                                    type:"POST",
                                    
                                    url:"pointlist.db", 
                                    
                                    data:{
                                      "userid" : currentid
                                        },
                                        
                                    dataType:"json", 
                                    
                                    success:function(rdata){
                                    	
         console.log(rdata);
         $(rdata).each(function() {
         var themenum = this.themenum;
         var thumnail_str = '<div class="col-sm-6"><div class="thumbnail" style="display: block; height:320px">';

         	thumnail_str+= '<div class = "thumnailimgdiv"><img class="thumnailimg" src="upload/' + this.topimage + '" onclick="imgclick('+ this.contentnum +');"></div>';
            thumnail_str+= '장소이름 : ' + this.title + '<span class="far fa-thumbs-up" style="color:blue;"></span>' + this.good + '<br>';
            thumnail_str+= '위치 : ' + this.regionname + '<br>';
            thumnail_str+= '&nbsp&nbsp&nbsp&nbsp<button class="button button6" style="width:140px" onclick="detailgo('+ this.contentnum +')">상세보기</button>';                               
            thumnail_str+= '&nbsp&nbsp&nbsp&nbsp<button class="button button6" style="width:140px" onclick="deletego('+ this.contentnum +')">삭제하기</button>';
            thumnail_str+= '</div></div>';
         
            $('#col_main').append(thumnail_str);
            
          });
                                 
                                    },
                                    
                                    error:function(xhr){
                                        alert('error :' + xhr.status + "/" + xhr.statusText);
                                    }
                                }       
                            ); // end - .ajax

        });
      
       function partnerpointshow(partnerid){
    	  
    	   currentid = "<%=session.getAttribute("id")%>";
    	   if(partnerid.length<1){
    		   alert('파트너가 없습니다. 파트너를 등록해주세요');
    	   return;
    	   }
    	   
    	// 일단 기존의 것들을 비워준다
           $('#col_main').empty();
           
           $.ajax(
                   {
                       type:"POST",
                       
                       url:"pointlist.db", 
                       
                       data:{
                         "userid" : partnerid
                           },
                           
                       dataType:"json", 
                       
                       success:function(rdata){
                    	   alert('파트너이신 ' + partnerid + '님의 찜 목록입니다.');
$(rdata).each(function() {
console.log(rdata);
var themenum = this.themenum;
var thumnail_str = '<div class="col-sm-6"><div class="thumbnail" style="display: block; height:320px">';

	thumnail_str+= '<div class = "thumnailimgdiv"><img class="thumnailimg" src="upload/' + this.topimage + '" onclick="imgclick('+ this.contentnum +');"></div>';
thumnail_str+= '장소이름 : ' + this.title + '<span class="far fa-thumbs-up" style="color:blue;"></span>' + this.good + '<br>';
thumnail_str+= '위치 : ' + this.regionname + '<br>';
thumnail_str+= '&nbsp&nbsp&nbsp&nbsp<button class="button button6" style="width:140px" onclick="detailgo('+ this.contentnum +')">상세보기</button>';                               
thumnail_str+= '&nbsp&nbsp&nbsp&nbsp<button class="button button6" style="width:140px" onclick="deletego('+ this.contentnum +')">삭제하기</button>';
thumnail_str+= '</div></div>';

$('#col_main').append(thumnail_str);

});
                    
                       },
                       
                       error:function(xhr){
                           alert('error :' + xhr.status + "/" + xhr.statusText);
                       }
                   }       
               ); // end - .ajax
    	   
    	   
       }
       
       
        $("#partnerbtn").click(function(){
        	
        	currentid = "<%=session.getAttribute("id")%>";
        	var partnerid = '';
        	
        	$('#col_main').empty();
                $.ajax(
                          {
                              type:"POST",
                              
                              url:"findpartner.db", 
                              
                              data:{
                                "userid" : currentid
                                  },
                                  
                              dataType:"json", 
                              
                              success:function(rdata){
                                 $(rdata).each( function(){ 
                                	 partnerid=this;
                                 });
                                 
                                 partnerpointshow(partnerid);                                 
                              },
                              
                              error:function(xhr){
                                  alert('error :' + xhr.status + "/" + xhr.statusText);
                              }
                          }); // end - .ajax
                         
        }); // end - partnerbtn
        
        
        
        // 각 시각 버튼에 있는 취소버튼-> 누르면 아무일도 안하는 일정으로 세팅
        function setcancelbutton(time){
 			var realtime='';
             
             // 9시 혹은 그 외(두 자리) 판단하여 9시일때만 nbsp양쪽에 하나씩 더한다
             if(time.length == 2){
             var settime = time.substring(1,2);
            realtime = '&nbsp';
            realtime += settime;
            realtime += '&nbsp';
             
             } else {
                var settime = time.substring(1,3);
                realtime = settime;
             }
             
             $("#"+time).addClass("ui-state-highlight");

             var buttonstr = '<button class="button button5" onclick="clicktime("t' + realtime + '")>' + realtime + '시</button>';
             $("#"+time).html("");
             $("#"+time).append(buttonstr);
        }
        
        
        function settimebuttons(){
        	for(var i = 9; i < 25; i++){
$('#sortli').append("<li class='ui-state-default myli' id='t"+i+"' style='color:black'><button class='button button5' onclick='clicktime('t"+i+"') id=''>"+i+"시</button></li>");
        		}
        }
        
        function setthemeicon(themenum){
        	var themeiconsrc = '';
        	
        	if(themenum == 1){
        		themeiconsrc = '<span class="fas fa-bicycle fa-2x pic" style="color:#000;"></span>';
        	} else if (themenum == 2){
        		themeiconsrc = '<span class="fas fa-moon fa-2x" style="color:#000;"></span>';
        	}else if (themenum == 3){
        		themeiconsrc = '<span class="fab fa-fort-awesome fa-2x" style="color:#000;"></span>';
        	}else if (themenum == 4){
        		themeiconsrc = '<span class="fas fa-utensils fa-2x" style="color:#000;"></span>';
        	}else if (themenum == 5){
        		themeiconsrc = '<span class="fab fa-pagelines fa-2x" style="color:#000;"></span>';
        	}else if (themenum == 6){
        		themeiconsrc = '<span class="fas fa-tree fa-2x" style="color:#000;"></span>';
        	}else if (themenum == 0){
        		themeiconsrc = '<span></span>';
        	}
        	
        	
		return themeiconsrc;
        	
        }

        function setthemeicon2(themenum){
        	var themeiconsrc = '';
        	
        	if(themenum == 1){
        		themeiconsrc = '<span class="fas fa-bicycle fa-2x pic" style="color:#000;"';
        	} else if (themenum == 2){
        		themeiconsrc = '<span class="fas fa-moon fa-2x" style="color:#000;"';
        	}else if (themenum == 3){
        		themeiconsrc = '<span class="fab fa-fort-awesome fa-2x" style="color:#000;"';
        	}else if (themenum == 4){
        		themeiconsrc = '<span class="fas fa-utensils fa-2x" style="color:#000;"';
        	}else if (themenum == 5){
        		themeiconsrc = '<span class="fab fa-pagelines fa-2x" style="color:#000;"';
        	}else if (themenum == 6){
        		themeiconsrc = '<span class="fas fa-tree fa-2x" style="color:#000;"';
        	}else if (themenum == 0){
        		themeiconsrc = '<span';
        	}
        	
		return themeiconsrc;
        	
        }
        
        
        $("#daybtn").click(function(){
        	currentid = "<%=session.getAttribute("id")%>";
           var day = $('#datepicker').val();
           var testday = day.substring(0,4);

           // 날짜를 선택하지 않고 불러오기를 클릭하면 알림 후 return
           if(testday >= 2018){
           } else{
              alert('날짜를 선택해주세요');
              return;
           }

         $.ajax(
            {
               url:"schedulesfind.db",
               data:{
                        "userid" : currentid,
                        "day" : day
                       },
               type:"POST",
               dataType:"json",
               success:function(rdata)
               {   
                  console.log(rdata);

                  $('#sortli').empty();
                  // 삭제 버튼도 만들어줘야 한다
                  // $('#sortablelist').append('<img src="images/bada.jpg">');
                  // 일정이 1시각 단위라도 있으면 success 함수가 발생
for(var i = 9; i < 25; i++){

if(i == 9){
$('#sortli').append("<li class='ui-state-default myli' id='t"+i+"' style='color:black'><button class='button button5' onclick='clicktime('t"+i+"')>&nbsp"+i+"시&nbsp</button></li>");
continue;
}

$('#sortli').append("<li class='ui-state-default myli' id='t"+i+"' style='color:black'><button class='button button5' onclick='clicktime('t"+i+"')>"+i+"시</button></li>");
}         

var idtime = 9;
$(rdata).each(function (){
		
var time = 't' + idtime;
$("#"+time).addClass("ui-state-highlight");
      
var buttonstr = '<button class="button button5" id = "' + this.contentnum + '">' + idtime + '시</button>';
var themeicon = setthemeicon(this.themenum);
var text = this.title;
var nbsp = '&nbsp&nbsp&nbsp';
      
$("#"+time).html("");

if(this.contentnum == 0){
$("#"+time).append(buttonstr+nbsp+themeicon+nbsp+text);
}else{
var cancelbutton = '<button class="button7">x</button>';
$("#"+time).append(buttonstr+cancelbutton+nbsp+themeicon+nbsp+text);
}
idtime+=1;
	                      
                  		}); //end-each
               },
               
               error:function(xhr){
                  
                  // 여기서 에러가 나는 것은 유저는 존재하지만
                  // 해당 날짜의 일정이 1시각 단위라도 없으면
                  // 에러가 난다
                  // 착각하면 안되는 것은 schedules 상에는 있어도
                  // timesheet에 한 시각이라도 없으면 에러가 난다는 것이다
                  
                  alert('해당 날짜의 일정이 없습니다');
                  
					// 비우고 깔끔한 디브 형성하기
					$('#sortli').empty();
					settimebuttons();                  
               }
                  
            }
         ); // end-ajax
         
        });
        
        
        
       $("#timetablesavebtn").click(function (){
    	   currentid = "<%=session.getAttribute("id")%>";
        	
    	// 선택한 일정표 날짜
    	var day = $('#datepicker').val();
    	 
    // 빈 일정일 경우 id setting-> 0connum
    for(var i = 9; i < 25; i++){
    	var idck = $("#t" + i + ">button").attr('id');
    	if(typeof idck == "undefined"){
    		$("#t" + i + ">button").attr('id','0');
    	  }
  	   }

 	 var timetable = [];
 	 for(var i = 9; i < 25; i++){
		   var contentnum = $("#t"+ i +">button").attr('id');
		timetable.push(contentnum);	   
 	 }
 	  
 	  
 	   var data = { "userid" : currentid,
                    "day" : day,
                    "timetable" : timetable,
 	   }

           $.ajax(
         
                {
                	
                 url:"inserttimetable.db",
                 
                 data:data,
                 
                 type:"POST",
                 
                 dataType:"json",
                 
                 success:function(rdata){
                    alert('일정이 저장되었습니다. "일정관리"에서 일정을 확인하세요!');
                 },
                
                 error:function(xhr){
                          alert('error :' + xhr.status + "/" + xhr.statusText);
                      }
                 
                } 
                 
           ); // end-ajax
           
        });
        
        </script>
</html>