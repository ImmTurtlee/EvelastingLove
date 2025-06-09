$(function() {
    "use strict";
		
    // chart 2

		var ctx = document.getElementById("chart2").getContext('2d');
		var myChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: [
					"Bạch Dương", "Kim Ngưu", "Song Tử", "Cự Giải", "Sư Tử", "Xử Nữ",
					"Thiên Bình", "Bọ Cạp", "Nhân Mã", "Ma Kết", "Bảo Bình", "Song Ngư"
				],
				datasets: [{
					backgroundColor: [
						"#FF6384", // Bạch Dương
						"#36A2EB", // Kim Ngưu
						"#FFCE56", // Song Tử
						"#4BC0C0", // Cự Giải
						"#9966FF", // Sư Tử
						"#FF9F40", // Xử Nữ
						"#C9CBCF", // Thiên Bình
						"#FF6384AA", // Bọ Cạp
						"#36A2EBAA", // Nhân Mã
						"#FFCE56AA", // Ma Kết
						"#4BC0C0AA", // Bảo Bình
						"#9966FFAA"  // Song Ngư
					],
					// Bạch Dương: 18%, Sư Tử: 16%, Song Ngư: 14% (tổng 48%)
					// 9 cung còn lại chia đều 52%: mỗi cung ~5.78%
					data: [18, 5.78, 5.78, 5.78, 16, 5.78, 5.78, 5.78, 5.78, 5.78, 5.78, 14],
					borderWidth: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
				}]
			},
		options: {
			maintainAspectRatio: false,
		   legend: {
			 position :"bottom",	
			 display: false,
			    labels: {
				  fontColor: '#ddd',  
				  boxWidth:15
			   }
			}
			,
			tooltips: {
			  displayColors:false
			}
		   }
		});
		

		
		
   });	 
   