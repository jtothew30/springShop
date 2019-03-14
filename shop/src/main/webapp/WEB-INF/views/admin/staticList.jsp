<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>관리자페이지-재고관리</title>
	<link rel="stylesheet" href="../resources/css/foundation.css">
	 <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      var agemap = JSON.parse('${ageList}');
      var genermap = JSON.parse('${genderList}');
      
      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(ageChart);
	  google.charts.setOnLoadCallback(genderChart);
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function ageChart() {
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Age');
        data.addColumn('number', 'Count');
        data.addRows([
          ['10대', agemap.a],
          ['20대', agemap.b],
          ['30대', agemap.c],
          ['40대', agemap.d],
          ['50대', agemap.e],
          ['60대', agemap.f],
          ['기타', agemap.g],
        ]);

        // Set chart options
        var options = {'title':'가입된 회원 연령대',
        		'titleTextStyle':{
        			'fontSize': 30,
        			'bold': true,
        		},
        				'is3D': true,
                       'width':800,	
                       'height':600};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('agechart_div'));
        chart.draw(data, options);
      }
      
      function genderChart(){
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'gender');
          data.addColumn('number', 'Count');
          data.addRows([
            ['남성', genermap.m],
            ['여성', genermap.f],
          ]);

          var options = {'title':'가입된 회원 성별',
        		  'titleTextStyle':{
          			'fontSize': 30,
          			'bold': true,
          		},
                         'width':800,	
                         'height':600};

          var chart = new google.visualization.PieChart(document.getElementById('genderchart_div'));
          chart.draw(data, options);
      }
    </script>
</head>
<body>
<c:import url="adminNav.jsp" />
	<div class="row">
    <!--Div that will hold the pie chart-->
    
    <div class="columns large-7" id="agechart_div"></div>
    <div class="columns large-5" id="genderchart_div"></div>
    </div>
</body>
</html>