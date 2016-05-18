<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="css/validation.css">
	<link rel="stylesheet" href="jQuery/demos.css"/>
	<link rel="stylesheet" href="jQuery/themes/bs/jquery-ui.css"> 
	<script src="jQuery/jquery-1.9.0.js"></script>
	<script src="jQuery/ui/jquery-ui.js"></script>
	<script src="jQuery/ui/jquery.ui.position.js"></script>
	<script src="jQuery/ui/jquery.ui.core.js"></script>
	<script src="jQuery/ui/jquery.ui.widget.js"></script>
	<script src="jQuery/ui/jquery.ui.button.js"></script>
	<script src="jQuery/ui/jquery.ui.mouse.js"></script>
	<script src="jQuery/ui/jquery.ui.resizable.js"></script>
	<script src="jQuery/ui/jquery.ui.draggable.js"></script>
	<script src="jQuery/jquery.browser.min.js"></script>
	<script src="jQuery/ui/jquery.ui.datepicker.js"></script>
	<script src="jQuery/ui/jquery.ui.dialog.js"></script>
	<script src="jQuery/ui/jquery.ui.menu.js"></script>
	<script src="jQuery/ui/jquery.ui.autocomplete.js"></script>
	<script src="jQuery/ui/jquery.ui.slider.js"></script>
	<script src="jQuery/ui/jquery.ui.datepicker.js"></script>
	<script src="jQuery/ui/jquery-ui-timepicker-addon.js"></script>
	<script src="jQuery/jquery.populate.js"></script>
	
	<script src="jQuery/ui/jquery.ui.effect.js"></script>
	<script src="jQuery/ui/jquery.ui.effect-blind.js"></script>
	<script src="jQuery/ui/jquery.ui.effect-explode.js"></script>
	
	<script src="jQuery/jquery.validate.js"></script>
	<script src="jQuery/json.min.js"></script>
	<script src="jQuery/jquery.json.js"></script>
	
	<link rel="stylesheet" type="text/css" media="screen" href="jqGrid/css/ui.jqgrid.css" />
		<script src="jqGrid/js/i18n/grid.locale-en.js" type="text/javascript"></script>
		<script src="jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>


<script type="text/javascript">
$(function(){
    var windowH = $(window).height();
    var wrapperH = $('#wrapper').height();
    if(windowH > wrapperH) {                            
        $('#wrapper').css({'height':($(window).height())+'px'});
    } 
  
    $(window).resize(function(){
        var windowH = $(window).height();
        var wrapperH = $('#wrapper').height();
        var differenceH = windowH - wrapperH;
        var newH = wrapperH + differenceH;
            $('#wrapper').css('height', (newH)+'px');
    })          
});
</script>
<style type="text/css">
    body {
        margin:0px;
        padding:0px;
        height:100%;
        overflow:hidden;
    }
 
    .page {
        min-height:100%;
        position:relative;
    }
     
    .header {
        padding:10px;
        width:100%;
        text-align:center;
    }
     
    .content {
            padding:10px;
            padding-bottom:20px; /* Height of the footer element */
            overflow:hidden;
    }
     
    .menu {
        padding:50px 10px 0px 10px;
        width:200px;
        float:left;
    }
 
    .body {
        margin:50px 10px 0px 250px;
    }
     
    .footer {
        clear:both;
        position:absolute;
        bottom:0;
        left:0;
        text-align:center;
        width:100%;
        height:20px;
    }
    /**table {
    	border-collapse: separate;
    	border-spacing: 6px;
	}**/
	
	.layoutTable {
	    border: 1px solid black;
	}
	html, body {
    height:100%;
	}
	#wrapper {
	    min-height:100%;
	}
     
    </style>

</head>
<body>
<div id="wrapper" style="height: 80%; overflow: auto;">
<table cellpadding="1" cellspacing="1" align="center" width="80%" height="100%" class="layoutTable">
	<tr style="border: 1px solid black">
		<td height="20%" colspan="2" bgcolor="#29558C"><tiles:insertAttribute name="header" />
		</td>
	</tr>
	<tr>
		<td width="80%" height="100%" valign="top"><tiles:insertAttribute name="body" /></td>
		<td height="100%"  width= "15%" valign="top" bgcolor="#29558C"><tiles:insertAttribute name="menu" /></td>
	</tr>

</table>
</div>
</body>
</html>
