<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
	<title>Spring3MVC + WEKA Series </title>
	
	 <style>
      #map {
        width: 500px;
        height: 400px;
      }
    </style>
    
	<script type="text/javascript">
	$(document).ready( function (){
		
		$('#dropdownPredictionSelector').change(function(){
			var option = $('#dropdownPredictionSelector').find('option:selected').val();
			//salert(option);
			if(option=="primaryType"){
				$('#dropdownDatasetSizeSelector').children('option[value="5000"]').show();
				$('#dropdownDatasetSizeSelector').children('option[value="10000"]').show();
				$('#dropdownDatasetSizeSelector').children('option[value="25000"]').show();
				$('#dropdownDatasetSizeSelector').children('option[value="50000"]').show();
				$('#dropdownDatasetSizeSelector').children('option[value="ALL"]').show();
			}else{
				$('#dropdownDatasetSizeSelector').val("100");
				$('#dropdownDatasetSizeSelector').children('option[value="5000"]').hide();
				$('#dropdownDatasetSizeSelector').children('option[value="10000"]').hide();
				$('#dropdownDatasetSizeSelector').children('option[value="25000"]').hide();
				$('#dropdownDatasetSizeSelector').children('option[value="50000"]').hide();
				$('#dropdownDatasetSizeSelector').children('option[value="ALL"]').hide();
			}
			
			
		});
		$('#dropdownDatasetSizeSelector').change(function(){
			var option = $('#dropdownDatasetSizeSelector').find('option:selected').val();
		});			
			
		
		$('#submitPredictionCriteriaButton').click(function() {
			$("#id option:selected").val();
			$("#responseDiv").html("");
			 $.ajax({
				  type: "POST",
				  url: "crimePrediction.htm",
				  data : {
					  predictionCriteria : $('#dropdownPredictionSelector').find('option:selected').val(),
					  datasetSize : $('#dropdownDatasetSizeSelector').find('option:selected').val()
				  },
				  success: function(result){
					  $("#responseDiv").html("" );
				        $("#responseDiv").append(result );
				    }
				}); 
		});
		
		var crimePredictionHomeJQGrid=jQuery("#crimePredictionHomeJQGTable").jqGrid({
		   	url:'crimePrediction.htm',
		   	mtype : "POST",
		   	jsonReader: {
	                        repeatitems: false,
	                        id: "id"
	                        
	                    },
		   	datatype: "local",
		   	datatype: 'json',
		   	colNames:['Select','ID','Actual Value', 'Predicted Value'],
		   	           
		   	colModel:[
		   		
		   		 {name: 'id', width: 50, fixed: true, align: 'center', resizable: false, sortable: false,
                        formatter: function(cellValue) {
                            return '<input type="radio" name="crimePredictionSelector" id="' + cellValue + '" />';
                        }},
                {name:'id',index:'id',hidden:true},
		   		{name:'actualValue',index:'actualValue', width:200},
		   		{name:'predictedValue',index:'predictedValue', width:200}
		   	],
		   	rowNum:10,
		   	rowList:[10,20,30,40,50],
		   	rownumbers:true,
		   	height:120,
		   	pager: '#crimePredictionHomeJQGTablePagingToolbar',
		   	sortname: 'id',
		    viewrecords: true,
		    loadonce:false,
		    sortorder: "asc",
		    caption:"Crime Prediction",
		    loadtext:'Loading....',
		    emptyrecords:"There are no results to display",
		    pgtext : "Page {0} of {1}",
		    gridComplete: function() {
	            var recs = $("#crimePredictionHomeJQGTable").getGridParam("records");
	            
	            $("#crimePredictionHomeJQGTable input[type='radio']").click(function () {
        				});
	        }
		});
		
		
		function reloadCrimePredictionStore(predictionCriteria1,datasetSize1){
			jQuery("#crimePredictionHomeJQGTable").jqGrid('setGridParam',{
					datatype:'json',
					url:"crimePrediction.htm",
					postData:{
						predictionCriteria : predictionCriteria1,
						  datasetSize : datasetSize1
					},
					page:1
					}).trigger("reloadGrid");
			$("#responseDiv").html("" );
	        $("#responseDiv").append(result );
			
		}
		

	});
	
	</script>
</head>
<body>



<h3><u><spring:message code="label.caption"/></u></h3>

<!-- <table> 
<tr>
<td> -->
<table >

<tr height="25px">
	<td>
<!-- 	Prediction Criteria  -->
		 <spring:message code="label.PredictionCriteria"/>
	</td>
	<td><select id="dropdownPredictionSelector">
        <option value="location"> <spring:message code="label.option1"/></option>
        <option value="locationWithoutAttrSelection"><spring:message code="label.option2"/></option>
        <option value="primaryType"><spring:message code="label.option3"/></option>
        <option value="primaryTypeWithoutAttrSelection"><spring:message code="label.option4"/></option>
        <option value="crimeDescription"><spring:message code="label.option5"/></option>
        <option value="multiTargetCrimePrediction"><spring:message code="label.option6"/></option>
    </select></td>
</tr>
<tr height="25px">
	<td>
<!-- 	Dataset Size -->
<spring:message code="label.DatasetSize"/>
	</td>
	<td><select id="dropdownDatasetSizeSelector" style="width: 100%">
        <option value="100">100</option>
        <option value="500">500</option>
        <option value="1000">1000</option>
        <option value="3000">3000</option>
<!--         <option value="4000">4000</option> -->
<!--         <option value="5000">5000</option> -->
<!--         <option value="10000">10000</option> -->
<!--         <option value="25000">25000</option> -->
<!--         <option value="50000">50000</option> -->
<!--         <option value="ALL">ALL</option> -->
    </select></td>
</tr>
<tr>
<td></td>
<td>
<!-- <input type="button" id="submitPredictionCriteriaButton" value="Submit"> -->
<button id="submitPredictionCriteriaButton"> <spring:message code="label.Submit"/></button>
 </td>
</table>

<!-- <div id="crimePredictionHomeJQGTableWrapper"> -->
<!--  <table id="crimePredictionHomeJQGTable"></table> -->
<!-- <div id="crimePredictionHomeJQGTablePagingToolbar"></div> -->
<!-- </div> -->
<br/>
 <div id="responseDiv" style="width: 700px;height:400px; overflow: scroll;">${model.predictionResult}</div> 
<!-- </td>
<td>

</td>
</tr>
</table>
<div id="map-canvas"></div> -->


</body>
</html>
