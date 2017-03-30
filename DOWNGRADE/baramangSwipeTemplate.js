BaramangSwipe.template.promotionBanner = function(obj, pagination, options) {
	var promotion = $(obj).baramangSwipe(options && options.childTag || "figure", $.extend({	
		elementCountPerGroup: 1,
		isLoop: true,
		isAutoScroll: false,
		autoScrollDirection: "right",
		/*autoScrollTime: 5000 */
	}, options));
	
	promotion.success = function() {
		$(pagination).children().removeClass("active").eq(promotion.currentPageNo).addClass("active");
	};
	
	return promotion;
};
/* �߰� */
BaramangSwipe.template.specialBanner = function(obj, pagination, options) {
	var special = $(obj).baramangSwipe(options && options.childTag || "figure", $.extend({	
		elementCountPerGroup: 1,
		isLoop: true,
		isAutoScroll: false,
		autoScrollDirection: "right",
		/*autoScrollTime: 5000 */
	}, options));
	
	special.success = function() {
		$(pagination).children().removeClass("active").eq(promotion.currentPageNo).addClass("active");
	};
	
	return special;
};
BaramangSwipe.template.goodsList = function(obj, options) {

	var goodsList = $(obj).baramangSwipe(options && options.childTag || "li", $.extend({
		elementWidth: 80,
		isLoop: true
	}, options));

		/*alert(document.getElementById("t1").value);
		alert(document.getElementById("t2").value);
		alert(document.getElementById("t3").value);
		alert(document.getElementById("t4").value);
		alert(document.getElementById("t5").value);
		alert(document.getElementById("t6").value);*/

		if (document.getElementById("t1").value=="1")
		{
			document.getElementById("tab1").style.display = "block";
			document.getElementById("tab2").style.display = "none";
			document.getElementById("tab3").style.display = "none";
			document.getElementById("tab4").style.display = "none";
		}
		if (document.getElementById("t2").value=="2")
		{
			document.getElementById("tab1").style.display = "block";
			document.getElementById("tab2").style.display = "none";
			document.getElementById("tab3").style.display = "none";
			document.getElementById("tab4").style.display = "none";
		}
		if (document.getElementById("t3").value=="3")
		{
			document.getElementById("tab1").style.display = "block";
			document.getElementById("tab2").style.display = "none";
			document.getElementById("tab3").style.display = "none";
			document.getElementById("tab4").style.display = "none";
		}

		if (document.getElementById("t4").value=="4")
		{
			document.getElementById("tab1").style.display = "none";
			document.getElementById("tab2").style.display = "block";
			document.getElementById("tab3").style.display = "none";
			document.getElementById("tab4").style.display = "none";
		}
		if (document.getElementById("t5").value=="5")
		{
			document.getElementById("tab1").style.display = "none";
			document.getElementById("tab2").style.display = "block";
			document.getElementById("tab3").style.display = "none";
			document.getElementById("tab4").style.display = "none";
		}
		if (document.getElementById("t6").value=="6")
		{
			document.getElementById("tab1").style.display = "none";
			document.getElementById("tab2").style.display = "block";
			document.getElementById("tab3").style.display = "none";
			document.getElementById("tab4").style.display = "none";
		}
		

	return goodsList;
};
