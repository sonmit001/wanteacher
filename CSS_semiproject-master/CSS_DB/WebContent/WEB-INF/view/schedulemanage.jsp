<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<title>��������</title>
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

<style type="text/css">
.button {
		background-color: #bafcea;
		border: none;
		color: white;
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

.button4{
        border-radius: 12px;
        font-family:'BM JUA','����ǹ��� �־�';
        font-size: 15px";
        width: 140px;
        color: #000000;
        }

.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-state-active.ui-button:hover 
{		
		color: #000000;
		border: 1px solid #D8D8D8;
		background: #bafcea;
		border:0;
		outline:0;
		}
			
.ui-selectmenu-button.ui-button {
   		text-align: center;
   		width: 6em;
   		border:0;
   		outline:1px solid #D8D8D8;
		}
</style>

<script>
$( function() {
    $( "#selectmonth" ).selectmenu();
 
    $('#selectmonth').on('selectmenuchange', function() {
    	alertbuttonselect();
    });
    
    
    
});

</script>
</head>

 <style type="text/css">
   
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
         font-family:'BM JUA','����ǹ��� �־�';
         font-size: 25px";
         width: 140px;
         color: #000000;
         
         }

    .button5 {
         border-radius: 12px;
         font-family:'BM JUA','����ǹ��� �־�';
         font-size: 20px";
         width: 100px;
         color: #000000;
         }
  
</style>




<body>

<!-- header -->
<jsp:include page="../include/header.jsp"></jsp:include>

    <!-- content -->
  <div class="container" style="padding-top: 50px; min-height:798px;">
		<div class="jumbotron" style="background-repeat: no-repeat; background-size: 100% 100%; height:300px; background-image: url('images/couple3.jpg');">
    </div><!-- end/jumbotron -->

<div class="row"> <!-- row 1-->
<div class="col-lg-12 col-sm-6">
	<fieldset>

	
	        &nbsp&nbsp&nbsp<select name="selectmonth" id="selectmonth">
						      <option value = '1'>1��</option>
						      <option value = '2'>2��</option>
						      <option value = '3'>3��</option>
						      <option selected="selected" value = '4'>4��</option>
						      <option value = '5'>5��</option>
						      <option value = '6'>6��</option>
						      <option value = '7'>7��</option>
						      <option value = '8'>8��</option>
						      <option value = '9'>9��</option>
						      <option value = '10'>10��</option>
						      <option value = '11'>11��</option>
						      <option value = '12'>12��</option>
						    </select>
						    
    &nbsp&nbsp&nbsp<button class="button button4" id="mybtn">���� ����</button>
	&nbsp&nbsp&nbsp<button class="button button4" id="partnerbtn">��Ʈ�� ����</button>
	</fieldset>
	</div><!-- end/col-lg-12 -->
</div> <!-- end/row 1-->

<div class="row"> <!-- row 2-->
	<div class="col-lg-12 col-sm-6" id="main_col"></div>
	<div><br><br></div>
	
</div><!-- end/row 2 -->

</div><!-- end/container -->


<!-- footer -->
<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
<script>

// ���� ���Ӿ��̵� ���ǿ��� ������
var currentid = "<%=session.getAttribute("id")%>";

// ������ �� ��ȭ�� �߻��ϴ� �Լ�
// ���� �� �˸��� ���� ���� Ȥ�� ��Ʈ�� ���� ���� �䱸
function alertbuttonselect(){
	var month = $('#selectmonth').val();
	alert(month + '���� �����ϼ̽��ϴ�.\n"���� ����" Ȥ�� "��Ʈ�� ����"�� Ŭ�����ּ���.');
}


// �׸� Ŭ���� ���� �Լ�
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


// �׽�Ʈ 1��ư
$('#testbtn1').click(function(){
	alert('test1');
});

// �׽�Ʈ 2��ư
$('#testbtn2').click(function(){
	alert('test2');
});


function btnclick(){
	alert($(this).attr("seq"));
}

// ���� ���� ��ư
$('#mybtn').click(function(){
	
	//�ش� �⵵�� ����(�������� ����)
	//���� month�� ����
	var month = $('#selectmonth').val();
	$.ajax(
	{
	type:"POST",
	url:"showmytimetables.db",
	data:{userid: currentid, month:month},
	dataType:"json",
	success:function(rdata){
		console.log(rdata);
		$('#main_col').empty();
		$(rdata).each(function(){

console.log(this);
console.log(this.day);

var coldiv_start = '<div class="col-lg-4">';
var ul_start = '<ul id="sortable" class="myul">';

var clocks = this.timesheetandcontent_dtolist;
var li_clock = '';
	$(clocks).each(function(index, ele){
		
		var time = index + 9;
		var themeicon = setthemeicon(this.themenum);
		
		if(time == 9){
		li_clock += '<li class="ui-state-default myli" style="color:black"><button class="button button5">&nbsp' + time + '��&nbsp</button>' + themeicon + ele.title +'</li>';
		} else {
		li_clock += '<li class="ui-state-default myli" style="color:black"><button class="button button5">' + time + '��</button>' + themeicon + ele.title +'</li>';
		}
	}); // end - clocks each

var ul_end = '</ul>';
var coldiv_end = '</div>';
var textdiv = '<div style="font-size: 20px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp' + this.day + '</div>';
var day = this.day;
var changegobutton = '<li><button class="button button4" value="'+ this.day +'" style="width:250px; font-size: 25px">����ǥ �����ϱ�</button></li>'; 

$("#main_col").append(coldiv_start + textdiv + ul_start + li_clock + changegobutton +ul_end + coldiv_end);
			
		}); // end-rdata.each
		
		$('.button4').on("click", function(){
			
			var temp = $(this).attr("value");
			temp = temp.toString();
			var datearr = temp.split('-');
			location.href = "zzim2.db?changeday1=" + datearr[0] + "&changeday2=" + datearr[1] + "&changeday3=" + datearr[2];
		});
		
	},
	error:function(xhr){
        alert('error :' + xhr.status + "/" + xhr.statusText);
	}
	
    }); // end - ajax
	
}); // end - ���� ���� ��ư



// ��Ʈ�� ���� ��ư
$('#partnerbtn').click(function(){
	var partnerid = '';

	$.ajax(
			{
			type:"POST",
			
			url:"findpartner.db",
			
			data:{"userid": currentid},
			
			dataType:"json",
			
			success:function(rdata){
				 $(rdata).each( function(){ 
		        	 partnerid=this;
		         });
				 
		         showPartnerTimetables(partnerid);         
			},
			error:function(xhr){
		        alert('error :' + xhr.status + "/" + xhr.statusText);
				}
    }); // end - ajax
	
}); // end - ��Ʈ�� ���� ��ư


// ��Ʈ�� ���� ��� �����ִ� �Լ�
// �񵿱�� ��Ʈ�� ���̵� �����ͼ� click�̺�Ʈ ���ε��ؼ� ���� �� ����
function showPartnerTimetables(partnerid){
		
		if(partnerid.length<1){
				alert('��Ʈ�ʰ� �����ϴ�. ��Ʈ�ʸ� ������ּ���');
				return;
			   }
		
		$('#main_col').empty();
		//�ش� �⵵�� ����(�������� ����)
		//���� month�� ����
		var month = $('#selectmonth').val();
		$.ajax(
		{
		type:"POST",
		url:"showmytimetables.db",
		data:{userid: partnerid, month:month},
		dataType:"json",
		success:function(rdata){
			
			alert('��Ʈ���̽� ' + partnerid + '���� �������Դϴ�');    
			
			console.log(rdata);
			
			$(rdata).each(function(){

	console.log(this);
	console.log(this.day);

	var coldiv_start = '<div class="col-lg-4">';
	var ul_start = '<ul id="sortable" class="myul">';

	var clocks = this.timesheetandcontent_dtolist;
	var li_clock = '';
		$(clocks).each(function(index, ele){
			var time = index + 9;
			var themeicon = setthemeicon(this.themenum);
			
			if(time == 9){
			li_clock += '<li class="ui-state-default myli" style="color:black"><button class="button button5">&nbsp' + time + '��&nbsp</button>' + themeicon + ele.title +'</li>';
			} else {
			li_clock += '<li class="ui-state-default myli" style="color:black"><button class="button button5">' + time + '��</button>' + themeicon + ele.title +'</li>';
			}
		}); // end - clocks each

	var ul_end = '</ul>';
	var coldiv_end = '</div>';
	var textdiv = '<div style="font-size: 20px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp' + this.day + '</div>';

	var day = this.day;
	var changegobutton = '<li><button class="button button4" value="'+ this.day +'" style="width:250px; font-size: 25px">����ǥ �����ϱ�</button></li>'; 

	$("#main_col").append(coldiv_start + textdiv + ul_start + li_clock + changegobutton +ul_end + coldiv_end);
				
			}); // end-rdata.each
			
			$('.button4').on("click", function(){
				
				var temp = $(this).attr("value");
				temp = temp.toString();
				var datearr = temp.split('-');
				alert("��ưŬ��");
				location.href = "zzim2.db?changeday1=" + datearr[0] + "&changeday2=" + datearr[1] + "&changeday3=" + datearr[2];

			});
			
		},
		error:function(xhr){
	        alert('error :' + xhr.status + "/" + xhr.statusText);
		}
		
	    }); // end - ajax
		
		
} // end - showPartenrTimetables()

</script>
</html>















